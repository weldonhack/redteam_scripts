#!/bin/bash

# Set the path to the YARA rules file
YARA_RULES_FILE="/path/to/yara/rules.yar"

# Set the path to the mounted flash drive
FLASH_DRIVE_PATH="/media/flash_drive"

# Check if the flash drive is mounted
if [ -d "$FLASH_DRIVE_PATH" ]; then
  echo "Flash drive detected. Scanning for malware..."

  # Run YARA scan on the flash drive
  yara -r "$YARA_RULES_FILE" "$FLASH_DRIVE_PATH"

  # Check the exit code of the YARA command
  if [ $? -eq 0 ]; then
    echo "Scan completed. No malware detected."
  else
    echo "Scan completed. Malware detected!"
  fi
else
  echo "Flash drive not detected."
fi
