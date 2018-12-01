/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'crypto_wallet'
 * SOPC Builder design path: C:/Users/Class2018/Documents/Projects/Crypto_wallet/impl/qsys/crypto_wallet.sopcinfo
 *
 * Generated: Thu Nov 29 21:18:21 EST 2018
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x02011820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1a
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x02008020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x1a
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x02008000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x02011820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x1a
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x02008020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x1a
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x02008000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_GEN2


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x20120b8
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x20120b8
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x20120b8
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "crypto_wallet"


/*
 * epcs_flash_controller configuration
 *
 */

#define ALT_MODULE_CLASS_epcs_flash_controller altera_avalon_epcs_flash_controller
#define EPCS_FLASH_CONTROLLER_BASE 0x2011000
#define EPCS_FLASH_CONTROLLER_IRQ 0
#define EPCS_FLASH_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_CONTROLLER_NAME "/dev/epcs_flash_controller"
#define EPCS_FLASH_CONTROLLER_REGISTER_OFFSET 1024
#define EPCS_FLASH_CONTROLLER_SPAN 2048
#define EPCS_FLASH_CONTROLLER_TYPE "altera_avalon_epcs_flash_controller"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 4
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x20120b8
#define JTAG_UART_IRQ 1
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * onchip_memory2 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_BASE 0x2008000
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_DUAL_PORT 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "crypto_wallet_onchip_memory2"
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_IRQ -1
#define ONCHIP_MEMORY2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_NAME "/dev/onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_SIZE_VALUE 32000
#define ONCHIP_MEMORY2_SPAN 32000
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_WRITABLE 1


/*
 * pi_gpio0 configuration
 *
 */

#define ALT_MODULE_CLASS_pi_gpio0 altera_avalon_pio
#define PI_GPIO0_BASE 0x2012060
#define PI_GPIO0_BIT_CLEARING_EDGE_REGISTER 0
#define PI_GPIO0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PI_GPIO0_CAPTURE 0
#define PI_GPIO0_DATA_WIDTH 2
#define PI_GPIO0_DO_TEST_BENCH_WIRING 0
#define PI_GPIO0_DRIVEN_SIM_VALUE 0
#define PI_GPIO0_EDGE_TYPE "NONE"
#define PI_GPIO0_FREQ 50000000
#define PI_GPIO0_HAS_IN 1
#define PI_GPIO0_HAS_OUT 0
#define PI_GPIO0_HAS_TRI 0
#define PI_GPIO0_IRQ -1
#define PI_GPIO0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PI_GPIO0_IRQ_TYPE "NONE"
#define PI_GPIO0_NAME "/dev/pi_gpio0"
#define PI_GPIO0_RESET_VALUE 0
#define PI_GPIO0_SPAN 16
#define PI_GPIO0_TYPE "altera_avalon_pio"


/*
 * pi_gpio1 configuration
 *
 */

#define ALT_MODULE_CLASS_pi_gpio1 altera_avalon_pio
#define PI_GPIO1_BASE 0x2012070
#define PI_GPIO1_BIT_CLEARING_EDGE_REGISTER 0
#define PI_GPIO1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PI_GPIO1_CAPTURE 0
#define PI_GPIO1_DATA_WIDTH 2
#define PI_GPIO1_DO_TEST_BENCH_WIRING 0
#define PI_GPIO1_DRIVEN_SIM_VALUE 0
#define PI_GPIO1_EDGE_TYPE "NONE"
#define PI_GPIO1_FREQ 50000000
#define PI_GPIO1_HAS_IN 1
#define PI_GPIO1_HAS_OUT 0
#define PI_GPIO1_HAS_TRI 0
#define PI_GPIO1_IRQ -1
#define PI_GPIO1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PI_GPIO1_IRQ_TYPE "NONE"
#define PI_GPIO1_NAME "/dev/pi_gpio1"
#define PI_GPIO1_RESET_VALUE 0
#define PI_GPIO1_SPAN 16
#define PI_GPIO1_TYPE "altera_avalon_pio"


/*
 * pi_gpio2 configuration
 *
 */

#define ALT_MODULE_CLASS_pi_gpio2 altera_avalon_pio
#define PI_GPIO2_BASE 0x2012050
#define PI_GPIO2_BIT_CLEARING_EDGE_REGISTER 0
#define PI_GPIO2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PI_GPIO2_CAPTURE 0
#define PI_GPIO2_DATA_WIDTH 3
#define PI_GPIO2_DO_TEST_BENCH_WIRING 0
#define PI_GPIO2_DRIVEN_SIM_VALUE 0
#define PI_GPIO2_EDGE_TYPE "NONE"
#define PI_GPIO2_FREQ 50000000
#define PI_GPIO2_HAS_IN 1
#define PI_GPIO2_HAS_OUT 0
#define PI_GPIO2_HAS_TRI 0
#define PI_GPIO2_IRQ -1
#define PI_GPIO2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PI_GPIO2_IRQ_TYPE "NONE"
#define PI_GPIO2_NAME "/dev/pi_gpio2"
#define PI_GPIO2_RESET_VALUE 0
#define PI_GPIO2_SPAN 16
#define PI_GPIO2_TYPE "altera_avalon_pio"


/*
 * pi_key configuration
 *
 */

#define ALT_MODULE_CLASS_pi_key altera_avalon_pio
#define PI_KEY_BASE 0x2012090
#define PI_KEY_BIT_CLEARING_EDGE_REGISTER 0
#define PI_KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PI_KEY_CAPTURE 0
#define PI_KEY_DATA_WIDTH 2
#define PI_KEY_DO_TEST_BENCH_WIRING 0
#define PI_KEY_DRIVEN_SIM_VALUE 0
#define PI_KEY_EDGE_TYPE "NONE"
#define PI_KEY_FREQ 50000000
#define PI_KEY_HAS_IN 1
#define PI_KEY_HAS_OUT 0
#define PI_KEY_HAS_TRI 0
#define PI_KEY_IRQ -1
#define PI_KEY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PI_KEY_IRQ_TYPE "NONE"
#define PI_KEY_NAME "/dev/pi_key"
#define PI_KEY_RESET_VALUE 0
#define PI_KEY_SPAN 16
#define PI_KEY_TYPE "altera_avalon_pio"


/*
 * pi_sw configuration
 *
 */

#define ALT_MODULE_CLASS_pi_sw altera_avalon_pio
#define PI_SW_BASE 0x2012080
#define PI_SW_BIT_CLEARING_EDGE_REGISTER 0
#define PI_SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PI_SW_CAPTURE 0
#define PI_SW_DATA_WIDTH 4
#define PI_SW_DO_TEST_BENCH_WIRING 0
#define PI_SW_DRIVEN_SIM_VALUE 0
#define PI_SW_EDGE_TYPE "NONE"
#define PI_SW_FREQ 50000000
#define PI_SW_HAS_IN 1
#define PI_SW_HAS_OUT 0
#define PI_SW_HAS_TRI 0
#define PI_SW_IRQ -1
#define PI_SW_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PI_SW_IRQ_TYPE "NONE"
#define PI_SW_NAME "/dev/pi_sw"
#define PI_SW_RESET_VALUE 0
#define PI_SW_SPAN 16
#define PI_SW_TYPE "altera_avalon_pio"


/*
 * pio_gpio0_31to0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_gpio0_31to0 altera_avalon_pio
#define PIO_GPIO0_31TO0_BASE 0x2012030
#define PIO_GPIO0_31TO0_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_GPIO0_31TO0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_GPIO0_31TO0_CAPTURE 0
#define PIO_GPIO0_31TO0_DATA_WIDTH 32
#define PIO_GPIO0_31TO0_DO_TEST_BENCH_WIRING 0
#define PIO_GPIO0_31TO0_DRIVEN_SIM_VALUE 0
#define PIO_GPIO0_31TO0_EDGE_TYPE "NONE"
#define PIO_GPIO0_31TO0_FREQ 50000000
#define PIO_GPIO0_31TO0_HAS_IN 0
#define PIO_GPIO0_31TO0_HAS_OUT 0
#define PIO_GPIO0_31TO0_HAS_TRI 1
#define PIO_GPIO0_31TO0_IRQ -1
#define PIO_GPIO0_31TO0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_GPIO0_31TO0_IRQ_TYPE "NONE"
#define PIO_GPIO0_31TO0_NAME "/dev/pio_gpio0_31to0"
#define PIO_GPIO0_31TO0_RESET_VALUE 0
#define PIO_GPIO0_31TO0_SPAN 16
#define PIO_GPIO0_31TO0_TYPE "altera_avalon_pio"


/*
 * pio_gpio0_33to32 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_gpio0_33to32 altera_avalon_pio
#define PIO_GPIO0_33TO32_BASE 0x2012010
#define PIO_GPIO0_33TO32_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_GPIO0_33TO32_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_GPIO0_33TO32_CAPTURE 0
#define PIO_GPIO0_33TO32_DATA_WIDTH 2
#define PIO_GPIO0_33TO32_DO_TEST_BENCH_WIRING 0
#define PIO_GPIO0_33TO32_DRIVEN_SIM_VALUE 0
#define PIO_GPIO0_33TO32_EDGE_TYPE "NONE"
#define PIO_GPIO0_33TO32_FREQ 50000000
#define PIO_GPIO0_33TO32_HAS_IN 0
#define PIO_GPIO0_33TO32_HAS_OUT 0
#define PIO_GPIO0_33TO32_HAS_TRI 1
#define PIO_GPIO0_33TO32_IRQ -1
#define PIO_GPIO0_33TO32_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_GPIO0_33TO32_IRQ_TYPE "NONE"
#define PIO_GPIO0_33TO32_NAME "/dev/pio_gpio0_33to32"
#define PIO_GPIO0_33TO32_RESET_VALUE 0
#define PIO_GPIO0_33TO32_SPAN 16
#define PIO_GPIO0_33TO32_TYPE "altera_avalon_pio"


/*
 * pio_gpio1_31to0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_gpio1_31to0 altera_avalon_pio
#define PIO_GPIO1_31TO0_BASE 0x2012020
#define PIO_GPIO1_31TO0_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_GPIO1_31TO0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_GPIO1_31TO0_CAPTURE 0
#define PIO_GPIO1_31TO0_DATA_WIDTH 32
#define PIO_GPIO1_31TO0_DO_TEST_BENCH_WIRING 0
#define PIO_GPIO1_31TO0_DRIVEN_SIM_VALUE 0
#define PIO_GPIO1_31TO0_EDGE_TYPE "NONE"
#define PIO_GPIO1_31TO0_FREQ 50000000
#define PIO_GPIO1_31TO0_HAS_IN 0
#define PIO_GPIO1_31TO0_HAS_OUT 0
#define PIO_GPIO1_31TO0_HAS_TRI 1
#define PIO_GPIO1_31TO0_IRQ -1
#define PIO_GPIO1_31TO0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_GPIO1_31TO0_IRQ_TYPE "NONE"
#define PIO_GPIO1_31TO0_NAME "/dev/pio_gpio1_31to0"
#define PIO_GPIO1_31TO0_RESET_VALUE 0
#define PIO_GPIO1_31TO0_SPAN 16
#define PIO_GPIO1_31TO0_TYPE "altera_avalon_pio"


/*
 * pio_gpio1_33to32 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_gpio1_33to32 altera_avalon_pio
#define PIO_GPIO1_33TO32_BASE 0x2012000
#define PIO_GPIO1_33TO32_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_GPIO1_33TO32_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_GPIO1_33TO32_CAPTURE 0
#define PIO_GPIO1_33TO32_DATA_WIDTH 2
#define PIO_GPIO1_33TO32_DO_TEST_BENCH_WIRING 0
#define PIO_GPIO1_33TO32_DRIVEN_SIM_VALUE 0
#define PIO_GPIO1_33TO32_EDGE_TYPE "NONE"
#define PIO_GPIO1_33TO32_FREQ 50000000
#define PIO_GPIO1_33TO32_HAS_IN 0
#define PIO_GPIO1_33TO32_HAS_OUT 0
#define PIO_GPIO1_33TO32_HAS_TRI 1
#define PIO_GPIO1_33TO32_IRQ -1
#define PIO_GPIO1_33TO32_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_GPIO1_33TO32_IRQ_TYPE "NONE"
#define PIO_GPIO1_33TO32_NAME "/dev/pio_gpio1_33to32"
#define PIO_GPIO1_33TO32_RESET_VALUE 0
#define PIO_GPIO1_33TO32_SPAN 16
#define PIO_GPIO1_33TO32_TYPE "altera_avalon_pio"


/*
 * pio_gpio2 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_gpio2 altera_avalon_pio
#define PIO_GPIO2_BASE 0x2012040
#define PIO_GPIO2_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_GPIO2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_GPIO2_CAPTURE 0
#define PIO_GPIO2_DATA_WIDTH 13
#define PIO_GPIO2_DO_TEST_BENCH_WIRING 0
#define PIO_GPIO2_DRIVEN_SIM_VALUE 0
#define PIO_GPIO2_EDGE_TYPE "NONE"
#define PIO_GPIO2_FREQ 50000000
#define PIO_GPIO2_HAS_IN 0
#define PIO_GPIO2_HAS_OUT 0
#define PIO_GPIO2_HAS_TRI 1
#define PIO_GPIO2_IRQ -1
#define PIO_GPIO2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_GPIO2_IRQ_TYPE "NONE"
#define PIO_GPIO2_NAME "/dev/pio_gpio2"
#define PIO_GPIO2_RESET_VALUE 0
#define PIO_GPIO2_SPAN 16
#define PIO_GPIO2_TYPE "altera_avalon_pio"


/*
 * po_led configuration
 *
 */

#define ALT_MODULE_CLASS_po_led altera_avalon_pio
#define PO_LED_BASE 0x20120a0
#define PO_LED_BIT_CLEARING_EDGE_REGISTER 0
#define PO_LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PO_LED_CAPTURE 0
#define PO_LED_DATA_WIDTH 8
#define PO_LED_DO_TEST_BENCH_WIRING 0
#define PO_LED_DRIVEN_SIM_VALUE 0
#define PO_LED_EDGE_TYPE "NONE"
#define PO_LED_FREQ 50000000
#define PO_LED_HAS_IN 0
#define PO_LED_HAS_OUT 1
#define PO_LED_HAS_TRI 0
#define PO_LED_IRQ -1
#define PO_LED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PO_LED_IRQ_TYPE "NONE"
#define PO_LED_NAME "/dev/po_led"
#define PO_LED_RESET_VALUE 0
#define PO_LED_SPAN 16
#define PO_LED_TYPE "altera_avalon_pio"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x0
#define SDRAM_CAS_LATENCY 2
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 8
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 200.0
#define SDRAM_REFRESH_PERIOD 0.75
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x18
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 9
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 13
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 33554432
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 6.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x20120b0
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1543541832
#define SYSID_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
