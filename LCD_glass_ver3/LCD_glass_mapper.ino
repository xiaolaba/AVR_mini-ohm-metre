
// LCD glass mapping tools
// Two I/O lines toggled on and off, 
// to provide AC single to drive segment-com of a LCD glass
// xiaolaba, 2020-AUG-16

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define port_init   0B10101010
#define output_mode 0xff

int main(void)
{

  /* setup */
  DDRB = output_mode;
  DDRC = output_mode;
  DDRD = output_mode;

  PORTC = port_init;
  PORTB = port_init;
  PORTD = port_init;
  
  /* loop */
  while (1) {
    PINB = 0xff;  // toggle portB all pins
    PINC = 0xFF;  // toggle PORTC all pins
    PIND = 0xFF;  // toggle PORTD all pins    
    _delay_ms(100);
  }
}
