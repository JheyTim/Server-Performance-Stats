#!/bin/bash

# server-stats.sh
# This script gathers and displays server performance stats.

# Function to gather CPU usage
cpu_usage() {
  echo "CPU Usage:"
  # Get total CPU usage
  mpstat | awk '/all/ {print 100 - $NF "% used"}'
  echo ""
}

# Function to gather Memory usage
memory_usage() {
  echo "Memory Usage:"
  # Use 'free' command and calculate used and free memory percentages
  free -m | awk 'NR==2{printf "Total: %sMB\nUsed: %sMB\nFree: %sMB\nUsage: %.2f%%\n", $2,$3,$4,$3*100/$2 }'
  echo ""
}

# Function to gather Disk usage
disk_usage() {
  echo "Disk Usage:"
  # Get disk usage information for all mounted file systems
  df -h | awk '$NF=="/"{printf "Total: %s\nUsed: %s\nFree: %s\nUsage: %s\n", $2,$3,$4,$5}'
  echo ""
}

# Function to display Top 5 processes by CPU usage
top_processes_cpu() {
  echo "Top 5 Processes by CPU Usage:"
  # Use ps to list top 5 processes by CPU
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
  echo ""
}

# Function to display Top 5 processes by Memory usage
top_processes_memory() {
  echo "Top 5 Processes by Memory Usage:"
  # Use ps to list top 5 processes by memory
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6
  echo ""
}

# Function to display OS version
os_version() {
  echo "OS Version:"
  # Display the operating system version
  uname -a
  echo ""
}

# Function to display Uptime and Load Average
uptime_load() {
  echo "Uptime and Load Average:"
  # Use uptime to display how long the system has been running and the load average
  uptime
  echo ""
}

# Function to display logged in users
logged_in_users() {
  echo "Logged In Users:"
  # Use who to display currently logged-in users
  who
  echo ""
}

# Function to display failed login attempts (if available)
failed_logins() {
  echo "Failed Login Attempts:"
  # Use lastb to display failed login attempts (needs to be run as root or with sudo)
  if [ -x "$(command -v lastb)" ]; then
    sudo lastb | head -10
  else
    echo "Command 'lastb' not found or not executable."
  fi
  echo ""
}

# Main script execution
echo "Starting server performance stats collection..."
cpu_usage
memory_usage
disk_usage
top_processes_cpu
top_processes_memory
os_version
uptime_load
logged_in_users
failed_logins
echo "Server performance stats collection completed."
