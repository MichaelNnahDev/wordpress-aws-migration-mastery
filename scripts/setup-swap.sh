#!/bin/bash

# =================================================================
# AWS EC2 1GB Swap File Setup Script
# Author: Michael Nnah
# Description: Allocates 1GB of disk space as "Emergency RAM" 
#              to prevent MySQL/OOM crashes on small instances.
# =================================================================

echo "🚀 Starting Swap File Allocation (1GB)..."

# 1. Create the swap file
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024

# 2. Secure permissions
sudo chmod 600 /swapfile

# 3. Setup swap area
sudo mkswap /swapfile

# 4. Enable swap
sudo swapon /swapfile

# 5. Make permanent across reboots
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "✅ Swap enabled successfully!"
free -h
