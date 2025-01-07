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
    task3.c

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

#include "definitions.h"
#include "portmacro.h"
#include <string.h>

#include "components/log/log.h"

#define TAG "TASK4"
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
    This structure should be initialized by the TASK3_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

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


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void TASK3_Initialize ( void )

  Remarks:
    See prototype in task4.h.
 */

void TASK4_Initialize ( void )
{
    /* Place the App state machine in its initial state. */


    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void TASK4_Tasks ( void )

  Remarks:
    See prototype in task4.h.
 */

extern volatile uint16_t tgt_cnt;
extern uint16_t ibi_data[];

extern volatile uint16_t ibi_cnt;
extern uint8_t buff[1000][4];

void TASK4_Tasks ( void )
{
    LOGI(TAG, "=========== TASK4 ==========");

    LOGI(TAG, "Wait for peripheral initial");
    vTaskDelay(1000 / portTICK_PERIOD_MS );

    LOGI(TAG, "test_ibis_all");
    test_ibis_all(i3c0Dev);
    LOGI(TAG, "test_ibis_all end\n\n\n");

    LOGI(TAG, "tgt_test_ibis_all");
    tgt_cnt = ibi_cnt = 0;
    tgt_test_ibis_all(i3c1Dev);
    do {
      vTaskDelay(1 / portTICK_PERIOD_MS );
    } while (ibi_cnt < 1000);
    LOGI(TAG, "test_ibis_all tgt_cnt: %d", tgt_cnt);
    LOGI(TAG, "test_ibis_all ibi_cnt: %d", ibi_cnt);

    for(uint16_t ite=0; ite < ibi_cnt; ite++) {
      // LOGI(TAG, "[%04d]: 0x%02x 0x%02x 0x%02x 0x%02x", ite, buff[ite][0], buff[ite][1], buff[ite][2], buff[ite][3]);
      uint16_t idx = ((uint16_t)buff[ite][2] << 8) + buff[ite][3];

      if (idx == ibi_data[ite]) {
        LOGI(TAG, "[%04d]: 0x%02x , idx: %04d, data: %04d", ite+1, buff[ite][0], idx, ibi_data[ite]);
      } else {
        LOGE(TAG, "[%04d]: 0x%02x , idx: %04d, data: %04d", ite+1, buff[ite][0], idx, ibi_data[ite]);
      }
    }
    tgt_cnt = ibi_cnt = 0;
    LOGI(TAG, "test_ibis_all end\n\n\n");

    while(1)
    {
        /* Run the task again after 10000 msec */
        vTaskDelay(10000 / portTICK_PERIOD_MS );        
    }
}

/*******************************************************************************
 End of File
 */
