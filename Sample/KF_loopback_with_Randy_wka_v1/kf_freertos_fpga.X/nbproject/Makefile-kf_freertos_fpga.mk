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
SOURCEFILES_QUOTED_IF_SPACED=../src/config/kf_freertos_fpga/debug/serial.c ../src/config/kf_freertos_fpga/debug/trace.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c ../src/config/kf_freertos_fpga/osal/osal_freertos.c ../src/config/kf_freertos_fpga/peripheral/dma/dma.c ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c ../src/config/kf_freertos_fpga/plib/uart/uart_api.c ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c ../src/config/kf_freertos_fpga/exceptions.c ../src/config/kf_freertos_fpga/freertos_hooks.c ../src/config/kf_freertos_fpga/initialization.c ../src/config/kf_freertos_fpga/interrupts.c ../src/config/kf_freertos_fpga/libc_syscalls.c ../src/config/kf_freertos_fpga/startup_xc32.c ../src/config/kf_freertos_fpga/tasks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/tests/test_ccc.c ../src/tests/test_pvt_xfer.c ../src/tests/test_icm42605.c ../src/tests/test_ibis.c ../src/tests/tgt_test_pvt_xfer.c ../src/tests/crc8.c ../src/tests/tgt_test_ibis.c ../src/task1.c ../src/main.c ../src/task2.c ../src/task3.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1420773124/serial.o ${OBJECTDIR}/_ext/1420773124/trace.o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ${OBJECTDIR}/_ext/825503660/dma.o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ${OBJECTDIR}/_ext/1732944825/uart_api.o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ${OBJECTDIR}/_ext/29258880/exceptions.o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ${OBJECTDIR}/_ext/29258880/initialization.o ${OBJECTDIR}/_ext/29258880/interrupts.o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ${OBJECTDIR}/_ext/29258880/tasks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/crc8.o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ${OBJECTDIR}/_ext/1360937237/task1.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/task2.o ${OBJECTDIR}/_ext/1360937237/task3.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1420773124/serial.o.d ${OBJECTDIR}/_ext/1420773124/trace.o.d ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d ${OBJECTDIR}/_ext/825503660/dma.o.d ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d ${OBJECTDIR}/_ext/1732944825/uart_api.o.d ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d ${OBJECTDIR}/_ext/29258880/exceptions.o.d ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d ${OBJECTDIR}/_ext/29258880/initialization.o.d ${OBJECTDIR}/_ext/29258880/interrupts.o.d ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d ${OBJECTDIR}/_ext/29258880/tasks.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d ${OBJECTDIR}/_ext/1521323865/crc8.o.d ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d ${OBJECTDIR}/_ext/1360937237/task1.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/task2.o.d ${OBJECTDIR}/_ext/1360937237/task3.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1420773124/serial.o ${OBJECTDIR}/_ext/1420773124/trace.o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ${OBJECTDIR}/_ext/825503660/dma.o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ${OBJECTDIR}/_ext/1732944825/uart_api.o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ${OBJECTDIR}/_ext/29258880/exceptions.o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ${OBJECTDIR}/_ext/29258880/initialization.o ${OBJECTDIR}/_ext/29258880/interrupts.o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ${OBJECTDIR}/_ext/29258880/tasks.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ${OBJECTDIR}/_ext/1521323865/crc8.o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ${OBJECTDIR}/_ext/1360937237/task1.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/task2.o ${OBJECTDIR}/_ext/1360937237/task3.o

# Source Files
SOURCEFILES=../src/config/kf_freertos_fpga/debug/serial.c ../src/config/kf_freertos_fpga/debug/trace.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c ../src/config/kf_freertos_fpga/osal/osal_freertos.c ../src/config/kf_freertos_fpga/peripheral/dma/dma.c ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c ../src/config/kf_freertos_fpga/plib/uart/uart_api.c ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c ../src/config/kf_freertos_fpga/exceptions.c ../src/config/kf_freertos_fpga/freertos_hooks.c ../src/config/kf_freertos_fpga/initialization.c ../src/config/kf_freertos_fpga/interrupts.c ../src/config/kf_freertos_fpga/libc_syscalls.c ../src/config/kf_freertos_fpga/startup_xc32.c ../src/config/kf_freertos_fpga/tasks.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/tests/test_ccc.c ../src/tests/test_pvt_xfer.c ../src/tests/test_icm42605.c ../src/tests/test_ibis.c ../src/tests/tgt_test_pvt_xfer.c ../src/tests/crc8.c ../src/tests/tgt_test_ibis.c ../src/task1.c ../src/main.c ../src/task2.c ../src/task3.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



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
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/b9707f3757053ccb6c6c55ce70bbe431f79c0985 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/b588b8d1dbcd792335bceec31997029c66515582 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/ad027ddc192f7b108fd0ff6445643eec205a0781 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/ee2590abc548dad2ca92e94f6b9e359a5739929e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/724ba4d091809f5f55b2c2accc52920e22ceef93 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/3fc1dabe7958b7ffd06cf6925e34c744cccf5e44 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/e3f928161ce59040bcc6442042df717ac2469b18 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/f873b6b940fc23f8ea4b2850509e9ab2500f2dcf .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/48aa2724d00e24848f13d21d2a18e6b35a9ecd36 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/356e1e2cc07de3022a364d90937e53d445b91d2e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/fc29b347869faef99a452101a9340040f77b6c52 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/983b5f66d810154a75c920966862e930841ed8e2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/107aa5b343f1e5b9f26feacdf67d927836d14549 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/2c853485a352ea9be7cb1cb5db8b0abd3f780727 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/ece321152a6f14c6717e04b36c672d4ffca93dfb .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/86eebd9fae5178a3c650569906bb855c7918020b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/2a3edc297afceb78c46cef908a7ae9ad449abf9b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/a580aff182c556075340aac91974924802bf6736 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/be98c182011d4abc207f49965bd32e5989bdb824 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/c669c865855b381ec9d473b223a6c1719bd3cd3a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/a89440a4903bc35faa0b5351bc4f388496ccf2a8 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/ca6651965ea4367f4e25516a57068cc47f71f108 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/ec82a178462b460cc2bbeb79206f993816f87c53 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/ac8168d939459a59bd31385a111e9ac0ab7fcc6d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/2dba08ccfe6c42fb5b5579ae2528affd638718cc .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/cffb2a54c76b1256557f81c37800ce0b05f0b2e1 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/7a98bdaefce6f3179fe986d5ebd94942f92e6405 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/1ffc5d0c53b6b6767c250c9a6254ba54ccd259a9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/64b740776b1193d5356d925ab8fb9695fc5b75af .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/1dda53c703489b1f19981e7b5f06c46bab01f92f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/ed32de8f454358b5f36fc76527f756d305219f2e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/ef6ef1ff17cc2b6d3c9fd2d5d6c740ce2c4a0981 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/f35f9a5dee20a3492c75ab651c439e17f4c456e0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/1ba0429e2757896af031e20372cbe1777deceb5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/fdaf6b8a6489b5b8a208748c2bf12862617ed528 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/a7e639b392d8c4ab8d9494abafd5bec5c80ddabb .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/f5e518b384c7bbea6392699c0684192fa3a9428a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/f36095b8cabd3e1ea10b66ffc979760efc41360b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/b4b15402138d328d037bc4f83ab0873270214d4d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/f0827abb0152a859d74f24fcf719e18c8ff0b1a2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/b0600b597cab5b3b6cae39e38939a77a177f8c7a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/1b1254c581c463d350d9ba6d273ed13a5b9f9393 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/107d12d57f0fbfc35dcd0fefc567ce106c50cb8c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/99c7cbe6fd19e59be4ddbba12c42f4e07504b88d .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/1c332542e79b4a412b9de15d94f27bb48e0864bd .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1420773124/serial.o: ../src/config/kf_freertos_fpga/debug/serial.c  .generated_files/flags/kf_freertos_fpga/a86cd1b42c3fdef48ac26506caba8f2be670e1ee .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/serial.o.d" -o ${OBJECTDIR}/_ext/1420773124/serial.o ../src/config/kf_freertos_fpga/debug/serial.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1420773124/trace.o: ../src/config/kf_freertos_fpga/debug/trace.c  .generated_files/flags/kf_freertos_fpga/ef4bef2a38e914a5ae06331ab81d9f97a60ea22f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1420773124" 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o.d 
	@${RM} ${OBJECTDIR}/_ext/1420773124/trace.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1420773124/trace.o.d" -o ${OBJECTDIR}/_ext/1420773124/trace.o ../src/config/kf_freertos_fpga/debug/trace.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c  .generated_files/flags/kf_freertos_fpga/92a3bda6bf7bcb5512af9fccf5b51d7c42ab0a12 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/101992513/drv_i3c_config.o: ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c  .generated_files/flags/kf_freertos_fpga/b02860bd9bc6e9891872c61ce8357b916609754 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/101992513" 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/101992513/drv_i3c_config.o.d" -o ${OBJECTDIR}/_ext/101992513/drv_i3c_config.o ../src/config/kf_freertos_fpga/driver/i3c/drv_i3c_config.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_ccc.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c  .generated_files/flags/kf_freertos_fpga/cc5c61d8fd234512c2fe22f76d8d21e9140c6b6 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_ccc.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_ccc.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1886205328/i3c_common.o: ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c  .generated_files/flags/kf_freertos_fpga/c82fc913778b4d90153ae809956824aed5e51814 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1886205328" 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1886205328/i3c_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1886205328/i3c_common.o.d" -o ${OBJECTDIR}/_ext/1886205328/i3c_common.o ../src/config/kf_freertos_fpga/middleware/zephyr/drivers/i3c/i3c_common.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/785111490/osal_freertos.o: ../src/config/kf_freertos_fpga/osal/osal_freertos.c  .generated_files/flags/kf_freertos_fpga/80696454b8042b606a3f9ec3ec94f74cb116015e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/785111490" 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/785111490/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/785111490/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/785111490/osal_freertos.o ../src/config/kf_freertos_fpga/osal/osal_freertos.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825503660/dma.o: ../src/config/kf_freertos_fpga/peripheral/dma/dma.c  .generated_files/flags/kf_freertos_fpga/17ffa9fe409adddf3d300e9ca1ba133fd581e20a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825503660" 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/825503660/dma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825503660/dma.o.d" -o ${OBJECTDIR}/_ext/825503660/dma.o ../src/config/kf_freertos_fpga/peripheral/dma/dma.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o: ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c  .generated_files/flags/kf_freertos_fpga/49f95c56a6e602befad42be2794b23797cdbe7b9 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/868947740" 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d 
	@${RM} ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o.d" -o ${OBJECTDIR}/_ext/868947740/plib_ec_reg_bank.o ../src/config/kf_freertos_fpga/peripheral/ec_reg_bank/plib_ec_reg_bank.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179210842/plib_ecia.o: ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c  .generated_files/flags/kf_freertos_fpga/d161d30a561443235ffb9d894e5ecd4448590f9a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179210842" 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o.d 
	@${RM} ${OBJECTDIR}/_ext/179210842/plib_ecia.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179210842/plib_ecia.o.d" -o ${OBJECTDIR}/_ext/179210842/plib_ecia.o ../src/config/kf_freertos_fpga/peripheral/ecia/plib_ecia.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179282931/plib_gpio.o: ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c  .generated_files/flags/kf_freertos_fpga/753b71f06bfb7355dc1c2ec10bd3a1fc16d3b599 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179282931" 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/179282931/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179282931/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/179282931/plib_gpio.o ../src/config/kf_freertos_fpga/peripheral/gpio/plib_gpio.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c  .generated_files/flags/kf_freertos_fpga/1025b32ef3fd028f61b7194c963eaae178fb7744 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825500651/plib_i3c_private.o: ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c  .generated_files/flags/kf_freertos_fpga/e263f2172eff1f41a7fb56561619005b1c21430 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825500651" 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d 
	@${RM} ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825500651/plib_i3c_private.o.d" -o ${OBJECTDIR}/_ext/825500651/plib_i3c_private.o ../src/config/kf_freertos_fpga/peripheral/i3c/plib_i3c_private.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/179497222/plib_nvic.o: ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c  .generated_files/flags/kf_freertos_fpga/9a6aa6c6ac6bd6b2d6554cb73bbcc7df133095df .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/179497222" 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/179497222/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/179497222/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/179497222/plib_nvic.o ../src/config/kf_freertos_fpga/peripheral/nvic/plib_nvic.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/825492421/plib_pcr.o: ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c  .generated_files/flags/kf_freertos_fpga/78087e7a66f8899ced11e6f1b9aa01b622c90e2e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/825492421" 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o.d 
	@${RM} ${OBJECTDIR}/_ext/825492421/plib_pcr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/825492421/plib_pcr.o.d" -o ${OBJECTDIR}/_ext/825492421/plib_pcr.o ../src/config/kf_freertos_fpga/peripheral/pcr/plib_pcr.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_api.o: ../src/config/kf_freertos_fpga/plib/uart/uart_api.c  .generated_files/flags/kf_freertos_fpga/f3cd024cd3deaeebb46389aa74ca7b84321545ca .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_api.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_api.o ../src/config/kf_freertos_fpga/plib/uart/uart_api.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1732944825/uart_perphl.o: ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c  .generated_files/flags/kf_freertos_fpga/c7f2e270b16831f5d76f256f883bd38ed826a9a5 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1732944825" 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1732944825/uart_perphl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1732944825/uart_perphl.o.d" -o ${OBJECTDIR}/_ext/1732944825/uart_perphl.o ../src/config/kf_freertos_fpga/plib/uart/uart_perphl.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1435074362/xc32_monitor.o: ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c  .generated_files/flags/kf_freertos_fpga/7ef7f1846f302077a605e6c4422ddf9824df5324 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1435074362" 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1435074362/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1435074362/xc32_monitor.o ../src/config/kf_freertos_fpga/stdio/xc32_monitor.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/exceptions.o: ../src/config/kf_freertos_fpga/exceptions.c  .generated_files/flags/kf_freertos_fpga/f92413dcbf01a017c65966483df6a02df1e7d2d2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/exceptions.o.d" -o ${OBJECTDIR}/_ext/29258880/exceptions.o ../src/config/kf_freertos_fpga/exceptions.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/freertos_hooks.o: ../src/config/kf_freertos_fpga/freertos_hooks.c  .generated_files/flags/kf_freertos_fpga/74cbcc880d4bc131eeb8e9f2b32eb1e82cdddc71 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/29258880/freertos_hooks.o ../src/config/kf_freertos_fpga/freertos_hooks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/initialization.o: ../src/config/kf_freertos_fpga/initialization.c  .generated_files/flags/kf_freertos_fpga/645de260b664e8803d78f280679651b452dce9c7 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/initialization.o.d" -o ${OBJECTDIR}/_ext/29258880/initialization.o ../src/config/kf_freertos_fpga/initialization.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/interrupts.o: ../src/config/kf_freertos_fpga/interrupts.c  .generated_files/flags/kf_freertos_fpga/38226a8aef7bd56cb1eac5e692a0bb6a4d03bad0 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/interrupts.o.d" -o ${OBJECTDIR}/_ext/29258880/interrupts.o ../src/config/kf_freertos_fpga/interrupts.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/libc_syscalls.o: ../src/config/kf_freertos_fpga/libc_syscalls.c  .generated_files/flags/kf_freertos_fpga/63080dfeeaa25a02fcbc3ccfd04c7dc294ec930e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/29258880/libc_syscalls.o ../src/config/kf_freertos_fpga/libc_syscalls.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/startup_xc32.o: ../src/config/kf_freertos_fpga/startup_xc32.c  .generated_files/flags/kf_freertos_fpga/d8e5f334af5cf95af7cf85493268d1721ef0869c .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/29258880/startup_xc32.o ../src/config/kf_freertos_fpga/startup_xc32.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/29258880/tasks.o: ../src/config/kf_freertos_fpga/tasks.c  .generated_files/flags/kf_freertos_fpga/7e0404e37cac4fc256739e2b265118a99e004787 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/29258880" 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/29258880/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/29258880/tasks.o.d" -o ${OBJECTDIR}/_ext/29258880/tasks.o ../src/config/kf_freertos_fpga/tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/kf_freertos_fpga/18f21be70d41848aa2a93778b60366aa2fd885ee .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/kf_freertos_fpga/e94ec10e7094fb055014a72c58ee8936afcca02b .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/kf_freertos_fpga/8e475e9a0b02944bd35f9eb6a7c4cef6bf5c6af4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/kf_freertos_fpga/f33cd1185065d8af71bf3df5e072e913edd63c79 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/kf_freertos_fpga/b1c0aee386f6a0712857cb73baab3082a36da4b4 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/kf_freertos_fpga/b0d2fef4d0150286d90d8a8fda8a0ed6f4584132 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/kf_freertos_fpga/271d14d25b360eb50956644d4f886dd879692037 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/kf_freertos_fpga/2196f0c0acebcbab19400afbc6d2af56b8a9836f .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/kf_freertos_fpga/a589b4ff0c2001042249edd33351e1f28f8a9792 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ccc.o: ../src/tests/test_ccc.c  .generated_files/flags/kf_freertos_fpga/f87eb0525171d975145ff2036c3196c581594348 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ccc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ccc.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ccc.o ../src/tests/test_ccc.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o: ../src/tests/test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/7459ac8b7c8952c43c47fc2bccf9cc724462940a .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_pvt_xfer.o ../src/tests/test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_icm42605.o: ../src/tests/test_icm42605.c  .generated_files/flags/kf_freertos_fpga/a43212755de9ac78b729bf076f9c311c9ed19485 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_icm42605.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_icm42605.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_icm42605.o ../src/tests/test_icm42605.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/test_ibis.o: ../src/tests/test_ibis.c  .generated_files/flags/kf_freertos_fpga/7e15a538b04254c43cf62fe7b0cf3b98090b4598 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/test_ibis.o ../src/tests/test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o: ../src/tests/tgt_test_pvt_xfer.c  .generated_files/flags/kf_freertos_fpga/c46a448c42b64803dc20a0094c1d7960bb1a3ff2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_pvt_xfer.o ../src/tests/tgt_test_pvt_xfer.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/crc8.o: ../src/tests/crc8.c  .generated_files/flags/kf_freertos_fpga/cf4f6c7e34b523cb8b2e0fa4b36c60130a818de2 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/crc8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/crc8.o.d" -o ${OBJECTDIR}/_ext/1521323865/crc8.o ../src/tests/crc8.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o: ../src/tests/tgt_test_ibis.c  .generated_files/flags/kf_freertos_fpga/efff8b6d181404ce7166e0fc4981690ab2dc2f79 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1521323865" 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d 
	@${RM} ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o.d" -o ${OBJECTDIR}/_ext/1521323865/tgt_test_ibis.o ../src/tests/tgt_test_ibis.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task1.o: ../src/task1.c  .generated_files/flags/kf_freertos_fpga/9cc37315efc0e3357767a2efebcd82b1951efa4e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task1.o.d" -o ${OBJECTDIR}/_ext/1360937237/task1.o ../src/task1.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/kf_freertos_fpga/e0c0977b44871839026d83d447580c685fbc0bae .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task2.o: ../src/task2.c  .generated_files/flags/kf_freertos_fpga/32046b176213393cb90e0f0c1281385b9e6e4d2e .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task2.o.d" -o ${OBJECTDIR}/_ext/1360937237/task2.o ../src/task2.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/task3.o: ../src/task3.c  .generated_files/flags/kf_freertos_fpga/9fa75d6cbbcd6ea2b4a9764499acf1fec7a2edb1 .generated_files/flags/kf_freertos_fpga/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/task3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -fno-common -I"../src" -I"../src/config/kf_freertos_fpga" -I"../src/packs/CEC1736_S0_2ZW_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -I"../src/config/kf_freertos_fpga/plib" -I"../src/config/kf_freertos_fpga/driver" -I"../src/config/kf_freertos_fpga/middleware" -I"../src/config/kf_freertos_fpga/middleware/zephyr" -I"../src/config/kf_freertos_fpga/middleware/zephyr/include" -I"../src/config/kf_freertos_fpga/peripheral/dma" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/task3.o.d" -o ${OBJECTDIR}/_ext/1360937237/task3.o ../src/task3.c    -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/cec1736" ${PACK_COMMON_OPTIONS} 
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g  -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/cec1736"
	
else
${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/kf_freertos_fpga/CEC1736_S0_2ZW.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/kf_freertos_fpga.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_kf_freertos_fpga=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/cec1736"
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
