#!/bin/bash

cat >> ~/.ssh/authorized_keys < local_key

for f in $(ls /etc/netplan); do
	echo "Backing up $f ..."
	sudo mv "$f" "$f.bak"
	sudo cp static_ip.yaml "$f"
done

