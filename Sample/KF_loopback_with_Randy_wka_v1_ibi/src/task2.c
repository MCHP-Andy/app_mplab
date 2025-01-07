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
    task2.c

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

#include "task2.h"
#include "definitions.h"
#include <string.h>

#include "debug/trace.h"

#include "components/log/log.h"

#define TAG "TASK2"

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
    This structure should be initialized by the TASK2_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

TASK2_DATA task2Data;
extern SemaphoreHandle_t uartMutexLock;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void TASK2_Initialize ( void )

  Remarks:
    See prototype in task2.h.
 */

TASK2_DATA task2Context;

extern void DRV_IBI_Task(const struct device *dev);
extern void DRV_TGT_RX_Task(const struct device *dev);
extern void DRV_TGT_TX_Done_Task(const struct device *dev);

extern void test_bcast_ccc_all(struct device *dev);
extern void test_direct_ccc_all(struct device *dev);
extern int test_xfers_all(struct device *dev);
extern int test_ibis_all(struct device *dev);
extern int test_icm42605_all(struct device *dev);

extern int tgt_test_xfers_all(struct device *dev);
extern int tgt_test_ibis_all(struct device *dev);
extern uint32_t get_event(uint32_t *event_id ,uint32_t events_to_wait, bool clear_on_exit);

void TASK2_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    task2Data.state = TASK2_STATE_INIT;

    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}

void task2_state_switch(TASK2_STATES state)
{
    OSAL_CRITSECT_DATA_TYPE intStatus = OSAL_CRIT_Enter(OSAL_CRIT_TYPE_LOW);
    task2Context.state = state;
    OSAL_CRIT_Leave(OSAL_CRIT_TYPE_LOW, intStatus);
}

/******************************************************************************
  Function:
    void TASK2_Tasks ( void )

  Remarks:
    See prototype in task2.h.
 */

void TASK2_Tasks ( void )
{
   
    uint32_t event_bits = 0;

    while (1)
    {
        switch(task2Context.state)
        {
            case TASK2_STATE_INIT:
                LOGI(TAG, "=========== TASK2 ==========");

//#ifndef I3C1_AS_HOST             
                //I3C1 as Secondary Controller or Target
                LOGI(TAG, "I3C target init Start");
                tgt_test_xfers_all(i3c1Dev);
                LOGI(TAG, "I3C target init Done\n");
//                
//#else
//                //I3C1 as host
//                DRV_I3C_Bus_Init(i3c1Dev);
//                
//                // test_bcast_ccc_all(i3c1Dev);
//                // test_direct_ccc_all(i3c1Dev);
//                 //test_xfers_all(i3c1Dev);
//                // test_ibis_all(i3c1Dev);
//                // test_icm42605_all(i3c1Dev);
//                 test_xfers_all(i3c1Dev);
//#endif                  
                task2Context.state = TASK2_STATE_SERVICE_TASKS;
            break;
            case TASK2_STATE_SERVICE_TASKS:
              //  while(OSAL_RESULT_TRUE == OSAL_SEM_Pend(&((struct xec_i3c_data *)(i3c1Dev->data))->events_sem, DRV_IBI_WAIT_MS))
                while(OSAL_RESULT_TRUE == OSAL_SEM_Pend(&((struct xec_i3c_data *)(i3c1Dev->data))->events_sem, OSAL_WAIT_FOREVER))
                {
                    event_bits = get_event(&task2Context.events, DRV_EVENT_BIT_HANDLE_IBI, true);
                    if(event_bits & DRV_EVENT_BIT_HANDLE_IBI)
                    {
                        LOGI(TAG, "HANDLE IBI!!");
                        DRV_IBI_Task(i3c1Dev);
                    }
                    
                    if(event_bits & DRV_EVENT_BIT_HANDLE_TGT_RX)
                    {
                        LOGI(TAG, "HANDLE TARGET RX!!");
                        DRV_TGT_RX_Task(i3c1Dev);
                    }
                    
                    if(event_bits & DRV_EVENT_BIT_HANDLE_TGT_TX_DONE)
                    {
                        LOGI(TAG, "HANDLE TARGET TX DONE!!");
                        DRV_TGT_TX_Done_Task(i3c1Dev);

                        LOGI(TAG, "Prepare data for master");
                        tgt_test_xfers_all(i3c1Dev);
                    }
                }
            default:
            break;
        }
    }
}

TASK2_DATA *get_task2_context(void)
{
    return &task2Context;
}


/*******************************************************************************
 End of File
 */
