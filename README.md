# IPTablesFirewall
A Linux-based IP Tables Firewall script/tool for securing systems and networks.

## Project Overview
This project provides a simple yet effective firewall script using the powerful iptables utility available on Linux systems. The script is designed to:

- Enhance system security by defining robust firewall rules.
- Block unauthorized access while allowing legitimate traffic.
- Protect against common attacks such as SYN floods and port scans.
- Provide logging and monitoring capabilities for network traffic.

# Features
Default Policies: Drop incoming traffic and accept outgoing traffic by default.
Essential Port Allowance: SSH, HTTP/HTTPS, and other required services.
## Advanced Security:
- Anti-spoofing rules.
- Rate limiting.
## Usability:
- Persistent rules across reboots.
- Easy configuration through CLI or a config file.
- Logging for denied packets.

```
#Folder Structure

IPTablesFirewall/
├── README.md         # Project overview
├── LICENSE           # Project license
├── scripts/          # Scripts for configuring the firewall
│   └── firewall.sh   # Main script
├── config/           # Configuration files
│   └── firewall.conf # Example config file
└── docs/             # Documentation
    └── usage.md      # Detailed usage guide
```

# Getting Started
## Prerequisites
- Linux system with iptables installed.
- Root or sudo access.
- Installation

``` bash
# Clone this repository:

git clone https://github.com/yourusername/IPTablesFirewall.git

```
``` bash

# Navigate to the project directory:

cd IPTablesFirewall

```

``` bash
# Run the script:

sudo ./scripts/firewall.sh

``` 
## Contributing
Contributions are welcome! Feel free to submit issues or pull requests to improve this project.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Future Features
Dynamic port management.
Integration with UFW.
Web-based dashboard for managing rules.
