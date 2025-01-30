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

# Folder Structure
```

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
We need the following Prerequisites in order for you setup the fire wall on your system and successfully run them.

## Prerequisites
- Linux system with iptables installed.
- Root or sudo access.
- Installation

``` bash
Clone this repository:

git clone https://github.com/venkatesh-karjala/Ip-tables-firewall.git

```
``` bash

Navigate to the project directory:

cd Ip-tables-firewall

```

``` bash
Run the script:

sudo ./scripts/firewall.sh

``` 
## Contributing
Contributions are welcome! Feel free to submit issues or pull requests to improve this project.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

# Optional Features for IPTables Firewall

This document describes the optional features available in the IPTables Firewall project. Users can enable these features based on their specific security needs.

## 1. Rate Limiting

### Description
Limits the number of SSH connection attempts to prevent brute-force attacks.

### Script
`scripts/rate_limiting.sh`

### How to Enable
Run the following command:
```bash
sudo ./firewall.sh --enable-rate-limit
```

## 2. Anti-Spoofing

### Description
Blocks spoofed packets from invalid source addresses to enhance network security.

### Script
`scripts/anti_spoofing.sh`

### How to Enable
Run the following command:
```bash
sudo ./firewall.sh --enable-anti-spoofing
```

## 3. Port Blocking

### Description
Blocks specific ports from being accessed. Customize the blocked ports in the script as needed.

### Script
`scripts/block_ports.sh`

### How to Enable
Run the following command:
```bash
sudo ./firewall.sh --block-ports
```

## Customization
Each feature is implemented in a separate script to allow easy customization. Modify the scripts inside the `scripts/` directory to adjust rules based on your security needs.

## Notes
- These optional features **do not run by default**. You must explicitly enable them using the provided flags.
- Ensure the scripts are executable:
  ```bash
  chmod +x scripts/*.sh
  ```
- Always test new firewall rules before deploying them in a production environment.

---

## Future Features
- Dynamic port management.
- Integration with UFW.
- Web-based dashboard for managing rules.
