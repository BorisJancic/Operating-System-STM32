#include "common.h"
#include "main.h"
#include "k_task.h"
#include <stdio.h> //You are permitted to use this library, but currently only printf is implemented. Anything else is up to you!

extern TCB tcb_array[MAX_TASKS];
extern int kernel_running;
extern int current_task_index;

//int count = 1000;
#define ITERATIONS 100 //5000

void Task1_L3(void *) {
   while(1){
     printf("1\r\n");
     for (int i_cnt = 0; i_cnt < ITERATIONS; i_cnt++);
     osYield();
   }
}


void Task2_L3(void *) {
   while(1){
     printf("2\r\n");
     for (int i_cnt = 0; i_cnt < ITERATIONS; i_cnt++);
     osYield();
   }
}


void Task3_L3(void *) {
   while(1){
     printf("3\r\n");
     for (int i_cnt = 0; i_cnt < ITERATIONS; i_cnt++);
     osYield();
   }
}


int ___main______(void) {
	HAL_Init();
	SystemClock_Config();
	MX_GPIO_Init();
	MX_USART2_UART_Init();
	/* MCU Configuration is now complete. Start writing your code below this line */
	printf("\e[1;1H\e[2J\r\n\r\n\r\n");
	printf("-------New----------\r\n");

	osKernelInit();


	TCB st_mytask;
	st_mytask.stack_size = STACK_SIZE;

	st_mytask.ptask = &Task1_L3;
	osCreateTask(&st_mytask);

	st_mytask.ptask = &Task2_L3;
	osCreateTask(&st_mytask);

	st_mytask.ptask = &Task3_L3;
	osCreateTask(&st_mytask);

	osKernelStart();
}

