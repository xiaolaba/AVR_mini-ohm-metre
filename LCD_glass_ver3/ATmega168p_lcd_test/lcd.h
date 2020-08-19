
// original copy : https://www.amobbs.com/forum.php?mod=viewthread&tid=4560171
// M48 version
/*
 * original file saved as GBK, converts to UTF8 CHT
 * tools: https://github.com/flier268/ConvertZZ
 * xiaolaba, 2020-AUG-18
 * 
 * port to avr-gcc, u8 -> uint8_t, u16 -> uint16_t
 * port to ATmega168p
 * 
 */



/******************** (C) COPYRIGHT 2011 bluefeel ********************
* File Name          : lcd.c
* Author             : bluefeel
* Date First Issued  : 2011.2.12
* Description        : Lcd.c的聲明和段式液晶的介面聲明
********************************************************************************
* 程式歷史:
* 2011.1.30 : Version 1.0
* 2011.2.12 : Version 2.0（ATmega48）
********************************************************************************
* 目前程式意在為程式設計師提供段式液晶編碼指導，以便程式設計師為他們的產品節省時間。
* 因此，對於使用該程式或編碼資訊的個人與團體而造成相關產品的任何直接、間接的
* 損失，本人將不承擔任何方面的責任，亦不道歉。本人亦有且只按個人意願提供有限
* 的技術支援。
*******************************************************************************/


#include "port_to_ATmega168p.h"


#ifndef __LCD_H__
#define __LCD_H__

//typedef unsigned int  u16;
//typedef unsigned char u8;


// revised port name design, easy to change with differt port number
// see port_to_ATmega168p.h
#define COM0_LOW()         do{COM_DRIVER_PORT &= ~0x01; COM_DRIVER_DDR |= 0x01;}while(0)
#define COM1_LOW()         do{COM_DRIVER_PORT &= ~0x02; COM_DRIVER_DDR |= 0x02;}while(0)
#define COM2_LOW()         do{COM_DRIVER_PORT &= ~0x04; COM_DRIVER_DDR |= 0x04;}while(0)
#define COM3_LOW()         do{COM_DRIVER_PORT &= ~0x08; COM_DRIVER_DDR |= 0x08;}while(0)
// 設定某個COM IO輸出高電平
#define COM0_HIGH()        do{COM_DRIVER_PORT |= 0x01; COM_DRIVER_DDR |= 0x01;}while(0)
#define COM1_HIGH()        do{COM_DRIVER_PORT |= 0x02; COM_DRIVER_DDR |= 0x02;}while(0)
#define COM2_HIGH()        do{COM_DRIVER_PORT |= 0x04; COM_DRIVER_DDR |= 0x04;}while(0)
#define COM3_HIGH()        do{COM_DRIVER_PORT |= 0x08; COM_DRIVER_DDR |= 0x08;}while(0)
// 設定所有COM IO輸出VDD/2
#define COM_ALL_HALF()     do{COM_DRIVER_PORT &= 0xf0; COM_DRIVER_DDR &= 0xf0;}while(0)
// 設定所有COM/SEG IO輸出低電平
#define COM_SEG_ALL_LOW()  do{COM_DRIVER_PORT &= 0xf0; COM_DRIVER_DDR |= 0x0f; SEG_DRIVER_PORT2 &= 0xf0; SEG_DRIVER_PORT1 &= 0x00;}while(0)
// 定義SEG埠
#define SEG_LOAD(x)        do{SEG_DRIVER_PORT1 = (x); SEG_DRIVER_PORT2 |= ((x) >> 8) & 0x0f;}while(0)
// 顯示某個小數點
#define LCD_Show_Dot(x)    frame[0] |= 0x0080 << ((x) << 1)




/*

// 設定某個COM IO輸出低電平
#define COM0_LOW()         do{PORTC &= ~0x01; DDRC |= 0x01;}while(0)
#define COM1_LOW()         do{PORTC &= ~0x02; DDRC |= 0x02;}while(0)
#define COM2_LOW()         do{PORTC &= ~0x04; DDRC |= 0x04;}while(0)
#define COM3_LOW()         do{PORTC &= ~0x08; DDRC |= 0x08;}while(0)
// 設定某個COM IO輸出高電平
#define COM0_HIGH()        do{PORTC |= 0x01; DDRC |= 0x01;}while(0)
#define COM1_HIGH()        do{PORTC |= 0x02; DDRC |= 0x02;}while(0)
#define COM2_HIGH()        do{PORTC |= 0x04; DDRC |= 0x04;}while(0)
#define COM3_HIGH()        do{PORTC |= 0x08; DDRC |= 0x08;}while(0)
// 設定所有COM IO輸出VDD/2
#define COM_ALL_HALF()     do{PORTC &= 0xf0; DDRC &= 0xf0;}while(0)
// 設定所有COM/SEG IO輸出低電平
#define COM_SEG_ALL_LOW()  do{PORTC &= 0xf0; DDRC |= 0x0f; PORTB &= 0xf0; PORTD &= 0x00;}while(0)
// 定義SEG埠
#define SEG_LOAD(x)        do{PORTD = (x); PORTB |= ((x) >> 8) & 0x0f;}while(0)
// 顯示某個小數點
#define LCD_Show_Dot(x)    frame[0] |= 0x0080 << ((x) << 1)
*/



/*

// 設定某個COM IO輸出低電平
#define COM0_LOW()         do{PORTC &= ~0x01; DDRC |= 0x01;}while(0)
#define COM1_LOW()         do{PORTC &= ~0x02; DDRC |= 0x02;}while(0)
#define COM2_LOW()         do{PORTC &= ~0x04; DDRC |= 0x04;}while(0)
#define COM3_LOW()         do{PORTC &= ~0x08; DDRC |= 0x08;}while(0)
// 設定某個COM IO輸出高電平
#define COM0_HIGH()        do{PORTC |= 0x01; DDRC |= 0x01;}while(0)
#define COM1_HIGH()        do{PORTC |= 0x02; DDRC |= 0x02;}while(0)
#define COM2_HIGH()        do{PORTC |= 0x04; DDRC |= 0x04;}while(0)
#define COM3_HIGH()        do{PORTC |= 0x08; DDRC |= 0x08;}while(0)
// 設定所有COM IO輸出VDD/2
#define COM_ALL_HALF()     do{PORTC &= 0xf0; DDRC &= 0xf0;}while(0)
// 設定所有COM/SEG IO輸出低電平
#define COM_SEG_ALL_LOW()  do{PORTC &= 0xf0; DDRC |= 0x0f; PORTB &= 0xf0; PORTD &= 0x00;}while(0)
// 定義SEG埠
#define SEG_LOAD(x)        do{PORTD = (x); PORTB |= ((x) >> 8) & 0x0f;}while(0)
// 顯示某個小數點
#define LCD_Show_Dot(x)    frame[0] |= 0x0080 << ((x) << 1)
*/


extern uint16_t frame[4];
void LCD_Write_Str(unsigned char *str);

#endif
