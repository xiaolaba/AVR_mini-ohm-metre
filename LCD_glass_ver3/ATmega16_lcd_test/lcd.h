// original copy : https://www.amobbs.com/forum.php?mod=viewthread&tid=4560171
/*
 * original file saved as GBK, converts to UTF8 CHT
 * tools: https://github.com/flier268/ConvertZZ
 * xiaolaba, 2020-AUG-18
 * 
 * port to avr-gcc, u8 -> uint8_t, u16 -> uint16_t
 * port to ATmeag8, oroginal ATmega16
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
* 2011.2.12 : Version 2.0（ATmega16）
********************************************************************************
* 目前程式意在為程式設計師提供段式液晶編碼指導，以便程式設計師為他們的產品節省時間。
* 因此，對於使用該程式或編碼資訊的個人與團體而造成相關產品的任何直接、間接的
* 損失，本人將不承擔任何方面的責任，亦不道歉。本人亦有且只按個人意願提供有限
* 的技術支援。
*******************************************************************************/

#define __ATMEGA16__  1


#ifndef __LCD_H__
#define __LCD_H__

//######################################################
#define COM_PORT PORTA  // change port name easy for COM driver, tri-state, 0, vdd/2, vdd
#define COM_DDR  DDRA   // change port name easy for COM driver, bi-state,  0 / vdd

#define SEG_PORTC PORTC   //
#define SEG_PORTD PORTD   //
#define SEG_DDRC  DDRC   //
#define SEG_DDRD  DDRD   //
//######################################################



// 設定某個COM IO輸出低電平
#define COM0_LOW()         do{COM_PORT &= ~0x01; COM_DDR |= 0x01;}while(0)
#define COM1_LOW()         do{COM_PORT &= ~0x02; COM_DDR |= 0x02;}while(0)
#define COM2_LOW()         do{COM_PORT &= ~0x04; COM_DDR |= 0x04;}while(0)
#define COM3_LOW()         do{COM_PORT &= ~0x08; COM_DDR |= 0x08;}while(0)

// 設定某個COM IO輸出高電平
#define COM0_HIGH()        do{COM_PORT |= 0x01; COM_DDR |= 0x01;}while(0)
#define COM1_HIGH()        do{COM_PORT |= 0x02; COM_DDR |= 0x02;}while(0)
#define COM2_HIGH()        do{COM_PORT |= 0x04; COM_DDR |= 0x04;}while(0)
#define COM3_HIGH()        do{COM_PORT |= 0x08; COM_DDR |= 0x08;}while(0)

// 設定所有COM IO輸出VDD/2
#define COM_ALL_HALF()     do{COM_PORT &= 0xf0; COM_DDR &= 0xf0;}while(0)

// 設定所有COM/SEG IO輸出低電平
#define COM_SEG_ALL_LOW()  do{COM_PORT &= 0xf0; COM_DDR |= 0x0f; SEG_PORTC &= 0xf0; SEG_PORTD &= 0x00;}while(0)

// 定義SEG埠
#define SEG_LOAD(x)        do{SEG_PORTD = (x); SEG_PORTC |= ((x) >> 8) & 0x0f;}while(0)

// 顯示某個小數點
#define LCD_Show_Dot(x)    frame[0] |= 0x0080 << ((x) << 1)




//typedef unsigned int  u16;
//typedef unsigned char u8;

/*
// 設定某個COM IO輸出低電平
#define COM0_LOW()         do{PORTA &= ~0x01; DDRA |= 0x01;}while(0)
#define COM1_LOW()         do{PORTA &= ~0x02; DDRA |= 0x02;}while(0)
#define COM2_LOW()         do{PORTA &= ~0x04; DDRA |= 0x04;}while(0)
#define COM3_LOW()         do{PORTA &= ~0x08; DDRA |= 0x08;}while(0)
// 設定某個COM IO輸出高電平
#define COM0_HIGH()        do{PORTA |= 0x01; DDRA |= 0x01;}while(0)
#define COM1_HIGH()        do{PORTA |= 0x02; DDRA |= 0x02;}while(0)
#define COM2_HIGH()        do{PORTA |= 0x04; DDRA |= 0x04;}while(0)
#define COM3_HIGH()        do{PORTA |= 0x08; DDRA |= 0x08;}while(0)
// 設定所有COM IO輸出VDD/2
#define COM_ALL_HALF()     do{PORTA &= 0xf0; DDRA &= 0xf0;}while(0)
// 設定所有COM/SEG IO輸出低電平
#define COM_SEG_ALL_LOW()  do{PORTA &= 0xf0; DDRA |= 0x0f; PORTC &= 0xf0; PORTD &= 0x00;}while(0)
// 定義SEG埠
#define SEG_LOAD(x)        do{PORTD = (x); PORTC |= ((x) >> 8) & 0x0f;}while(0)
// 顯示某個小數點
#define LCD_Show_Dot(x)    frame[0] |= 0x0080 << ((x) << 1)
*/



extern uint16_t frame[4];
void LCD_Write_Str(unsigned char* str);

#endif
