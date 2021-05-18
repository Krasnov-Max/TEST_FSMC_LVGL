/**
  ******************************************************************************
  * File Name          : FSMC.h
  * Description        : This file provides code for the configuration
  *                      of the FSMC peripheral.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __FSMC_H
#define __FSMC_H
#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* USER CODE BEGIN Includes */
/* LCD is connected to the FSMC_Bank1 and NE1 is used as ship select signal, A16 use as RS */
//#define LCD_REG      ((uint32_t)(0x60000000))
//#define LCD_DATA     ((uint32_t)(0x60000000) | 1<<17)

#define LCD_DATA ((uint32_t)0x60020000)
#define LCD_REG  ((uint32_t)0x60000000)

//const volatile uint32_t LCD_DATA = 0x60020000;
//void LCD_CmdWrite(const uint16_t Command);
//void LCD_DataWrite(const uint16_t Data);
/* USER CODE END Includes */

extern SRAM_HandleTypeDef hsram1;

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

void MX_FSMC_Init(void);
void HAL_SRAM_MspInit(SRAM_HandleTypeDef* hsram);
void HAL_SRAM_MspDeInit(SRAM_HandleTypeDef* hsram);

/* USER CODE BEGIN Prototypes */

/* USER CODE END Prototypes */

#ifdef __cplusplus
}
#endif
#endif /*__FSMC_H */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
