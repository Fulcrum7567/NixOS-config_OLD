#!/bin/bash

# Default values
hostname=""
no_new_config=false
debug=false
path_to_dotfiles="~/.dotfiles"

# Function to display usage
usage() {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo "  --hostname, -n      Specify the hostname"
  echo "  --no-new-config     Disable new config"
  echo "  --debug, -d         Enable debug mode"
  exit 1
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --hostname|-n)
      if [ -n "$2" ]; then
        hostname="$2"
        shift 2
      else
        echo "Error: --hostname or -n requires a name."
        usage
      fi
      ;;
    --no-new-config)
      no_new_config=true
      shift
      ;;
    --debug|-d)
      debug=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
done

# Debugging info if enabled
if [ "$debug" = true ]; then
  echo "Debug mode enabled"
  echo "Hostname: $hostname"
  echo "No new config: $no_new_config"
fi

# Check if HOSTNAME is provided
while [[ -z "$hostname" ]]; do
  read "What is the name of your device? " $hostname
done

# Create new configs
if [ ! $no_new_config ]; then
  sudo rm /etc/nixos/configuration.nix /etc/nixos/hardware-configuration.nix
  sudo nixos-generate-config
  if [ "$debug" = true ]; then
    echo "created new config files"
  fi
fi

if [ -d "$($path_to_dotfiles + "/hosts/" + $hostname)" ]; then
  
fi
