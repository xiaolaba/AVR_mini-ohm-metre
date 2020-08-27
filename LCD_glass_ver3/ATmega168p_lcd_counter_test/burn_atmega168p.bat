@echo off
set path=


set mcu=atmega168p

set main=main
set lcd=lcd
set out=AVR_lcd_%mcu%
set ac=C:\WinAVR-20100110

path %ac%\bin;%ac%\utils\bin;%path%;

avrdude -c usbtiny -p %mcu% -U flash:w:%out%.hex":a
pause
:end