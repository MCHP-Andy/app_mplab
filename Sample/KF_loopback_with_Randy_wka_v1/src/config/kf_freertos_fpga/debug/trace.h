/*
 **********************************************************************************
* © 2013 Microchip Technology Inc. and its subsidiaries.
* You may use this software and any derivatives exclusively with
* Microchip products.
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".
* NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
* INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
* AND FITNESS FOR A PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP
* PRODUCTS, COMBINATION WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.
* TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL
* CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF
* FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
* MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE
* OF THESE TERMS.
 **********************************************************************************
 *  DEBUG.H
 *      This is the debug message output definition header
 **********************************************************************************
 *  SMSC version control information (Perforce):
 *
 *  FILE:     $File: //depot_pcs/FWEng/projects/I3C/maincodeline/KF-I3C-FreeRTOS/kf_freertos_base/firmware/src/config/kf_freertos_fpga/debug/trace.h $
 *  REVISION: $Revision: #1 $
 *  DATETIME: $DateTime: 2023/09/26 02:40:38 $
 *  AUTHOR:   $Author: i64652 $
 *
 *  Revision history (latest first):
 *      #xx
 ***********************************************************************************
 */

/** @defgroup DEBUG DEBUG
 *  @{
 */

/** @file DEBUG.h
* \brief Debugger header file
* \author FW Team
* 
* This file contains all function declarations in DEBUG.c
******************************************************************************/
#ifndef TRACE_H
#define TRACE_H

void trace_init(void);
void tracex(const char *fmt, ...);
int trace_gets(char *const buf);

void print_buf(uint8_t *buf, uint32_t len);

//TRACE - Enable/Disable Macro
#define CONFIG_ENABLE_TRACE	1

#if CONFIG_ENABLE_TRACE

#define DEBUG_LEVEL         0       //1 - For important only, 0 - For all debug messages

#define TRACE_INIT()	trace_init()
#define TRACEX(...) tracex(__VA_ARGS__)

#define TR_NLINE     tracex("\r\n")

#define trace0(nbr, cat, lvl, str);                     {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str);TR_NLINE;       \
        }                               \
    }while(0);                          \
}
#define trace1(nbr, cat, lvl, str, p1);                 {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str, p1);TR_NLINE;   \
        }                               \
    }while(0);                          \
}
#define trace2(nbr, cat, lvl, str, p1, p2);             {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str, p1, p2);TR_NLINE;   \
        }                               \
    }while(0);                          \
}
#define trace3(nbr, cat, lvl, str, p1, p2, p3);         {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str, p1, p2, p3);TR_NLINE;   \
        }                               \
    }while(0);                          \
}
#define trace4(nbr, cat, lvl, str, p1, p2, p3, p4);     {       \
    do {                                            \
        if (lvl >= DEBUG_LEVEL)     {               \
            tracex(str, p1, p2, p3, p4);TR_NLINE;   \
        }                                           \
    }while(0);                                      \
}

#define trace11(nbr, cat, lvl, str, p1);                 {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str, p1);TR_NLINE;   \
        }                               \
    }while(0);                          \
}
#define trace12(nbr, cat, lvl, str, p1, p2);             {       \
    do {                                    \
        if (lvl >= DEBUG_LEVEL)     {       \
            tracex(str, p1, p2);TR_NLINE;   \
        }                                   \
    }while(0);                              \
}
#define trace13(nbr, cat, lvl, str, p1, p2, p3);         {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str, p1, p2, p3);TR_NLINE;   \
        }                               \
    }while(0);                          \
}
#define trace14(nbr, cat, lvl, str, p1, p2, p3, p4);     {       \
    do {                                \
        if (lvl >= DEBUG_LEVEL)     {   \
            tracex(str, p1, p2, p3, p4);TR_NLINE;   \
        }                               \
    }while(0);                          \
}
#else

#define TRACE_INIT()
#define TRACEX(...)

#define trace0(nbr, cat, lvl, str);                  
#define trace1(nbr, cat, lvl, str, p1);              
#define trace2(nbr, cat, lvl, str, p1, p2);          
#define trace3(nbr, cat, lvl, str, p1, p2, p3);      
#define trace4(nbr, cat, lvl, str, p1, p2, p3, p4);  

#define trace11(nbr, cat, lvl, str, p1);             
#define trace12(nbr, cat, lvl, str, p1, p2);         
#define trace13(nbr, cat, lvl, str, p1, p2, p3);     
#define trace14(nbr, cat, lvl, str, p1, p2, p3, p4); 


#endif



#endif /* #ifndef TRACE_H */

/**   @}
 */

