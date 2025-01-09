#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-kf_freertos_fpga.mk)" "nbproject/Makefile-local-kf_freertos_fpga.mk"
include nbproject/Makefile-local-kf_freertos_fpga.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=kf_freertos_fpga
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/kf_freertos_fpga/debug/serial.c ../src/config/kf_freertos_fpga/debug/trace.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c ../src/config/kf_freertos_fpga/osal/osal_freertos.c ../src/config/kf_freertos_fpga/peripheral/dma/dma.c ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c ../src/config/kf_freertos_fpga/plib/uart/uart_api.c ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c ../src/config/kf_freertos_fpga/exceptions.c ../src/config/kf_freertos_fpga/freertos_hooks.c ../src/config/kf_freertos_fpga/initialization.c ../src/config/kf_freertos_fpga/interrupts.c ../src/config/kf_freertos_fpga/libc_syscalls.c ../src/config/kf_freertos_fpga/startup_xc32.c ../src/config/kf_freertos_fpga/tasks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/components/log/log.c ../src/tests/test_ccc.c ../src/tests/test_pvt_xfer.c ../src/tests/test_icm42605.c ../src/tests/test_ibis.c ../src/tests/tgt_test_pvt_xfer.c ../src/tests/crc8.c ../src/tests/tgt_test_ibis.c ../src/task1.c ../src/main.c ../src/task2.c ../src/task3.c ../src/task4.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1420773124/serial.o ${OBJECTDIR}/_ext/1420773124/trace.o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ${OBJECTDIR}/_ext/825503660/dma.o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ${OBJECTDIR}/_ext/1732944825/uart_api.o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ${OBJECTDIR}/_ext/29258880/exceptions.o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ${OBJECTDIR}/_ext/29258880/initialization.o ${OBJECTDIR}/_ext/29258880/interrupts.o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ${OBJECTDIR}/_ext/29258880/tasks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/346071803/log.o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/crc8.o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ${OBJECTDIR}/_ext/1360937237/task1.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/task2.o ${OBJECTDIR}/_ext/1360937237/task3.o ${OBJECTDIR}/_ext/1360937237/task4.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1420773124/serial.o.d ${OBJECTDIR}/_ext/1420773124/trace.o.d ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d ${OBJECTDIR}/_ext/825503660/dma.o.d ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d ${OBJECTDIR}/_ext/1732944825/uart_api.o.d ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d ${OBJECTDIR}/_ext/29258880/exceptions.o.d ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d ${OBJECTDIR}/_ext/29258880/initialization.o.d ${OBJECTDIR}/_ext/29258880/interrupts.o.d ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d ${OBJECTDIR}/_ext/29258880/tasks.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/346071803/log.o.d ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d ${OBJECTDIR}/_ext/1521323865/crc8.o.d ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d ${OBJECTDIR}/_ext/1360937237/task1.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/task2.o.d ${OBJECTDIR}/_ext/1360937237/task3.o.d ${OBJECTDIR}/_ext/1360937237/task4.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1420773124/serial.o ${OBJECTDIR}/_ext/1420773124/trace.o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ${OBJECTDIR}/_ext/825503660/dma.o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ${OBJECTDIR}/_ext/1732944825/uart_api.o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ${OBJECTDIR}/_ext/29258880/exceptions.o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ${OBJECTDIR}/_ext/29258880/initialization.o ${OBJECTDIR}/_ext/29258880/interrupts.o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ${OBJECTDIR}/_ext/29258880/tasks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/346071803/log.o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/crc8.o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ${OBJECTDIR}/_ext/1360937237/task1.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/task2.o ${OBJECTDIR}/_ext/1360937237/task3.o ${OBJECTDIR}/_ext/1360937237/task4.o

# Source Files
SOURCEFILES=../src/config/kf_freertos_fpga/debug/serial.c ../src/config/kf_freertos_fpga/debug/trace.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c ../src/config/kf_freertos_fpga/osal/osal_freertos.c ../src/config/kf_freertos_fpga/peripheral/dma/dma.c ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c ../src/config/kf_freertos_fpga/plib/uart/uart_api.c ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c ../src/config/kf_freertos_fpga/exceptions.c ../src/config/kf_freertos_fpga/freertos_hooks.c ../src/config/kf_freertos_fpga/initialization.c ../src/config/kf_freertos_fpga/interrupts.c ../src/config/kf_freertos_fpga/libc_syscalls.c ../src/config/kf_freertos_fpga/startup_xc32.c ../src/config/kf_freertos_fpga/tasks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/components/log/log.c ../src/tests/test_ccc.c ../src/tests/test_pvt_xfer.c ../src/tests/test_icm42605.c ../src/tests/test_ibis.c ../src/tests/tgt_test_pvt_xfer.c ../src/tests/crc8.c ../src/tests/tgt_test_ibis.c ../src/task1.c ../src/main.c ../src/task2.c ../src/task3.c ../src/task4.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-kf_freertos_fpga.mk ${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=CEC1736_S0_2ZW
MP_LINKER_FILE_OPTION=,--script="..\src\config\kf_freertos_fpga\CEC1736_S0_2ZW.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/ac3e15395f79d1cd7bfc49ce46c80fe8cebf3bc3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/8279c0b7bb6ccc86b24d80aeba0a69b95ea19c5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/3895bd71dd19ab5f22c848c8c02e38fbcad5862d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/2c6524ea0f911cf57cc0db7d3f6d2724353805d9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/9563f9fe26ee741ef189e465f31fda49923a2f67 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/73abf51131d21cf43a3a312f7acc553de944fd39 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/e3b7892c3be98b9ee3eba148adbc66121b6837b5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/f84638c0cff600c59dde59e3e93e203f8328511b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/702df97604b663155e2be64e0d92304806008bf3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/9d3430852372c72fab1cda8eaeeb3cb1dd60852b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/fb2ffbfcee3174d4d965b63a5055fbe05658656c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/f77c361c8ce3af9a12e41a11bd27a6caa5c960c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/25528cfde87bcc214e5b0cc446a2939e1059aeab .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/3e5ac8b4750ad3952013676f3af1e32a7f3b5e37 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/44d5434006a6b1f0d3e6d5553eeda2ea477b96bf .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/7b57640519b5ba0138434a5f84c0397d8431ed6a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/902df67216e5126ff7613cd309c684631c604f4a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/24733dc03b4bef13168ac00be13e8800b64c3d89 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/1cb2fc4703f774bbe86b8c4ff0150eba199f8d5b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/ce75f1d7e06ace1fda7b16e3aa19c9eeba356438 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/be5e3edb98bc28ca0fc9a9d4cb544461477b8a6f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/b9391ecd1d38535228cd03331768d779580e4566 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/c73f078184ac04151aa1d1cd87c16ce9ddb1cd82 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/e653ea2f25de174134004f22f599fe257e6d00e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/e118e56e3fe51b2b3bfed36fc10dbf714f741ccc .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/ee2a3c2ca19981ef8bb10dd096b345383b9ae48a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/af71606bbb5798742e68fc346d6affb759d14862 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/5f893a886dd1d4834b2ca408c61da8033db8768c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/45ce1050a6a3fb5a49e505ce9fbb80c85746239b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/d87d494933099782870e6c56219b7c70b93218e4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/aa375e4e0776bdb00f8757745eaac0b122a4e3e8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/b64e91faf5bb17e622b55f51cb786788291c3c47 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/618a3b889762acc8b1d27b5b2dc0368270fb7dcf .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/45ef6ee3611fd0ae412b4c9920601fd7591bbd3b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346071803/log.o: ../src/components/log/log.c  .generated_files/flags/kf_freertos_fpga/2c4206da5660426c5f4eed7ad61cae84b0f754de .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346071803" 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/346071803/log.o.d" -o ${OBJECTDIR}/_ext/346071803/log.o ../src/components/log/log.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/2fa303317756fc08c3a231ecfb37f8319aa1fe2b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/75cc3aa1d4d055348e21d023153726efc5b83f8c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/fd500e73d715d86fd82dbff0bfdc5ba9102b6402 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/833eec91d743a4da9b47ff4498b381d0a705f19f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/790f4a4d19ccbe77f73b9a21ef84114e6bed197e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/8922e28986a01e42763f440cdfacb9eca3cd931 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/f0d8baf08f2918810ee66d9d806d43b975fb4fdb .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/c7ee3f977c919f5f77a82ee7a84353350c9e7eb7 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/59560c3335f33dae03628aa65bef93f065f5a1d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/119fed8c330c6ec3bc2909cc978e5b856cd6bfed .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/4c9189fbb55f84b7c4992e75d2b527201317ced7 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task4.o: ../src/task4.c  .generated_files/flags/kf_freertos_fpga/95ac0cad2aa9eb8ed2fd43693240f13a4f73dcdc .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task4.o.d" -o ${OBJECTDIR}/_ext/1360937237/task4.o ../src/task4.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/dbf35a72e8c0a4022ce6256f603a6e6b8a671f06 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/30911187ce6c3fcc8b1dc1920115a0d56f0dfb29 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/d28ba85ab142b12307138b67ae41ead838d286d8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/16bb15522bcc72bf12bac612833fe4a01ce379ca .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/3910302c72cf5eb3d648543af7a0b605d969cf13 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/1d1ce31335fb9acc47a7482eb1142bcadfefa313 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/459719003e99517d726a655e54b95aaabd878f91 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/cd190d21d92f4c11e3f39f3589dffe4778f9a572 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/a32c1fece2a8e63a12fbe15e9087d6c65b4adc0f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/8239a4fb576ca2c7874c96a19512a65a4bcf0567 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/58d9e5193417a17b88c5eb99fdc2b88a3c3dd23e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/a0b1fdbe91e77be483d913797095d1fa28df07cc .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/9243ab0313228f4dfef8dee39d31b8ce7314ff5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/6e5f893ac3e28a7f86715bf7d93c08bc46474051 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/5da64b7022380a728e1ed2b51466765baa44a26e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/70b39ef3d188b3505b4ec2c2e840abb30af8e478 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/a47a2770229d82d85580690fedfc9ad291222be4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/99ee6dd52c904753a2bf51c4074a006d3f8f7e97 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/1711fac7c44a2136c1734f7dae175f1c66bd21e0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/22781d3dccd0a1173c42de7ba7de85c77a71ce8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/2999aa94ab5d7a9f1281952b5ac816b149e6bd1d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/5316e685b5c924e62b3f0af567f2d722269c12ad .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/138bf0c1f579effcc922f66b0fe57e970fb17316 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/20982e8b77c2694d5931816fdd48d8001b9efea .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/bf0ed0fb527ed52852b2264515ada5a11c0e6b20 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/dc807236c408deeccc42af8afa066946ac6b16b0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/2b9c44a0146a1cb4ea5179cd19e205b6e8cc14 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/d225b94c1f453f3ab3ed8653cd9377dbd4ba199 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/1b8deb8d5a3113bd45334b3fb0f0a7d1f23f5149 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/3dd960e470dd449451ac332541db383396b17d56 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/85f1c886b430c2789b80448e888acdbc083e3fb5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/2705a331833550d62a6bf975f91271e4cdb006e4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/3763bda2a90183a23090c545c643d344d2faf786 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/7dbaaa300900be8292f6b1f540d97d01385e3b88 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346071803/log.o: ../src/components/log/log.c  .generated_files/flags/kf_freertos_fpga/5b11dbef76955e7c6d22832080f22aa045c8f571 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346071803" 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/346071803/log.o.d" -o ${OBJECTDIR}/_ext/346071803/log.o ../src/components/log/log.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/6ed12b8da115d47272e1a652c8cb41571dabcc3c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/702d64bbf76d114a8f9733b5687cd835a4735213 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/360f6c1382f90c28c0b9add0370e1085f9729ca2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/fcb7f5e50366d5bf01c4c8fb1d8bde5d80ddff19 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/b19a2a8a8001baf5d8411f5ee3cf85ad27b83f50 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/191db2d3832ff8681ddfef185e4cce5aa48a86f3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/b0cce202f613c7dc29ef3e58a39804f7691497cf .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/37e7ded5bcb31871ea9d9dd0323698f229b757df .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/473a95df70aa3f39d66e38de204f6d4841441d2c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/c88e618d0384bf1636475761b8864d6c96148845 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/ad842bf2f6e1070497799cee96cf31a19d2a3af .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task4.o: ../src/task4.c  .generated_files/flags/kf_freertos_fpga/fb6bbeb64f5f24a645c3a79d00ae5b824b3b8674 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task4.o.d" -o ${OBJECTDIR}/_ext/1360937237/task4.o ../src/task4.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/kf_freertos_fpga/CEC1736_S0_2ZW.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g  -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/kf_freertos_fpga/CEC1736_S0_2ZW.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
