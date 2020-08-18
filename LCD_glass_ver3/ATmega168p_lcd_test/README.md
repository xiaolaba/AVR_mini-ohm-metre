### port the source code from ATmega16 to ATmega168p

### port to ATmega168p, AVR-GCC
key points about code & porting, 

incldue those in main.c, register named / ISR vector named has changed  
```
#include "port_to_ATmega168p.h" // port to Atmega168p defines    
```  

change port name in lcd.h, M16 has PORTA, M168p has PORTB but no PORTA, change driver COM_PORT to PORTB and DDRB easy for other CPU  
```  
#define COM_PORT PORTB  // change port name easy for COM driver, tri-state, 0, vdd/2, vdd  
#define COM_DDR  DDRB   // change port name easy for COM driver, bi-state,  0 / vdd  

#define SEG_PORTC PORTC   //  
#define SEG_PORTD PORTD   //  
#define SEG_DDRC  DDRC   //  
#define SEG_DDRD  DDRD   //  
```

### build_atmega168p.bat
compile and build hex
