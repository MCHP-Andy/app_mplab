/*******************************************************************************
 * Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
 *
 * Subject to your compliance with these terms, you may use Microchip software
 * and any derivatives exclusively with Microchip products. It is your
 * responsibility to comply with third party license terms applicable to your
 * use of third party software (including open source software) that may
 * accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
 * ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *******************************************************************************/

/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    task1.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "task1.h"
#include "definitions.h"
#include <string.h>
#include <dma.h>

#include "debug/trace.h"

#include "tests/test_ccc.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the TASK1_Initialize function.

    Application strings and buffers are be defined outside this structure.
 */
/* Update with actual I3C0 hardware instance base address */
#define I3C0_BASE_ADDRESS       0x40010800U // Primary controller 
#define I3C1_BASE_ADDRESS       0x40010000U // Secondary controller

#define PRINT_SFR(X)        tracex("0x%08X,0x%08X,[%s]\r\n", (uint32_t)&X, X, #X)
#define RESET_SFR(X)        X = 0

TASK1_DATA task1Context;

/* Mutex used to protect the shared resource - UART */
SemaphoreHandle_t uartMutexLock;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary local functions.
 */
extern void DRV_IBI_Task(const struct device *dev);
extern void DRV_TGT_RX_Task(const struct device *dev);
extern void DRV_TGT_TX_Done_Task(const struct device *dev);

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

void reset_i3c_regs_all(void *reg_ptr) {
    struct i3c_xec_regs *regs = (struct i3c_xec_regs *) reg_ptr;
    RESET_SFR(regs->dev_ctrl);
    RESET_SFR(regs->dev_addr);
    RESET_SFR(regs->hw_capability);
    //    RESET_SFR(regs->cmd_queue_port);
    //    RESET_SFR(regs->resp_queue_port);
    //    RESET_SFR(regs->rx_tx_port);
    RESET_SFR(regs->ibi_queue_sts_data);
    RESET_SFR(regs->queue_thld_ctrl);
    RESET_SFR(regs->data_buf_thld_ctrl);
    RESET_SFR(regs->ibi_queue_ctrl);
    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        RESET_SFR(regs->ibi_MR_req_rej);
        RESET_SFR(regs->ibi_SIR_req_rej);
    }
    RESET_SFR(regs->reset_ctrl);
    RESET_SFR(regs->intr_sts);
    RESET_SFR(regs->intr_sts_en);
    RESET_SFR(regs->intr_sig_en);
    RESET_SFR(regs->intr_force);
    RESET_SFR(regs->queue_sts_lvl);
    RESET_SFR(regs->data_buf_sts_lvl);
    RESET_SFR(regs->present_state);
    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        RESET_SFR(regs->ccc_dev_sts);
    }
    RESET_SFR(regs->dev_addr_tbl_ptr);
    RESET_SFR(regs->dev_char_tbl_ptr);
    RESET_SFR(regs->vendor_reg_ptr);

    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        RESET_SFR(regs->slv_mipi_id_val);
        RESET_SFR(regs->slv_pid_val);
        RESET_SFR(regs->slv_char_ctrl);
        RESET_SFR(regs->slv_max_len);
        RESET_SFR(regs->max_rd_turnaround);
        RESET_SFR(regs->max_data_speed);
        RESET_SFR(regs->slv_dbg_sts);
        RESET_SFR(regs->slv_intr_req);
        RESET_SFR(regs->slv_tsx_symbl_timing);
        RESET_SFR(regs->slv_intr_req_data);
        RESET_SFR(regs->slv_ibi_resp);
        RESET_SFR(regs->slv_nack_req);
        RESET_SFR(regs->slv_nack_conf);
        RESET_SFR(regs->slv_inst_sts);
    }

    RESET_SFR(regs->dev_ctrl_ext);
    RESET_SFR(regs->scl_i3c_od_timing);
    RESET_SFR(regs->scl_i3c_pp_timing);
    RESET_SFR(regs->scl_i2c_fm_timing);
    RESET_SFR(regs->scl_i2c_fmp_timing);

    RESET_SFR(regs->scl_ext_lcnt_timing);
    RESET_SFR(regs->scl_ext_term_lcnt_timing);
    RESET_SFR(regs->sda_hld_switch_dly_timing);
    RESET_SFR(regs->bus_free_avail_timing);
    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        RESET_SFR(regs->bus_idle_timing);
    }
    RESET_SFR(regs->scl_low_mst_ext_timeout);
    RESET_SFR(regs->i3c_ver_id);
    RESET_SFR(regs->i3c_ver_type);
    RESET_SFR(regs->queue_size_capability);

    RESET_SFR(regs->host_debug_0);
    RESET_SFR(regs->host_debug_1);
    RESET_SFR(regs->host_config);
    RESET_SFR(regs->host_dma_tx_timeout);
    RESET_SFR(regs->host_dma_rx_timeout);
    RESET_SFR(regs->host_status);
    RESET_SFR(regs->host_interrupt_en);
    RESET_SFR(regs->host_stuck_sda_timeout);
    //RESET_SFR(regs->host_pad_test_en);
    RESET_SFR(regs->host_pad_test);
}

void print_i3c_regs_all(void *reg_ptr) {
    if (NULL == reg_ptr) {
        return;
    }

    struct i3c_xec_regs *regs = (struct i3c_xec_regs *) reg_ptr;

    tracex("*******************************************************************\r\n");
    PRINT_SFR(regs->dev_ctrl);
    PRINT_SFR(regs->dev_addr);
    PRINT_SFR(regs->hw_capability);
    PRINT_SFR(regs->cmd_queue_port);
    PRINT_SFR(regs->resp_queue_port);
    PRINT_SFR(regs->rx_tx_port);
    PRINT_SFR(regs->ibi_queue_sts_data);
    PRINT_SFR(regs->queue_thld_ctrl);
    PRINT_SFR(regs->data_buf_thld_ctrl);
    PRINT_SFR(regs->ibi_queue_ctrl);
    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        PRINT_SFR(regs->ibi_MR_req_rej);
        PRINT_SFR(regs->ibi_SIR_req_rej);
    }
    PRINT_SFR(regs->reset_ctrl);
    PRINT_SFR(regs->intr_sts);
    PRINT_SFR(regs->intr_sts_en);
    PRINT_SFR(regs->intr_sig_en);
    PRINT_SFR(regs->intr_force);
    PRINT_SFR(regs->queue_sts_lvl);
    PRINT_SFR(regs->data_buf_sts_lvl);
    PRINT_SFR(regs->present_state);
    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        PRINT_SFR(regs->ccc_dev_sts);
    }
    PRINT_SFR(regs->dev_addr_tbl_ptr);
    PRINT_SFR(regs->dev_char_tbl_ptr);
    PRINT_SFR(regs->vendor_reg_ptr);

    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        PRINT_SFR(regs->slv_mipi_id_val);
        PRINT_SFR(regs->slv_pid_val);
        PRINT_SFR(regs->slv_char_ctrl);
        PRINT_SFR(regs->slv_max_len);
        PRINT_SFR(regs->max_rd_turnaround);
        PRINT_SFR(regs->max_data_speed);
        PRINT_SFR(regs->slv_dbg_sts);
        PRINT_SFR(regs->slv_intr_req);
        PRINT_SFR(regs->slv_tsx_symbl_timing);
        PRINT_SFR(regs->slv_intr_req_data);
        PRINT_SFR(regs->slv_ibi_resp);
        PRINT_SFR(regs->slv_nack_req);
        PRINT_SFR(regs->slv_nack_conf);
        PRINT_SFR(regs->slv_inst_sts);
    }

    PRINT_SFR(regs->dev_ctrl_ext);
    PRINT_SFR(regs->scl_i3c_od_timing);
    PRINT_SFR(regs->scl_i3c_pp_timing);
    PRINT_SFR(regs->scl_i2c_fm_timing);
    PRINT_SFR(regs->scl_i2c_fmp_timing);

    PRINT_SFR(regs->scl_ext_lcnt_timing);
    PRINT_SFR(regs->scl_ext_term_lcnt_timing);
    PRINT_SFR(regs->sda_hld_switch_dly_timing);
    PRINT_SFR(regs->bus_free_avail_timing);
    if (I3C1_BASE_ADDRESS == (uint32_t) regs) {
        PRINT_SFR(regs->bus_idle_timing);
    }
    PRINT_SFR(regs->scl_low_mst_ext_timeout);
    PRINT_SFR(regs->i3c_ver_id);
    PRINT_SFR(regs->i3c_ver_type);
    PRINT_SFR(regs->queue_size_capability);

    PRINT_SFR(regs->dev_char_tbl1_loc1);
    PRINT_SFR(regs->dev_char_tbl1_loc2);
    PRINT_SFR(regs->dev_char_tbl1_loc3);
    PRINT_SFR(regs->dev_char_tbl1_loc4);
    PRINT_SFR(regs->dev_addr_tbl1_loc1);

    PRINT_SFR(regs->host_debug_0);
    PRINT_SFR(regs->host_debug_1);
    PRINT_SFR(regs->host_config);
    PRINT_SFR(regs->host_dma_tx_timeout);
    PRINT_SFR(regs->host_dma_rx_timeout);
    PRINT_SFR(regs->host_status);
    PRINT_SFR(regs->host_interrupt_en);
    PRINT_SFR(regs->host_stuck_sda_timeout);
    //PRINT_SFR(regs->host_pad_test_en);
    PRINT_SFR(regs->host_pad_test);
    tracex("*******************************************************************\r\n");
}

/*******************************************************************************
  Function:
    void TASK1_Initialize ( void )

  Remarks:
    See prototype in task1.h.
 */

void TASK1_Initialize(void) {
    /* Place the App state machine in its initial state. */
    task1Context.state = TASK1_STATE_INIT;

    /* Create a mutex type semaphore. */
    uartMutexLock = xSemaphoreCreateMutex();

    if (uartMutexLock == NULL) {
        /* There was insufficient FreeRTOS heap available for the semaphore to
        be created successfully. */
        //        UART0_Write((uint8_t*)"Could not create mutex lock\r\n", strlen("Could not create mutex lock\r\n"));
        LOG_ERR("Could not create mutex lock\r\n");
    }
}

extern void test_bcast_ccc_all(struct device *dev);
extern void test_direct_ccc_all(struct device *dev);
extern int test_xfers_all(struct device *dev);
extern int test_ibis_all(struct device *dev);
extern int test_icm42605_all(struct device *dev);

extern int tgt_test_xfers_all(struct device *dev);
extern int tgt_test_ibis_all(struct device *dev);

void task_state_switch(TASK1_STATES state)
{
    OSAL_CRITSECT_DATA_TYPE intStatus = OSAL_CRIT_Enter(OSAL_CRIT_TYPE_LOW);
    task1Context.state = state;
    OSAL_CRIT_Leave(OSAL_CRIT_TYPE_LOW, intStatus);
}

uint32_t get_event(uint32_t *event_id ,uint32_t events_to_wait, bool clear_on_exit)
{
    uint32_t events = 0U;
    if(NULL != event_id) {
        OSAL_CRITSECT_DATA_TYPE intStatus = OSAL_CRIT_Enter(OSAL_CRIT_TYPE_LOW);
        events = *event_id;
        if(clear_on_exit && events) {
            *event_id &= ~(events_to_wait);
        }
        OSAL_CRIT_Leave(OSAL_CRIT_TYPE_LOW, intStatus);
    }
    return events;
}

void set_event(uint32_t *event_id, uint32_t events_to_set)
{
    if(NULL != event_id) {
        OSAL_CRITSECT_DATA_TYPE intStatus = OSAL_CRIT_Enter(OSAL_CRIT_TYPE_LOW);
        *event_id |= events_to_set;
        OSAL_CRIT_Leave(OSAL_CRIT_TYPE_LOW, intStatus);
    }
}

void set_event_from_isr(uint32_t *event_id, uint32_t events_to_set)
{
    if(NULL != event_id) {
        *event_id |= events_to_set;
    }
}

/******************************************************************************
  Function:
    void TASK1_Tasks ( void )

  Remarks:
    See prototype in task1.h.
 */
void TASK1_Tasks(void)
{
    uint32_t event_bits = 0;

    while (1)
    {
        switch(task1Context.state)
        {
            case TASK1_STATE_INIT:
//               LOG_DBG("=========== TASK1 ==========");

               DRV_I3C_Bus_Init(i3c0Dev);
                
                // test_bcast_ccc_all(i3c0Dev);
                // test_direct_ccc_all(i3c0Dev);
                // test_xfers_all(i3c0Dev);
                 test_ibis_all(i3c0Dev);
                // test_icm42605_all(i3c0Dev);
                 //test_xfers_all(i3c0Dev);
 //LOG_DBG("[%s] - Raise IBI MR", __FUNCTION__);
                 //tgt_test_xfers_all(i3c1Dev);
                //tgt_test_ibis_all(i3c1Dev);
                
                task1Context.state = TASK1_STATE_SERVICE_TASKS;
            break;
            case TASK1_STATE_SERVICE_TASKS:
                //while(OSAL_RESULT_TRUE == OSAL_SEM_Pend(&((struct xec_i3c_data *)(i3c0Dev->data))->events_sem, DRV_IBI_WAIT_MS))
                while(OSAL_RESULT_TRUE == OSAL_SEM_Pend(&((struct xec_i3c_data *)(i3c0Dev->data))->events_sem, OSAL_WAIT_FOREVER))
                {
                    event_bits = get_event(&task1Context.events, DRV_EVENT_BIT_HANDLE_IBI | DRV_EVENT_BIT_HANDLE_TGT_RX | DRV_EVENT_BIT_HANDLE_TGT_TX_DONE, true);
                    if(event_bits & DRV_EVENT_BIT_HANDLE_IBI)
                    {
                        DRV_IBI_Task(i3c0Dev);
                    }
					
					if(event_bits & DRV_EVENT_BIT_HANDLE_TGT_RX)
                    {
                        DRV_TGT_RX_Task(i3c0Dev);
                    }
                    
                    if(event_bits & DRV_EVENT_BIT_HANDLE_TGT_TX_DONE)
                    {
                        DRV_TGT_TX_Done_Task(i3c0Dev);
                    }
                }
            default:
            break;
        }
    }
}

TASK1_DATA *get_task1_context(void)
{
    return &task1Context;
}

/*******************************************************************************
 End of File
 */
