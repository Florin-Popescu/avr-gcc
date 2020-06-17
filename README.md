# AVR GCC
GNU Compiler Collection for AVR microcontrollers

## Changes from official repo
- Added support for ATmega324PB
- Added support for ATmega4808

## Supporting new stuff
This is a rough guide since it only documents changes already performed. So far new devices are still fairly compatibile with existing ones, but this will most likely not always be the case. It is not intendend to be an extensive porting guide.

### New devices
If the device family is not currently supported:
1. Add the family in ./gcc/config/avr/avr-mcus.def, taking hints fom the device you want to add as well as others in its family.
2. Add the family to enums in ./gcc/config/avr/avr-arch.h and ./gcc/config/avr/avr-devices.c
3. Add the family description in ./gcc/config/avr/avr-devices.c, filling the available instructions and other details.
4. Add the family in ./gcc/config/avr/t-multilib
5. Add the family to the documentation in ./gcc/doc/invoke.texi
6. Regardless if the family is known or not, add the device in ./gcc/config/avr/avr-mcus.def.
	- the ISA part must be set according to choices in ./gcc/config/avr/avr-arch.h.
	- RAM start address and flash size according to datasheet
	- Flash address should usually be 0
	- PM_OFFSET fixed to 0
7. Add the device to the documentation in ./gcc/doc/avr-mmcu.texi in the list for its family.

Forked from release 9.3 sources at [GNU GCC Project](https://gcc.gnu.org/).
