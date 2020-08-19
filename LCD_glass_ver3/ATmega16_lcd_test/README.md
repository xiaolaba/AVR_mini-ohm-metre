### copied source code, 
https://www.amobbs.com/forum.php?mod=viewthread&tid=4560171  


### no test as no device
PORTB as COM driver
PORTD and PORTC as SEG driver

### ATmega16 used, port to AVR-GCC
key points about code & porting, 

incldue those in main.c
```
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdint.h>
#include <avr/interrupt.h>
#include <util/delay.h>
```  

revised  ISR (Interrupt Service Rotuine) entry names  
```  
ISR(TIMER0_COMP_vect, ISR_NAKED)  // avr-gcc  
ISR (TIMER0_OVF_vect, ISR_NAKED)    // avr-gcc  
```  

change port name in lcd.h, easy for other CPU  
```  
#define COM_PORT PORTA  // change port name easy for COM driver, tri-state, 0, vdd/2, vdd  
#define COM_DDR  DDRA   // change port name easy for COM driver, bi-state,  0 / vdd  

#define SEG_PORTC PORTC   //  
#define SEG_PORTD PORTD   //  
#define SEG_DDRC  DDRC   //  
#define SEG_DDRD  DDRD   //  
```

### build_atmega16.bat
compile and build hex
