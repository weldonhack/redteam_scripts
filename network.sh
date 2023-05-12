#!/bin/bash

# This script will show all hidden networks in the area.

# Get the wireless interface name.
interface=$(iwconfig | awk '/valid interface/ {print $2}')

# Get the list of networks.
networks=$(iwlist $interface scan | grep -Eo "SSID: (.*?)\n")

# Filter out the hidden networks.
hidden_networks=$(echo $networks | sed 's/SSID://g' | grep -v '^$')

# Print the hidden networks.
echo "Hidden networks:"
for network in $hidden_networks; do
  echo "  $network"
done
