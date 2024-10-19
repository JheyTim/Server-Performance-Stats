# Server Performance Stats

## Overview
`server-stats.sh` is a Bash script that collects and displays basic server performance statistics. The script is designed to be run on any Linux server, providing quick insights into the server's CPU, memory, disk usage, and top processes. Additional optional statistics such as OS version, uptime, load average, logged-in users, and failed login attempts are also displayed.

This project idea was inspired by the **Server Performance Stats** project from [roadmap.sh](https://roadmap.sh/projects/server-stats).

## Features
The script provides the following statistics:
- **CPU Usage**: Displays total CPU usage.
- **Memory Usage**: Shows total, used, free memory, and usage percentage.
- **Disk Usage**: Displays total, used, free disk space, and usage percentage for the root filesystem.
- **Top 5 Processes by CPU**: Lists the top 5 processes by CPU consumption.
- **Top 5 Processes by Memory**: Lists the top 5 processes by memory consumption.
- **OS Version** (Optional): Displays the operating system version.
- **Uptime and Load Average** (Optional): Displays how long the server has been running and the load average over the last 1, 5, and 15 minutes.
- **Logged-In Users** (Optional): Shows currently logged-in users.
- **Failed Login Attempts** (Optional): Displays the last failed login attempts.

## Requirements
- Any Linux-based system with Bash and the following commands available:
  - `mpstat` (for CPU stats)
  - `free` (for memory stats)
  - `df` (for disk usage)
  - `ps` (for process listing)
  - `uname` (for OS version)
  - `uptime` (for load average and uptime)
  - `who` (for logged-in users)
  - `lastb` (optional, for failed login attempts, may require `sudo`)

## Usage
1. Clone or download the script `server-stats.sh` to your Linux server.
2. Make the script executable:
    ```bash
    chmod +x server-stats.sh
    ```
3. Run the script:
    ```bash
    ./server-stats.sh
    ```

## Optional Features
The script has some optional features like failed login attempts which may require sudo to run. To run with elevated privileges:
```bash
sudo ./server-stats.sh
```

## License
This project is licensed under the [MIT License](LICENSE).