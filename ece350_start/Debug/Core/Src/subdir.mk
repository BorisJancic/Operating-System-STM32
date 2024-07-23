################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Src/PendSV_Handler.s \
../Core/Src/SVC_Handler.s 

C_SRCS += \
../Core/Src/k_mem.c \
../Core/Src/k_task.c \
../Core/Src/lab_1_main_jkl_1.c \
../Core/Src/lab_1_main_maran_easy.c \
../Core/Src/lab_1_main_maran_hard.c \
../Core/Src/lab_2_alloc_timing_test.c \
../Core/Src/lab_2_main_jkl_2.c \
../Core/Src/lab_2_main_memory_functional.c \
../Core/Src/lab_3_main_backward_compatibility_test.c \
../Core/Src/lab_3_main_simple_periodic_tasks_test.c \
../Core/Src/main.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c \
../Core/Src/util.c 

OBJS += \
./Core/Src/PendSV_Handler.o \
./Core/Src/SVC_Handler.o \
./Core/Src/k_mem.o \
./Core/Src/k_task.o \
./Core/Src/lab_1_main_jkl_1.o \
./Core/Src/lab_1_main_maran_easy.o \
./Core/Src/lab_1_main_maran_hard.o \
./Core/Src/lab_2_alloc_timing_test.o \
./Core/Src/lab_2_main_jkl_2.o \
./Core/Src/lab_2_main_memory_functional.o \
./Core/Src/lab_3_main_backward_compatibility_test.o \
./Core/Src/lab_3_main_simple_periodic_tasks_test.o \
./Core/Src/main.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o \
./Core/Src/util.o 

S_DEPS += \
./Core/Src/PendSV_Handler.d \
./Core/Src/SVC_Handler.d 

C_DEPS += \
./Core/Src/k_mem.d \
./Core/Src/k_task.d \
./Core/Src/lab_1_main_jkl_1.d \
./Core/Src/lab_1_main_maran_easy.d \
./Core/Src/lab_1_main_maran_hard.d \
./Core/Src/lab_2_alloc_timing_test.d \
./Core/Src/lab_2_main_jkl_2.d \
./Core/Src/lab_2_main_memory_functional.d \
./Core/Src/lab_3_main_backward_compatibility_test.d \
./Core/Src/lab_3_main_simple_periodic_tasks_test.d \
./Core/Src/main.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d \
./Core/Src/util.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o: ../Core/Src/%.s Core/Src/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/PendSV_Handler.d ./Core/Src/PendSV_Handler.o ./Core/Src/SVC_Handler.d ./Core/Src/SVC_Handler.o ./Core/Src/k_mem.cyclo ./Core/Src/k_mem.d ./Core/Src/k_mem.o ./Core/Src/k_mem.su ./Core/Src/k_task.cyclo ./Core/Src/k_task.d ./Core/Src/k_task.o ./Core/Src/k_task.su ./Core/Src/lab_1_main_jkl_1.cyclo ./Core/Src/lab_1_main_jkl_1.d ./Core/Src/lab_1_main_jkl_1.o ./Core/Src/lab_1_main_jkl_1.su ./Core/Src/lab_1_main_maran_easy.cyclo ./Core/Src/lab_1_main_maran_easy.d ./Core/Src/lab_1_main_maran_easy.o ./Core/Src/lab_1_main_maran_easy.su ./Core/Src/lab_1_main_maran_hard.cyclo ./Core/Src/lab_1_main_maran_hard.d ./Core/Src/lab_1_main_maran_hard.o ./Core/Src/lab_1_main_maran_hard.su ./Core/Src/lab_2_alloc_timing_test.cyclo ./Core/Src/lab_2_alloc_timing_test.d ./Core/Src/lab_2_alloc_timing_test.o ./Core/Src/lab_2_alloc_timing_test.su ./Core/Src/lab_2_main_jkl_2.cyclo ./Core/Src/lab_2_main_jkl_2.d ./Core/Src/lab_2_main_jkl_2.o ./Core/Src/lab_2_main_jkl_2.su ./Core/Src/lab_2_main_memory_functional.cyclo ./Core/Src/lab_2_main_memory_functional.d ./Core/Src/lab_2_main_memory_functional.o ./Core/Src/lab_2_main_memory_functional.su ./Core/Src/lab_3_main_backward_compatibility_test.cyclo ./Core/Src/lab_3_main_backward_compatibility_test.d ./Core/Src/lab_3_main_backward_compatibility_test.o ./Core/Src/lab_3_main_backward_compatibility_test.su ./Core/Src/lab_3_main_simple_periodic_tasks_test.cyclo ./Core/Src/lab_3_main_simple_periodic_tasks_test.d ./Core/Src/lab_3_main_simple_periodic_tasks_test.o ./Core/Src/lab_3_main_simple_periodic_tasks_test.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/stm32f4xx_hal_msp.cyclo ./Core/Src/stm32f4xx_hal_msp.d ./Core/Src/stm32f4xx_hal_msp.o ./Core/Src/stm32f4xx_hal_msp.su ./Core/Src/stm32f4xx_it.cyclo ./Core/Src/stm32f4xx_it.d ./Core/Src/stm32f4xx_it.o ./Core/Src/stm32f4xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f4xx.cyclo ./Core/Src/system_stm32f4xx.d ./Core/Src/system_stm32f4xx.o ./Core/Src/system_stm32f4xx.su ./Core/Src/util.cyclo ./Core/Src/util.d ./Core/Src/util.o ./Core/Src/util.su

.PHONY: clean-Core-2f-Src

