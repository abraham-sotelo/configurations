#!/bin/bash

MAIN_SCRIPT_DIR=$(dirname $0)

$MAIN_SCRIPT_DIR/zsh/zsh.sh
$MAIN_SCRIPT_DIR/vscode/vscode.sh

exec zsh
source ~/.zshrc