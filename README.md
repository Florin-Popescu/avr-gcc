# AVR GCC
GNU Compiler Collection for AVR microcontrollers

## Changes from official repo
- Workaround for symlinks created during build so it works on Windows without need to enable symlinks on each build machine
- Added support for ATmega324PB
- Added support for ATmega4808

## Supporting new stuff
This is a rough guide since it only documents changes already performed. So far new devices are still fairly compatibile with existing ones, but this will most likely not always be the case. It is not intendend to be an extensive porting guide.

### New devices
1. Add the device in ./gcc/config/avr/avr-mcus.def.
	- the ISA part must be set according to choices in ./gcc/config/avr/avr-arch.h.
	- RAM start address and flash size according to datasheet
	- Flash address should usually be 0
	- PM_OFFSET fixed to 0
2. Add the device to the documentation in ./gcc/doc/avr-mmcu.texi in the list for its family.

Forked from release 9.3 sources at [GNU GCC Project](https://gcc.gnu.org/).
