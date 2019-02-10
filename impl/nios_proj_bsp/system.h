/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'crypto_wallet2_nios'
 * SOPC Builder design path: C:/Users/Class2018/Documents/Projects/Crypto_wallet/impl/qsys/crypto_wallet2_nios.sopcinfo
 *
 * Generated: Sat Feb 09 12:19:06 EST 2019
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
#define __ALTERA_AVALON_UART
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
#define ALT_STDERR_BASE 0x2012068
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x2012068
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x2012068
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "crypto_wallet2_nios"


/*
 * epcs_flash_controller configuration
 *
 */

#define ALT_MODULE_CLASS_epcs_flash_controller altera_avalon_epcs_flash_controller
#define EPCS_FLASH_CONTROLLER_BASE 0x2011000
#define EPCS_FLASH_CONTROLLER_IRQ 1
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
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x2012068
#define JTAG_UART_IRQ 0
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
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "crypto_wallet2_nios_onchip_memory2"
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
#define ONCHIP_MEMORY2_SIZE_VALUE 26000
#define ONCHIP_MEMORY2_SPAN 26000
#define ONCHIP_MEMORY2_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_WRITABLE 1


/*
 * pi_random_value configuration
 *
 */

#define ALT_MODULE_CLASS_pi_random_value altera_avalon_pio
#define PI_RANDOM_VALUE_BASE 0x2012040
#define PI_RANDOM_VALUE_BIT_CLEARING_EDGE_REGISTER 0
#define PI_RANDOM_VALUE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PI_RANDOM_VALUE_CAPTURE 0
#define PI_RANDOM_VALUE_DATA_WIDTH 8
#define PI_RANDOM_VALUE_DO_TEST_BENCH_WIRING 0
#define PI_RANDOM_VALUE_DRIVEN_SIM_VALUE 0
#define PI_RANDOM_VALUE_EDGE_TYPE "NONE"
#define PI_RANDOM_VALUE_FREQ 50000000
#define PI_RANDOM_VALUE_HAS_IN 1
#define PI_RANDOM_VALUE_HAS_OUT 0
#define PI_RANDOM_VALUE_HAS_TRI 0
#define PI_RANDOM_VALUE_IRQ -1
#define PI_RANDOM_VALUE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PI_RANDOM_VALUE_IRQ_TYPE "NONE"
#define PI_RANDOM_VALUE_NAME "/dev/pi_random_value"
#define PI_RANDOM_VALUE_RESET_VALUE 0
#define PI_RANDOM_VALUE_SPAN 16
#define PI_RANDOM_VALUE_TYPE "altera_avalon_pio"


/*
 * po_led configuration
 *
 */

#define ALT_MODULE_CLASS_po_led altera_avalon_pio
#define PO_LED_BASE 0x2012050
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
 * po_random_seed configuration
 *
 */

#define ALT_MODULE_CLASS_po_random_seed altera_avalon_pio
#define PO_RANDOM_SEED_BASE 0x2012020
#define PO_RANDOM_SEED_BIT_CLEARING_EDGE_REGISTER 0
#define PO_RANDOM_SEED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PO_RANDOM_SEED_CAPTURE 0
#define PO_RANDOM_SEED_DATA_WIDTH 32
#define PO_RANDOM_SEED_DO_TEST_BENCH_WIRING 0
#define PO_RANDOM_SEED_DRIVEN_SIM_VALUE 0
#define PO_RANDOM_SEED_EDGE_TYPE "NONE"
#define PO_RANDOM_SEED_FREQ 50000000
#define PO_RANDOM_SEED_HAS_IN 0
#define PO_RANDOM_SEED_HAS_OUT 1
#define PO_RANDOM_SEED_HAS_TRI 0
#define PO_RANDOM_SEED_IRQ -1
#define PO_RANDOM_SEED_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PO_RANDOM_SEED_IRQ_TYPE "NONE"
#define PO_RANDOM_SEED_NAME "/dev/po_random_seed"
#define PO_RANDOM_SEED_RESET_VALUE 0
#define PO_RANDOM_SEED_SPAN 16
#define PO_RANDOM_SEED_TYPE "altera_avalon_pio"


/*
 * po_system_control configuration
 *
 */

#define ALT_MODULE_CLASS_po_system_control altera_avalon_pio
#define PO_SYSTEM_CONTROL_BASE 0x2012030
#define PO_SYSTEM_CONTROL_BIT_CLEARING_EDGE_REGISTER 0
#define PO_SYSTEM_CONTROL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PO_SYSTEM_CONTROL_CAPTURE 0
#define PO_SYSTEM_CONTROL_DATA_WIDTH 8
#define PO_SYSTEM_CONTROL_DO_TEST_BENCH_WIRING 0
#define PO_SYSTEM_CONTROL_DRIVEN_SIM_VALUE 0
#define PO_SYSTEM_CONTROL_EDGE_TYPE "NONE"
#define PO_SYSTEM_CONTROL_FREQ 50000000
#define PO_SYSTEM_CONTROL_HAS_IN 0
#define PO_SYSTEM_CONTROL_HAS_OUT 1
#define PO_SYSTEM_CONTROL_HAS_TRI 0
#define PO_SYSTEM_CONTROL_IRQ -1
#define PO_SYSTEM_CONTROL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PO_SYSTEM_CONTROL_IRQ_TYPE "NONE"
#define PO_SYSTEM_CONTROL_NAME "/dev/po_system_control"
#define PO_SYSTEM_CONTROL_RESET_VALUE 0
#define PO_SYSTEM_CONTROL_SPAN 16
#define PO_SYSTEM_CONTROL_TYPE "altera_avalon_pio"


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
#define SYSID_BASE 0x2012060
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1549732693
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * uart configuration
 *
 */

#define ALT_MODULE_CLASS_uart altera_avalon_uart
#define UART_BASE 0x2012000
#define UART_BAUD 9600
#define UART_DATA_BITS 8
#define UART_FIXED_BAUD 1
#define UART_FREQ 50000000
#define UART_IRQ 2
#define UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART_NAME "/dev/uart"
#define UART_PARITY 'N'
#define UART_SIM_CHAR_STREAM ""
#define UART_SIM_TRUE_BAUD 0
#define UART_SPAN 32
#define UART_STOP_BITS 1
#define UART_SYNC_REG_DEPTH 2
#define UART_TYPE "altera_avalon_uart"
#define UART_USE_CTS_RTS 0
#define UART_USE_EOP_REGISTER 0

#endif /* __SYSTEM_H_ */
