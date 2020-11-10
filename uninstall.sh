#!/bin/bash

function filelen {
	wc -l $1 | awk '{print $1}'
}

function uninstall {
	l=$(expr `filelen "$1"` - `filelen "$2"`)
	if [ "$l" -eq "0" ]; then
		rm $1
	else
		sed -n "1,${l}p" $1 > /tmp/uninstbase.tmp
		mv /tmp/uninstbase.tmp $1
	fi
}

uninstall "$HOME/.bashrc" "bashrc"
uninstall "$HOME/.ssh/config" "ssh.config"

