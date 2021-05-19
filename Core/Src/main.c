/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "spi.h"
#include "usart.h"
#include "gpio.h"
#include "fsmc.h"
#include <stdio.h>
#include <stdlib.h>

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "lvgl.h"
#include "ili9341.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
static lv_style_t style;

lv_obj_t *btn1;
lv_obj_t *btn2;
lv_obj_t *screenMain;
lv_obj_t *label;
lv_disp_drv_t disp_drv;                         /*Descriptor of a display driver*/
static lv_disp_buf_t disp_buf_1;
static lv_color_t buf1_1[LV_HOR_RES_MAX * 10];  
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
static void event_handler(lv_obj_t * obj, lv_event_t event);
static void disp_init(void);
static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p);
void lvglLoggerCallback(lv_log_level_t level, const char * file, uint32_t line, const char * functionName, const char* dsc);
#if defined(__GNUC__)
int _write(int fd, char * ptr, int len)
{
  HAL_UART_Transmit(&huart2, (uint8_t *) ptr, len, HAL_MAX_DELAY);
  return len;
}
#elif defined (__ICCARM__)
#include "LowLevelIOInterface.h"
size_t __write(int handle, const unsigned char * buffer, size_t size)
{
  HAL_UART_Transmit(&huart1, (uint8_t *) buffer, size, HAL_MAX_DELAY);
  return size;
}
#elif defined (__CC_ARM)
int fputc(int ch, FILE *f)
{
    HAL_UART_Transmit(&huart1, (uint8_t *)&ch, 1, HAL_MAX_DELAY);
    return ch;
}
#endif

// OR:

// Add syscalls.c with GCC

#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif /* __GNUC__ */

/**
  * @brief  Retargets the C library printf function to the USART.
  * @param  None
  * @retval None
  */
PUTCHAR_PROTOTYPE
{
  HAL_UART_Transmit(&huart2, (uint8_t *)&ch, 1, HAL_MAX_DELAY);
  return ch;
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
uint16_t i;
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_FSMC_Init();
  MX_SPI1_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
  LL_GPIO_ResetOutputPin(LCD_RESET_GPIO_Port, LCD_RESET_Pin);
  HAL_Delay(10);
  LL_GPIO_SetOutputPin(LCD_RESET_GPIO_Port, LCD_RESET_Pin);
  lcdInit();
 lcdFillRGB(0);
 lcdTest();
  lcdSetTextFont(&Font20);
  lcdPrintf("Test");
  printf("Test");
   LL_GPIO_SetOutputPin(GPIOE, LL_GPIO_PIN_2); 
  LL_mDelay(1000);
  lcdFillRGB(COLOR_MAGENTA);
   LL_mDelay(1000);
    LL_GPIO_ResetOutputPin(GPIOE, LL_GPIO_PIN_2); 
   lv_init();
    #if LV_USE_LOG == 1
      lv_log_register_print_cb( lvglLoggerCallback );
    #endif
   disp_init();
   lv_disp_buf_init(&disp_buf_1, buf1_1, NULL, LV_HOR_RES_MAX * 10);   /*Initialize the display buffer*/
   lv_disp_drv_init(&disp_drv);                    /*Basic initialization*/
    /*Set up the functions to access to your display*/
    /*Set the resolution of the display*/
    disp_drv.hor_res = 240;
    disp_drv.ver_res = 320;
    /*Used to copy the buffer's content to the display*/
    disp_drv.flush_cb = disp_flush;
    /*Set a display buffer*/
    disp_drv.buffer = &disp_buf_1;
     lv_disp_drv_register(&disp_drv);
   
screenMain = lv_scr_act();
   label = lv_label_create(screenMain, NULL);
  lv_label_set_long_mode(label, LV_LABEL_LONG_BREAK);
  lv_label_set_text(label, "Press a button");
  lv_label_set_align(label, LV_LABEL_ALIGN_CENTER);
  lv_obj_set_size(label, 240, 40);
  lv_obj_set_pos(label, 0, 15);

  btn1 = lv_btn_create(screenMain, NULL);
  //lv_obj_set_event_cb(btn1, event_handler_btn);
  lv_obj_set_width(btn1, 70);
  lv_obj_set_height(btn1, 32);
  lv_obj_set_pos(btn1, 32, 100);

  lv_obj_t * label1 = lv_label_create(btn1, NULL);
  lv_label_set_text(label1, "Hello");

  btn2 = lv_btn_create(screenMain, NULL);
  //lv_obj_set_event_cb(btn2, event_handler_btn);
  lv_obj_set_width(btn2, 70);
  lv_obj_set_height(btn2, 32);
  lv_obj_set_pos(btn2, 142, 100);

  lv_obj_t * label2 = lv_label_create(btn2, NULL);
  lv_label_set_text(label2, "Goodbye");

  lv_scr_load(screenMain);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
    LL_mDelay(10);
    lv_task_handler();
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  LL_FLASH_SetLatency(LL_FLASH_LATENCY_2);
  while(LL_FLASH_GetLatency()!= LL_FLASH_LATENCY_2)
  {
  }
  LL_RCC_HSE_Enable();

   /* Wait till HSE is ready */
  while(LL_RCC_HSE_IsReady() != 1)
  {

  }
  LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSE_DIV_1, LL_RCC_PLL_MUL_9);
  LL_RCC_PLL_Enable();

   /* Wait till PLL is ready */
  while(LL_RCC_PLL_IsReady() != 1)
  {

  }
  LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
  LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_2);
  LL_RCC_SetAPB2Prescaler(LL_RCC_APB2_DIV_1);
  LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);

   /* Wait till System clock is ready */
  while(LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL)
  {

  }
  LL_SetSystemCoreClock(72000000);

   /* Update the time base */
  if (HAL_InitTick (TICK_INT_PRIORITY) != HAL_OK)
  {
    Error_Handler();
  }
  LL_RCC_ConfigMCO(LL_RCC_MCO1SOURCE_PLLCLK_DIV_2);
}

/* USER CODE BEGIN 4 */
static void event_handler(lv_obj_t * obj, lv_event_t event)
{
    if(event == LV_EVENT_CLICKED) {
        printf("Clicked\n");
    }
    else if(event == LV_EVENT_VALUE_CHANGED) {
        printf("Toggled\n");
    }
}



/**********************
 *   STATIC FUNCTIONS
 **********************/

/* Initialize your display and the required peripherals. */
static void disp_init(void)
{
    /*You code here*/
 
  lcdInit();
 

}

/* Flush the content of the internal buffer the specific area on the display
 * You can use DMA or any hardware acceleration to do this operation in the background but
 * 'lv_disp_flush_ready()' has to be called when finished. */
static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p)
{
    /*The most simple case (but also the slowest) to put all pixels to the screen one-by-one*/

    int32_t x;
    int32_t y;
    for(y = area->y1; y <= area->y2; y++) 
        {
            for(x = area->x1; x <= area->x2; x++) 
                {
                    /* Put a pixel to the display. For example: */
                    /* put_px(x, y, *color_p)*/
                    lcdDrawPixel(x, y, color_p->full);
                }           
            color_p++;
        }
    

    /* IMPORTANT!!!
     * Inform the graphics library that you are ready with the flushing*/
    lv_disp_flush_ready(disp_drv);
    
}

void lvglLoggerCallback(lv_log_level_t level, const char * file, uint32_t line, const char * functionName, const char* dsc)
            {
                switch( level )
                {
                    case LV_LOG_LEVEL_ERROR:
                        printf( "[ERROR]:" );
                    break;
                    case LV_LOG_LEVEL_WARN:
                        printf( "[WARNING]:" );
                    break;
                    case LV_LOG_LEVEL_INFO:
                        printf( "[INFO]:" );
                    break;
                    case LV_LOG_LEVEL_TRACE:
                        printf( "[TRACE]:" );
                    break;

                    default:
                        printf( "[LVGL_LOG]:" );
                }
                printf( "File:"  );
                printf("%s", file );
                printf( ":" );
                printf(":functon ");
                printf("%s", functionName);
                printf( " %s ",dsc );
               
            }
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
