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
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/448ef36ab8eac8696c31d29616c86237d6f21607 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/e0bb4c0f41226d86e05427e24bd0c33f1ec3f643 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/fcd7285e27f2a0a54a5969336ca9568e3931b73e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/a72e54f59b7f285f21be73bc355ad28f18607476 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/99a7cae08945fdf7352598cfe28f2e5a0ffad876 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/8c7703d147a1c79a140d5995d7c1c02877db9177 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/91425b74196d46b97f2e8d06ed621deff1a7ae53 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/f646607141568d1a2219d79a0c69279b74d54357 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/8bc1b6715456ef7a0c880ba49417c9e6be0633c5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/d9de298932e37cf1830e9f7ff693ed32b830aab9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/76309f5bfd05a33b791d2128ef563bff19c71c85 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/5c63e679434f2f911f8299dfad1ab39e20e633e0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/52ec076a3e9dc1940fd26f204a1a5ccc80db83c9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/ddf531e887f1cf278fc13d1bb5b89d7fa43895da .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/80570d21b172f720e8bacabf688630ef26f136c3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/578d8ea24b2bf20f0b0b45afe0c5ddec380ed0c9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/71c2e775a3d0531f71ab0036f5b53f39ec1691af .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/1c99e2a5c52a7da44012b133f8202d77b441c464 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/54b73894006f3aa9629c6836e7b0ca3550845a2c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/e6b9e87e953f435d3092c04094c0e61b1685badd .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/e6cf8bd7153783a0566521b6f57a4ef2090a890e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/13f96f305924d1db71898fa2469b516831b3b7c2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/8a8470706d9e5fe35d68aa4ca805e576751828d1 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/6adc51a83e36686b1731175d7cdbe86e185ed47e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/8b47b82a7b2bc197b3560c34738458a107c3e6c8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/a97df4940ed573ed20a053d446ba4190dd5f04ca .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/c04c7c2a0cf6031d721397faca21413bacbe8e98 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/eb4d6d177b14b07168b33aec85fc3aa939a4665e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/1d574cd76a5adec93df5b7adfd562826072b6dc3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/34cd655aba630ad2187bb4f8b1ff9898b55a8e7e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/60539905e2c0dcb342ac8f649c50df590ee8af59 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/27c1496e48bcfbf8c4acc2f3584e6a2b3b4703fb .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/9dc06531c65fd8000228a9b3b78d7ff609401535 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/d5f88aa7b09d8077ec97a27b549e1ed7a8132d31 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346071803/log.o: ../src/components/log/log.c  .generated_files/flags/kf_freertos_fpga/ad095e4c14242b45039c6f25a01f43a76654a768 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346071803" 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/346071803/log.o.d" -o ${OBJECTDIR}/_ext/346071803/log.o ../src/components/log/log.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/174f11af0a564c508fccfa7b56db07633128ab65 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/5e9ace1eb223a396679d406f135dba69943ada99 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/6a25cb889fc3f2617221fb3ac3e7046d9d6cf3f8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/3e33e71add91b81cf5658158ec60b799ff278054 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/dd86fd592c2d43b19412a65e1f240a38a7ce35be .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/43e4b39526214e2f04ed1be7905742b0509de569 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/261157f0bc5d62714ba3aaff54f02112a11b6991 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/be73007f784e109ed9671cb6fdb96747fec53a22 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/81bb3ec89b1962df0d78c5a69e71e80f1f0fd000 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/2aa4669ae737fb79e0732cd3ad509745e80c1ccc .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/125de09b715d7ccd6ead2a0e5064944b594ec458 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task4.o: ../src/task4.c  .generated_files/flags/kf_freertos_fpga/f3e5d4d9a5cd741d091c2e6fb347f3a744951e29 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task4.o.d" -o ${OBJECTDIR}/_ext/1360937237/task4.o ../src/task4.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/251939057cdab886bf0a444e1464768609e1482a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/12dbd4697abd4ddf50b1e41029c6185f812fa593 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/fe1bd073f0f7771e519b2b19e3d98efc4cdb59f4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/2f5dd11415ab3c40c99db1c54935e4104749f97 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/b6442fb2cc48c78f47e93bc6cc4183d7fee363dd .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/3d77c650dddd8e0368f1f9c604d17a760572fbff .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/65fdd72ff3d219692a50ec2b762de72e4b9ad878 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/dc1e30e344dfd4cb0ca3be52900c367e795bada7 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/929fabde86891ebbd439ae6df43ef2b11bb7c4fa .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/7eab967e74795e98c608a8f98309b3901200522 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/332585efb54e7074b0bd90104fd21e07adc4d94b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/613a5240daaaa89e830bbaff4b0e31bb2da47c8a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/6ffa71623ef85a7b5985d0338239ee6c6ab3087a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/a6171fd90c30fb24d9004b43d05dcc187823f0fb .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/e846734661f6d31a9612e5577b8fa9e343fa66af .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/1b10c5daf5f0464128a5b6234bc649747730561c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/9f190e055d70783ae9fb9a772b1d7b7383dc36c9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/a9016e620bdc8b8e4c6467fcfb360d22c9d73b29 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/6b9a8035a60a692747972bb21579241267bcdf03 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/3ff806750c6d7874c0b6aca10ae3fdbb15bb46a4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/2bb33e93b2392309afa413055f80723cb4eafc28 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/604553b8510e4a072e09ed4cd84347a97fb46919 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/fe353a59f71a230b2c9ebd546c13e52f288b5ec2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/28d333b3960a1758d43f872c00a84bd19cab7d47 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/490d464a96049494b8bc7ed04fe32d3491883671 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/3534858690b1e1e001aa733b0f0b2b5df492489a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/443866061d00814b22271f2492f347d6d818ec95 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/fd4cdd01078fb90b42c87bb817056e82aabf92b9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/c96dbf77e9ecbc17b2ae6cb8880946160affe367 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/dc5337bdf3e73ca0d6b0eadb3846183beb79af36 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/16308e69217913e462fa79c978788044b14c2b8b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/d8173a8ac20be9b3e294c35a84304de8a6fc6f75 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/126f018256342e0b81641e362028a5d562973c8b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/e6032a8b336f1e49f5cd61147e0a59fe2b9e8a8b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346071803/log.o: ../src/components/log/log.c  .generated_files/flags/kf_freertos_fpga/98748cfa539aed9ee0d934c69aa67f32777ab00 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346071803" 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/346071803/log.o.d" -o ${OBJECTDIR}/_ext/346071803/log.o ../src/components/log/log.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/fe361e231d9db5d3ed411dde5b3a03aa71dcefe8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/bd33ebc85190537121bbb3f5932ed0b2b5bbe78b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/c4e01563331c1d62390c04ca5d3413e68292281a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/189c85b6f135fa4c7ddffe01dede76d464fc3f4b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/9e040ce0fc10403ee3a803c711b4cf58f58d9856 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/4fc12064f8eef00b50567f0feab95be4ac715e61 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/bd0bacc6cbafed44904f498b46b399f9fe13c9e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/1bba580825dbcd29b52c49e2dd7f0f092f357f68 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/94bb8b43f49333740fdeb53e37ba16dca17c7df .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/2b4ce4057fd897100d43dbf24a4c7ede1e94bc4d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/14f2ea1a634b0a9c27841e89f2900fd0007b3d8f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task4.o: ../src/task4.c  .generated_files/flags/kf_freertos_fpga/dc17311a37ab278b818299156d11fac2af059e3b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
