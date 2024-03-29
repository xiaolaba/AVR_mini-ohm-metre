
@echo off
set path=

del *.elf
del *.hex
del *.lst
del *.o
del *.s

pause

::avr-gcc -mmcu=attiny2313 -Wall -Os -o main.elf main.c -w
::avr-objcopy -j .text -j .data -O ihex main.elf main.hex

::pause
::avrdude -c usbtiny -p t2313 -U flash:w:"main.hex":a



@echo off

set mcu=atmega168p
::set mcu=atmega324p
::set mcu=atmega168p
::set mcu=attiny2313

:::: // no PRR register
:: set mcu=attiny13 

:::: // PRR register, Power Reduction Register
::set mcu=attiny13a   

:::: // Tiny13 default
::set hfuse=0xFF

:::: // internal RC 9.6MHz, CKDIV8, default
::set lfuse=0x6A

:::: // internal RC 9.6MHz, no CKDIV8
::set lfuse=0x7A

:::: // internal RC 4.8MHz
::set lfuse=0x39

:::: // internal RC 128KHz
::set lfuse=0x3B


set main=main
set lcd=lcd
set out=AVR_lcd_%mcu%
set ac=C:\WinAVR-20100110

path %ac%\bin;%ac%\utils\bin;%path%;

:: REF : https://www.nongnu.org/avr-libc/user-manual/using_tools.html
:: ref: https://www.nongnu.org/avr-libc/user-manual/group__demo__project.html

avr-gcc.exe -dumpversion

@echo Compiling c files
pause
avr-gcc -Wall -g -Os -mmcu=%mcu% -c %main%.c
avr-gcc -Wall -g -Os -mmcu=%mcu% -c %lcd%.c


@echo linking
pause
avr-gcc -g -mmcu=%mcu% -o %out%.elf %main%.o %lcd%.o


@echo listing
pause
avr-objdump -h -S %out%.elf > %out%.lst


@echo firmware hex
pause
avr-objcopy -j .text -j .data -O ihex %out%.elf %out%.hex


@echo output asm, not working
pause
avr-gcc.exe -S -fverbose-asm -xc -Os -gdwarf-2 -mmcu=%mcu% -Wall -g0 -S -o %main%.s %main%.c
avr-gcc.exe -S -fverbose-asm -xc -Os -gdwarf-2 -mmcu=%mcu% -Wall -g0 -S -o %lcd%.s %lcd%.c

::avr-gcc.exe -O2 -Wl,-Map, %main%.map -o %main%.out %main%.c -mmcu=%mcu%

cmd /c avr-objdump.exe -h -S %main%.out >%main%.lst
cmd /c avr-objcopy.exe -O ihex %main%.out %main%_WinAVR-20100110.hex
avr-size.exe %main%.out
del %main%.out

::pause
:::: burn hex

::avrdude -c usbtiny -p t13 -U flash:w:"%main%_WinAVR-20100110.hex":a -U lfuse:w:%lfuse%:m  -U hfuse:w:%hfuse%:m

avrdude -c usbtiny -p %mcu% -U flash:w:%out%.hex":a

:::: avrdude terminal only
::avrdude -c usbtiny -p %mcu% -t

pause
:end