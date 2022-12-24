#!/bin/bash

ip_address=$1
pcap_dir=$(pwd)

echo "Searching for: "$1


for file in "$pcap_dir"/*; do
  echo "Processing file: $(basename "$file")"
  tshark -r "$file" -Y "ip.src == $ip_address or ip.dst == $ip_address" -T fields -e ip.src -e ip.dst -e ip.proto
done

