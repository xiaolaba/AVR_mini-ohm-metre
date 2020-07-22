@echo off

set mcu=ATMEGA328P  

set hfuse=0xda
set lfuse=0xff

set main=328p_millihom_57600_16MHZ_backup_flash_trimmed.hex
set ac=C:\WinAVR-20100110

path %ac%\bin;%ac%\utils\bin;%path%;

@echo on

avrdude -c usbtiny -p %mcu% -U flash:w:"%main%":a -U lfuse:w:%lfuse%:m  -U hfuse:w:%hfuse%:m

pause