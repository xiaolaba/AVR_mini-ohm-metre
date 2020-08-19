
// original copy : https://www.amobbs.com/forum.php?mod=viewthread&tid=4560171
// M48 version
/*
 * original file saved as GBK, converts to UTF8 CHT
 * tools: https://github.com/flier268/ConvertZZ
 * xiaolaba, 2020-AUG-18
 * 
 * port to avr-gcc, u8 -> uint8_t, u16 -> uint16_t
 * port to ATmega168p
 * include this header file to main.c, lcd.h, lcd.c
 * 
 */


#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdint.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>


// lcd com-segment driver, port named and used in main.c, lcd.h
#define COM_DRIVER_PORT PORTC
#define COM_DRIVER_DDR  DDRC
#define SEG_DRIVER_PORT1 PORTD
#define SEG_DRIVER_DDR1  DDRD
#define SEG_DRIVER_PORT2 PORTB
#define SEG_DRIVER_DDR2  DDR2



/*
// register names
//      M16     M168p
#define TIMSK   TIMSK0
#define TIFR    TIFR0
#define TCCR0   TCCR0A
#define OCR0    OCR0A

// vector names
//      M16                 M168p
#define TIMER0_COMP_vect    TIMER0_COMPB_vect
*/