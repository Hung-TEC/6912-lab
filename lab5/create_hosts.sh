#!/bin/bash

# Define network namespaces
sudo ip netns add h11
sudo ip netns add h12
sudo ip netns add h21
sudo ip netns add h22
sudo ip netns add h31
sudo ip netns add h32

# link interface to namespace
sudo ip link set v101 netns h11
sudo ip link set v102 netns h12
sudo ip link set v201 netns h21
sudo ip link set v202 netns h22
sudo ip link set v301 netns h31
sudo ip link set v302 netns h32

# Assign IP addresses to interfaces
sudo ip -n  h11 addr add 192.168.11.2/24 dev v101
sudo ip -n  h12 addr add 192.168.12.2/24 dev v102
sudo ip -n  h21 addr add 192.168.21.2/24 dev v201
sudo ip -n  h22 addr add 192.168.22.2/24 dev v202
sudo ip -n  h31 addr add 192.168.31.2/24 dev v301
sudo ip -n  h32 addr add 192.168.32.2/24 dev v302

# Activate interfaces
sudo ip netns exec h11 ip link set v101 up
sudo ip netns exec h12 ip link set v102 up
sudo ip netns exec h21 ip link set v201 up
sudo ip netns exec h22 ip link set v202 up
sudo ip netns exec h31 ip link set v301 up
sudo ip netns exec h32 ip link set v302 up

# Assign deafult gateways
sudo ip netns exec h11 ip route add default via 192.168.11.1
sudo ip netns exec h12 ip route add default via 192.168.12.1
sudo ip netns exec h21 ip route add default via 192.168.21.1
sudo ip netns exec h22 ip route add default via 192.168.22.1
sudo ip netns exec h31 ip route add default via 192.168.31.1
sudo ip netns exec h32 ip route add default via 192.168.32.1

