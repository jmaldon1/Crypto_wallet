#ifndef __UART_USB_H__
#define __UART_USB_H__

#define UART_USB_BAUD_RATE 115200

char uartGetChar();

void uartGetLine(char *buf);

#if 0
void uartRxChar(char *c);

void uartTxChar(char *c);

void uartTxString(char *str);
#endif


void initUart();

unsigned char EmptyUart();

unsigned char GetCUart(void);

unsigned char PutStrUart(char *str);

unsigned char PutCUart(unsigned char in_char);


#endif