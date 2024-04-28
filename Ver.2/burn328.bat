@echo off

::set mcu=ATMEGA8
::set mcu=ATMEGA168P  
set mcu=ATMEGA328P

::mega328 16MHz Xtal. i.e. arduino nano/uno
set lfuse=0xff
set hfuse=0xda
set efuse=0x05

:::: commercial delay 1 sec
::set main=miniOhm_metre_largefont_ver2_001_m328_boot.hex
::set main=miniOhm_metre_largefont_ver2_001_m328.hex

:::: demo, update interval 51 sec
::set main=miniOhm_metre_largefont_ver2_051_m328_boot.hex
::set main=miniOhm_metre_largefont_ver2_051_m328.hex

:::: experiental update, interval 3 sec
set main=miniOhm_metre_largefont_ver2_003sec_m328_115200_16MHz.hex


set ac=C:\WinAVR-20100110

path %ac%\bin;%ac%\utils\bin;%path%;

@echo on

avrdude -c usbtiny -p %mcu% -U flash:w:"%main%":a -U lfuse:w:%lfuse%:m  -U hfuse:w:%hfuse%:m

pause