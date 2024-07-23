#include "common.h"
#include "main.h"
#include "k_task.h"
#include <stdio.h> //You are permitted to use this library, but currently only printf is implemented. Anything else is up to you!
#include <math.h>

extern TCB tcb_array[MAX_TASKS];
extern int kernel_running;
extern int current_task_index;

#define  ARM_CM_DEMCR      (*(uint32_t *)0xE000EDFC)
#define  ARM_CM_DWT_CTRL   (*(uint32_t *)0xE0001000)
#define  ARM_CM_DWT_CYCCNT (*(uint32_t *)0xE0001004)
int initial = 0;

//int count = 1000;

int i_test = 0;

int i_test2 = 0;


void TaskA(void *) {
   while(1){
	   if (i_test < 50) {
		   printf("%d, %d\r\n", i_test, i_test2);
	   }
      osPeriodYield();
   }
}

void TaskB(void *) {
   while(1){
      i_test = i_test + 1;
      osPeriodYield();
   }
}

void TaskC(void *) {
   while(1){
      i_test2 = i_test2 + 1;
      osPeriodYield();
   }
}

int A_arr[10];
int B_arr[10];
int B_arr_before[10];

void EDF_TaskC(void*);
void EDF_TaskA(void*) {
	for (int i = 0; i < 10; i++) {
		A_arr[i] = ARM_CM_DWT_CYCCNT;
		osPeriodYield();
	}
//	TCB st_mytask;
//	st_mytask.stack_size = STACK_SIZE;
//
//	st_mytask.ptask = &EDF_TaskC;
//	osCreateDeadlineTask(1000, &st_mytask);
}
void EDF_TaskB(void*) {
	for (int i = 0; i < 10; i++) {
		B_arr_before[i] = ARM_CM_DWT_CYCCNT;
		for (int j = 0; j < 55000; j++) {}
		B_arr[i] = ARM_CM_DWT_CYCCNT;
		osPeriodYield();
	}
	TCB st_mytask;
	st_mytask.stack_size = STACK_SIZE;

	st_mytask.ptask = &EDF_TaskC;
	osCreateDeadlineTask(1000, &st_mytask);
}
void EDF_TaskC(void*) {
	printf("A_arr\r\n");
	for (int i = 0; i < 10; i++) {
		A_arr[i] = (int)round((double)(A_arr[i] - initial) / (HAL_RCC_GetSysClockFreq() / 1000000.0));
		printf("    %d\r\n", A_arr[i]);
	}
	printf("B_arr_before\r\n");
	for (int i = 0; i < 10; i++) {
		B_arr_before[i] = (int)round((double)(B_arr_before[i] - initial) / (HAL_RCC_GetSysClockFreq() / 1000000.0));
		printf("    %d\r\n", B_arr_before[i]);
	}
	printf("B_arr\r\n");
	for (int i = 0; i < 10; i++) {
		B_arr[i] = (int)round((double)(B_arr[i] - initial) / (HAL_RCC_GetSysClockFreq() / 1000000.0));
		printf("    %d\r\n", B_arr[i]);
	}
}


int ______main(void) {
	HAL_Init();
	SystemClock_Config();
	MX_GPIO_Init();
	MX_USART2_UART_Init();
	/* MCU Configuration is now complete. Start writing your code below this line */
	printf("\e[1;1H\e[2J\r\n\r\n\r\n");
	printf("-------New---------- Group 11\r\n");

	osKernelInit();

	if (ARM_CM_DWT_CTRL != 0) {        // See if DWT is available
		printf("Using DWT\r\n\r\n");
		ARM_CM_DEMCR      |= 1 << 24;  // Set bit 24
		ARM_CM_DWT_CYCCNT  = 0;
		ARM_CM_DWT_CTRL   |= 1 << 0;   // Set bit 0
	}else{
		printf("DWT not available \r\n\r\n");
	}

	TCB st_mytask;
	st_mytask.stack_size = STACK_SIZE;

//	st_mytask.ptask = &TaskA;
//	osCreateDeadlineTask(4, &st_mytask);
//	st_mytask.ptask = &TaskB;
//	osCreateDeadlineTask(4, &st_mytask);
//	st_mytask.ptask = &TaskC;
//	osCreateDeadlineTask(12, &st_mytask);

	st_mytask.ptask = &EDF_TaskA;
	osCreateDeadlineTask(4, &st_mytask);
	st_mytask.ptask = &EDF_TaskB;
	osCreateDeadlineTask(11, &st_mytask);

	initial = ARM_CM_DWT_CYCCNT;
	osKernelStart();
}

