#!/bin/sh


SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

home-manager switch --flake $SCRIPT_DIR/../../.#user
