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
 *  DEBUG.c
 *      This is the DEBUG.c file, for debugging output message   
 ********************************************************************************** 
 *  SMSC version control information (Perforce):
 *
 *  FILE:     $File: //depot_pcs/FWEng/projects/I3C/maincodeline/KF-I3C-FreeRTOS/kf_freertos_base/firmware/src/config/kf_freertos_fpga/debug/trace.c $
 *  REVISION: $Revision: #1 $
 *  DATETIME: $DateTime: 2023/09/26 02:40:38 $
 *  AUTHOR:   $Author: i64652 $
 *
 *  Revision history (latest first):
 *      #1 Initial Draft
 *		#2 Made disabling and enabling of interrupts proper
 ***********************************************************************************
 */

/** @defgroup DEBUG DEBUG
 *  @{
 */

/** @file DEBUG.c
* \brief Debugger source file
* \author KBCEC Team
* 
* This file implements the Trace module 
******************************************************************************/
/* Imported Header File */
#include "definitions.h"

/* local include */
#include    "trace.h"

/* For redirecting to UART */
extern void SER_init (void);
extern int sendchar (char c);
extern int receivebyte(void);
/*
 **********************************************************************************
 *  debug_init: initialize debug port
 *
 *  Entry Arguments:
 *      void, No argument is passed
 *
 *  Return Parameter:
 *      void, No Return parameter
 *
 *  Export API: Yes
 *
 *  Processing Detail:
 *      1. Enable UART for diverting trace to UART
 *
 **********************************************************************************
 */

void trace_init(void)
{
    SER_init();
    
} /* End of trace_init() */


void _trace_puts(char *buf, unsigned int len)
{
    char *t = buf;
    
    while(len--)
        sendchar(*t++);
    
}

static unsigned int
mini_strlen(const char *s)
{
	unsigned int len = 0;
	while (s[len] != '\0') len++;
	return len;
}

static unsigned int
mini_itoa(int value, unsigned int radix, unsigned int uppercase, unsigned int unsig,
	 char *buffer, unsigned int zero_pad)
{
	char	*pbuffer = buffer;
	int	negative = 0;
	unsigned int	i, len;

	/* No support for unusual radixes. */
	if (radix > 16)
		return 0;

	if (value < 0 && !unsig) {
		negative = 1;
		value = -value;
	}

	/* This builds the string back to front ... */
	do {
		int digit = value % radix;
		*(pbuffer++) = (digit < 10 ? '0' + digit : (uppercase ? 'A' : 'a') + digit - 10);
		value /= radix;
	} while (value > 0);

	for (i = (pbuffer - buffer); i < zero_pad; i++)
		*(pbuffer++) = '0';

	if (negative)
		*(pbuffer++) = '-';

	*(pbuffer) = '\0';

	/* ... now we reverse it (could do it recursively but will
	 * conserve the stack space) */
	len = (pbuffer - buffer);
	for (i = 0; i < len / 2; i++) {
		char j = buffer[i];
		buffer[i] = buffer[len-i-1];
		buffer[len-i-1] = j;
	}

	return len;
}

int
mini_vsnprintf(const char *fmt, va_list va)
{
//	struct mini_buff b;
    char bf[24];
    char ch;


    while ((ch=*(fmt++))) {
        if (ch!='%')
            sendchar(ch);
        else { // format string
            char zero_pad = 0;
            char *ptr;
            unsigned int len;
            ch=*(fmt++);
            /* Zero padding requested */
            if (ch=='0') {
                ch=*(fmt++);
                if (ch == '\0')
                    goto end;
                if (ch >= '0' && ch <= '9')
                    zero_pad = ch - '0';
                ch=*(fmt++);
            }
            switch (ch) {
                case 0:
                    goto end;
                case 'u':
                case 'd':
                    len = mini_itoa(va_arg(va, unsigned int), 10, 0, (ch=='u'), bf, zero_pad);
                    _trace_puts(bf, len);
                    break;
                case 'x':
                case 'X':
                    len = mini_itoa(va_arg(va, unsigned int), 16, (ch=='X'), 1, bf, zero_pad);
                    _trace_puts(bf, len);
                    break;
                case 'c' :
                    sendchar((char)(va_arg(va, int)));
                    break;
                case 's' :
                    ptr = (char*)va_arg(va, char*);
                    _trace_puts(ptr, mini_strlen(ptr));
                    break;
                default:
                    sendchar(ch);
                    break;
            }
        }
    }
end:
    return 0;   // TODO actual number of bytes sent b.pbuffer - b.buffer;
}

#if CONFIG_ENABLE_TRACE
void tracex(const char *fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    mini_vsnprintf( fmt, va);
    va_end(va);
}

/******************************************************************************/
/** print_buf();
* Prints buffer for easy readability
* @param buf - buffer with char data
* @param len - length of data to print
* @return None
*******************************************************************************/
void print_buf(uint8_t *buf, uint32_t len)
{
    uint32_t j, k;
    
    tracex("0x00000000: ");
    for (j=0;j<len;j++)
    {
        tracex("%02x ", buf[j]);        
        k = j+1;
        
        if ((k<len) && !(k % 16)) tracex("\r\n0x%08x: ", k);       
    }
    tracex("\r\n");    
}
#else
void tracex(const char *fmt, ...)
{
    return;     //Do nothing
}
/******************************************************************************/
/** print_buf();
* Prints buffer for easy readability
* @param buf - buffer with char data
* @param len - length of data to print
* @return None
*******************************************************************************/
void print_buf(uint8_t *buf, uint32_t len)
{
    //Do nothing
}
#endif
/**   @}
 */



