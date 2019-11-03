# myarduino

This is an experiment on how to fiddle with the Arduino Uno with Haskell using Stack.

# Installation

## Install AVR-GCC toolchain
  
Full doc is at http://maxembedded.com/2015/06/setting-up-avr-gcc-toolchain-on-linux-and-mac-os-x/
Basically it's:

    brew tap osx-cross/avr
    brew install avr-libc
    brew install avrdude

## Install Arduino-Makefile

The full doc is at https://github.com/sudar/Arduino-Makefile, this is what I did:

    brew tap sudar/arduino-mk
    brew install arduino-mk
    pip install pyserial

I chose to git-clone the project:

    git clone https://github.com/sudar/Arduino-Makefile.git /path/to/Arduino-Makefile

and then I set these in my `~/.bash_profile`:

    export ARDUINO_MAKEFILE_PATH=/path/to/Arduino-Makefile/Arduino.mk
    export ARDUINO_DIR=/Applications/Arduino.app/Contents/Java
    export ARDMK_DIR=/path/to/Arduino-Makefile
    export AVR_TOOLS_DIR=/usr/local

## Installing frp-arduino

I'm basically git-cloning frp-arduino inside this project, because adding it as a dependency didn't work (see <https://github.com/frp-arduino/frp-arduino/issues/55>):

		git clone https://github.com/frp-arduino/frp-arduino.git /path/to/frp-arduino
		cp -r /path/to/frp-arduino .

I also replace the `make` script that frp-arduino provided, with one that supports Stack and being called from a folder which isn't the same as the script:

		cp make-frp-arduino frp-arduino/make

If you connect your Arduino via USB, you should now be able to follow the Blink example:

		frp-arduino/make frp-arduino/examples/Blink upload

If your Arduino is now blinking, you're all set.
