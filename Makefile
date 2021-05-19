##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [3.13.0-B3] date: [Fri May 07 18:10:42 MSK 2021] 
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = TEST_FSMC


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES =  \
Core/Src/main.c \
Core/Src/gpio.c \
Core/Src/fsmc.c \
Core/Src/spi.c \
Core/Src/stm32f1xx_it.c \
Core/Src/stm32f1xx_hal_msp.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_exti.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c \
Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c \
Core/Src/system_stm32f1xx.c \
lvgl/lvgl_dev/lv_port_indev.c \
lvgl/src/lv_core/lv_debug.c \
lvgl/src/lv_core/lv_disp.c \
lvgl/src/lv_core/lv_group.c \
lvgl/src/lv_core/lv_indev.c \
lvgl/src/lv_core/lv_obj.c \
lvgl/src/lv_core/lv_refr.c \
lvgl/src/lv_core/lv_style.c \
lvgl/src/lv_draw/lv_draw_arc.c \
lvgl/src/lv_draw/lv_draw_blend.c \
lvgl/src/lv_draw/lv_draw_img.c \
lvgl/src/lv_draw/lv_draw_label.c \
lvgl/src/lv_draw/lv_draw_line.c \
lvgl/src/lv_draw/lv_draw_mask.c \
lvgl/src/lv_draw/lv_draw_rect.c \
lvgl/src/lv_draw/lv_draw_triangle.c \
lvgl/src/lv_draw/lv_img_buf.c \
lvgl/src/lv_draw/lv_img_cache.c \
lvgl/src/lv_draw/lv_img_decoder.c \
lvgl/src/lv_font/lv_font.c \
lvgl/src/lv_font/lv_font_dejavu_16_persian_hebrew.c \
lvgl/src/lv_font/lv_font_fmt_txt.c \
lvgl/src/lv_font/lv_font_montserrat_12.c \
lvgl/src/lv_font/lv_font_montserrat_12_subpx.c \
lvgl/src/lv_font/lv_font_montserrat_14.c \
lvgl/src/lv_font/lv_font_montserrat_16.c \
lvgl/src/lv_font/lv_font_montserrat_18.c \
lvgl/src/lv_font/lv_font_montserrat_20.c \
lvgl/src/lv_font/lv_font_montserrat_22.c \
lvgl/src/lv_font/lv_font_montserrat_24.c \
lvgl/src/lv_font/lv_font_montserrat_26.c \
lvgl/src/lv_font/lv_font_montserrat_28.c \
lvgl/src/lv_font/lv_font_montserrat_28_compressed.c \
lvgl/src/lv_font/lv_font_montserrat_30.c \
lvgl/src/lv_font/lv_font_montserrat_32.c \
lvgl/src/lv_font/lv_font_montserrat_34.c \
lvgl/src/lv_font/lv_font_montserrat_36.c \
lvgl/src/lv_font/lv_font_montserrat_38.c \
lvgl/src/lv_font/lv_font_montserrat_40.c \
lvgl/src/lv_font/lv_font_montserrat_42.c \
lvgl/src/lv_font/lv_font_montserrat_44.c \
lvgl/src/lv_font/lv_font_montserrat_46.c \
lvgl/src/lv_font/lv_font_montserrat_48.c \
lvgl/src/lv_font/lv_font_simsun_16_cjk.c \
lvgl/src/lv_font/lv_font_unscii_8.c \
lvgl/src/lv_gpu/lv_gpu_stm32_dma2d.c \
lvgl/src/lv_hal/lv_hal_disp.c \
lvgl/src/lv_hal/lv_hal_indev.c \
lvgl/src/lv_hal/lv_hal_tick.c \
lvgl/src/lv_misc/lv_anim.c \
lvgl/src/lv_misc/lv_area.c \
lvgl/src/lv_misc/lv_async.c \
lvgl/src/lv_misc/lv_bidi.c \
lvgl/src/lv_misc/lv_color.c \
lvgl/src/lv_misc/lv_fs.c \
lvgl/src/lv_misc/lv_gc.c \
lvgl/src/lv_misc/lv_ll.c \
lvgl/src/lv_misc/lv_log.c \
lvgl/src/lv_misc/lv_math.c \
lvgl/src/lv_misc/lv_mem.c \
lvgl/src/lv_misc/lv_printf.c \
lvgl/src/lv_misc/lv_task.c \
lvgl/src/lv_misc/lv_templ.c \
lvgl/src/lv_misc/lv_txt_ap.c \
lvgl/src/lv_misc/lv_txt.c \
lvgl/src/lv_misc/lv_utils.c \
lvgl/src/lv_themes/lv_theme.c \
lvgl/src/lv_themes/lv_theme_empty.c \
lvgl/src/lv_themes/lv_theme_material.c \
lvgl/src/lv_themes/lv_theme_mono.c \
lvgl/src/lv_themes/lv_theme_template.c \
lvgl/src/lv_widgets/lv_arc.c \
lvgl/src/lv_widgets/lv_bar.c \
lvgl/src/lv_widgets/lv_btn.c \
lvgl/src/lv_widgets/lv_btnmatrix.c \
lvgl/src/lv_widgets/lv_calendar.c \
lvgl/src/lv_widgets/lv_canvas.c \
lvgl/src/lv_widgets/lv_chart.c \
lvgl/src/lv_widgets/lv_checkbox.c \
lvgl/src/lv_widgets/lv_cont.c \
lvgl/src/lv_widgets/lv_cpicker.c \
lvgl/src/lv_widgets/lv_dropdown.c \
lvgl/src/lv_widgets/lv_gauge.c \
lvgl/src/lv_widgets/lv_imgbtn.c \
lvgl/src/lv_widgets/lv_img.c \
lvgl/src/lv_widgets/lv_keyboard.c \
lvgl/src/lv_widgets/lv_label.c \
lvgl/src/lv_widgets/lv_led.c \
lvgl/src/lv_widgets/lv_line.c \
lvgl/src/lv_widgets/lv_linemeter.c \
lvgl/src/lv_widgets/lv_list.c \
lvgl/src/lv_widgets/lv_msgbox.c \
lvgl/src/lv_widgets/lv_objmask.c \
lvgl/src/lv_widgets/lv_objx_templ.c \
lvgl/src/lv_widgets/lv_page.c \
lvgl/src/lv_widgets/lv_roller.c \
lvgl/src/lv_widgets/lv_slider.c \
lvgl/src/lv_widgets/lv_spinbox.c \
lvgl/src/lv_widgets/lv_spinner.c \
lvgl/src/lv_widgets/lv_switch.c \
lvgl/src/lv_widgets/lv_table.c \
lvgl/src/lv_widgets/lv_tabview.c \
lvgl/src/lv_widgets/lv_textarea.c \
lvgl/src/lv_widgets/lv_tileview.c \
lvgl/src/lv_widgets/lv_win.c \
ILI9341/ili9341.c \
ILI9341/font8.c \
ILI9341/font12.c \
ILI9341/font16.c \
ILI9341/font20.c \
ILI9341/font24.c 
#lvgl/lvgl_dev/lv_port_disp.c 


# ASM sources
ASM_SOURCES =  \
startup_stm32f103xe.s


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m3

# fpu
# NONE for Cortex-M0/M0+/M3

# float-abi


# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_FULL_LL_DRIVER \
-DUSE_HAL_DRIVER \
-DSTM32F103xE


# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-ICore/Inc \
-IDrivers/STM32F1xx_HAL_Driver/Inc \
-IDrivers/STM32F1xx_HAL_Driver/Inc/Legacy \
-IDrivers/CMSIS/Device/ST/STM32F1xx/Include \
-IDrivers/CMSIS/Include \
-IILI9341 \
-Ilvgl \
-Ilvgl/lvgl_dev \
-Ilvgl/src \
-Ilvgl/src/lv_core \
-Ilvgl/src/lv_draw \
-Ilvgl/src/lv_font \
-Ilvgl/src/lv_gpu \
-Ilvgl/src/lv_hal \
-Ilvgl/src/lv_misc \
-Ilvgl/src/lv_themes \
-Ilvgl/src/lv_widgets \
-I


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -O3 -fdata-sections -ffunction-sections

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -O3 -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32F103ZETx_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-O3,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	@echo "\r\n---------------------   SIZE   ----------------------"
	@$(CC) $(OBJECTS) $(LDFLAGS) -o $@ -Wl,--print-memory-usage
	@echo ""
	@$(SZ) $@
	@echo "-----------------------------------------------------"

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
