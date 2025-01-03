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
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/750aa4bfa389c6810925cbb47f8626774096f51e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/f4289369d85f6e2e8578c80f2550d290b9d375a3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/2d100e918d01dc9ad1db1d106f0ceb8fb780113 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/e030aa4ede7886d700a3c01457a51d069ebd064e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/a7353b8f4b6fed2989add989b47fb78de71bb3d2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/798fdb3a6b97df68e29185184fe38cfd29bd3da8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/7441950f40b2b7e7998afcb01a9df9707a7f793e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/afc14c915fa4cbf36a0fb50e619834294eedacfe .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/1585adf54e0782a48a673edb082f92a2d4ba482a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/81f9638fdf5b543e0ffaf598f2f17867cea0988e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/1c29d1b89e60bcf36d4de956bfd96c1c4f8d26e2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/2ed5c16ebbdcfd2cd6eea33fdfabd0c5c5a0a98c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/78de2397f5f900aca7f654cd3ac3044d81a7a03 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/5fa2d05d656fd129c9ab91f38c8c9d6b4eaf867d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/223998d504bbc00cd42e5ef283734bf8d950bdcf .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/50b8ac5861dad281160b300f6a0b369f99261735 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/11ee34f0aac296e60e4dd3971c70833e81a9b13d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/6e342d34aadfc6a27c088243ac75a514f5e35609 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/f96d44022a2dcd00e5eefd19c0a6652a6eb4698 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/e499ccaf1bb94689fff147195a9115cb622baf13 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/47131eba701591bd002aed2ad3db2e0dfd9416a8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/13c608d87afb99d1998197abad6f78799e755f9e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/1d16abb05676dc5a057adf0897bc7563b506cba7 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/dbe6aaf32404da9477aca1208fb30ff7710984ff .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/93af172106e2a808d108a7c9a091cc7704124f32 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/6a1c0c958d77a39725dde8b1bcd115d663c3c7a0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/6aa40bfd8fa9b3704c441820c817c947075a04fe .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/472808a27d1ea2157f4baa252976563ac38220b3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/547b66fdf7aac9afbcb4fd7406265b99f542d65d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/2ca55889d1d96f629e570fa87b198946eaed2a5f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/314fb13d7f4e77317cec356788e3f71f7554ce31 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/d06d76da086b395f88d90e46ed1b61a62229f24f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/d57f8330f5bd8690ec5819c460bbe478b3e4e9ab .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/3085b8287253c73489137d18f16cb239129bce7 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346071803/log.o: ../src/components/log/log.c  .generated_files/flags/kf_freertos_fpga/ba0f9745a3d2261271a6d703d7e9fb4861ef4d97 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346071803" 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/346071803/log.o.d" -o ${OBJECTDIR}/_ext/346071803/log.o ../src/components/log/log.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/3ba2df07f729949ac0ffe0d49b91b2d54673c98b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/5b6cf77527f657268f0b411bbd0a35dd35c78572 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/dfcf13f568f5944cc4eef222bd544f709489f2da .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/c7e03a23ef3a8d942b740643fd2f689607f01461 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/e831c47250c104f2d807bae0c8b0ce05c57e0ab8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/61db691e15086f3a0e1d717d0b04c8faa7a68b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/1c40415f2918c90269d96b7650fdf6145c07749b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/32cbe9f13b51ee25f506f6277b78fa6e06938a04 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/e59661eac08dce6041ea00eccf64d4ddbd162b02 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/75535dc3a7ae52cdef9f4258ee2c2f53293e0727 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/3ef86b2c7518c3aa466213a1ab37ab1bad87c9d2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task4.o: ../src/task4.c  .generated_files/flags/kf_freertos_fpga/e617498530021cd4014bd848212daab98fe8d5ee .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task4.o.d" -o ${OBJECTDIR}/_ext/1360937237/task4.o ../src/task4.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/3457e6deb8fd8812f44d4d1a439379d9513a143c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/c4148de600353d87ddff29f013c1305955e8e1f9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/24e5ee3646888c1275a56a96fdfdf08b12452247 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/8a8dc5b7e63e6a86355689354150f7e2316d1578 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/5552ac02096d268c09f39d3ac92fc08e65d7cef0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/37578bf4aa3fe9fa01e2bb0395ef9a57769782f5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/34af15959b6521de56c649c627c5179db00205ec .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/ffd3b62dce6e4f3ae4200a6e7da67b02df574abe .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/9a4ae152d02c597d5916468dcabddcb0709cac0f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/8859ff5f05753410cea9f646c90e51400ad9366d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/119ca60ddc965070400e43ae9562536e759a22d3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/d1adfcbaabce44be3fde6f99b8dc70ab19e9c6a1 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/6cbfe98b1968ff1cf5293523df0c76d385bcf0d6 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/3d85ece8604d76c4bfaa7ae7cfc81a5f32df0d35 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/2948a4dbe119bdad270be7c726ccc05a1f261a62 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/b34af207b000cb6fcc1706a1fe5a29a79e0ad90a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/fe02d5382546bf2f294dc34d9e0e1750a7f99c7a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/99d39be38042a534e938a45045c7339311b238ce .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/d2ce9a26698440092fcd08dd742f14975f689031 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/d34aedba897e435efbe246e3bf7f306e314dcd93 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/9a1ac6ec737c32b5fafaecfb3e0bf1a1393c5bdb .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/6157882e72c20cd3a27ee992f3dbab644aa0a2b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/fa576ab6b87f79abe4ce3280a45853ea2c65ff1c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/246700e6408c74501b8fbcc8168332dd0209a2a8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/578bae9d224d844d507e01576a7abbc26ab8e15 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/3a53f0685b212ed78b295506cdf802f15c7a6ba1 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/b0d834d45f6525cc25472ca003ba29c61b5f52f3 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/67d2b8e9afbecf9e2ff4bb404adc22865e8d4cd4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/48e32bf53b2dc3d43b04c822a9f4ee64b3aca015 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/cf174554a05fdd4afe1f67932b99070cf89857c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/5c691ae5451ab4a98d86dab17aa30d3e28db43e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/a4bd33808db0e1204ba86415fdeedab3ddc7a870 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/bb6dd35894689274d9855882cc42a9ef38ef64ea .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/847fc6aeae868c4a6d92a13ff61e56da4bf529c1 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/346071803/log.o: ../src/components/log/log.c  .generated_files/flags/kf_freertos_fpga/b448b596ee37adbbd9d522674112399fd6c3da91 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/346071803" 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o.d 
	@${RM} ${OBJECTDIR}/_ext/346071803/log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/346071803/log.o.d" -o ${OBJECTDIR}/_ext/346071803/log.o ../src/components/log/log.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/1d01ed3182bc207fb468d39186a4d53f00424c02 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/9a9792c3b6448f0c91d38513cca21667d7987a0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/16d62c745949152b14a22abc86d427be3ddfeae0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/1a7540dbdde376e465a5367480688316d1d85658 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/b2f0b23334f06ca4a95cdd0829a106d8e1e835c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/5774f46ce4493337850fcb35d766df9bd27fb59c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/96d2cbfbb19c593e77d2da6051fe146f0262f9ca .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/f39ff001f91b0377c6547bddf683c38d27b46fcd .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/dfcbe734435b7afb580942408b2b326a29db81a2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/83c94373787f4e742d21285bab1e2d455d0ab76d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/cd2519d5588e1d899fd6fc87b85a014b6cee198 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)   ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task4.o: ../src/task4.c  .generated_files/flags/kf_freertos_fpga/2f457aed30cf3e99d9e2bbbd2a4934a7f00282cc .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
