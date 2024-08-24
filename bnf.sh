#!/bin/bash

# Define variables
SERIAL_PORT="/dev/ttyS3" # COM3 in WSL/Git Bash
FIRMWARE_FILE="C:\VS Code\(Ender-Cloud)\.pio\build\BTT_SKR_PRO\firmware.bin" # Path to the Marlin firmware .bin file
DFU_UTIL="C:\DFU-Util\win64\dfu-util.exe" # Path to the dfu-util tool

# Check if firmware file exists
if [[ ! -f "$FIRMWARE_FILE" ]]; then
  echo "Error: Firmware file not found!"
  exit 1
fi

# Flash the firmware using dfu-util
echo "Starting firmware flashing process to SKR Pro 1.2..."
"$DFU_UTIL" -a 0 -s 0x08000000 -D "$FIRMWARE_FILE"

# Check if flashing was successful
if [[ $? -eq 0 ]]; then
  echo "Firmware flashing completed successfully!"
else
  echo "Error: Firmware flashing failed!"
  exit 1
fi

echo "Process complete!"