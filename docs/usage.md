# Usage Guide: IPTables Firewall

## Overview
This guide provides step-by-step instructions on how to use the IPTables Firewall and its optional features.

---

## Prerequisites
- A Linux system with `iptables` installed.
- Root or sudo access.
- Cloned repository:
  ```bash
  git clone https://github.com/venkatesh-karjala/Ip-tables-firewall.git
  cd IPTablesFirewall
  ```

---

## Configuring the Firewall

### 1. Modify the Configuration File
The firewall uses a configuration file located at `config/firewall.conf`. Open it to modify the settings before running the firewall script:
```bash
nano config/firewall.conf
```
Update the necessary fields, such as allowed ports, default policies, and optional security features.

---

## Running the Firewall

### 1. Apply Firewall Rules Based on Configuration
To apply the firewall rules based on the settings in `firewall.conf`, run:
```bash
sudo ./scripts/firewall.sh
```

### 2. Enabling Optional Features
Optional security features can be enabled in `firewall.conf` or by passing flags when running the script:

- **Rate Limiting** (Prevents brute-force attacks on SSH):
  ```bash
  sudo ./scripts/firewall.sh --enable-rate-limit
  ```
- **Anti-Spoofing** (Blocks spoofed packets):
  ```bash
  sudo ./scripts/firewall.sh --enable-anti-spoofing
  ```
- **Port Blocking** (Blocks specific ports defined in `firewall.conf`):
  ```bash
  sudo ./scripts/firewall.sh --block-ports
  ```
- **Combining Features**
  ```bash
  sudo ./scripts/firewall.sh --enable-rate-limit --enable-anti-spoofing --block-ports
  ```

---

## Checking Firewall Rules
After applying the firewall rules, verify them with:
```bash
sudo iptables -L -v
```

To check saved rules:
```bash
sudo iptables-save
```

---

## Persistence Across Reboots
To ensure rules persist after a system reboot:
```bash
sudo apt install iptables-persistent
sudo netfilter-persistent save
sudo netfilter-persistent reload
```

---

## Reset Firewall Rules
To reset firewall rules and allow all traffic:
```bash
sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
```

---

## Troubleshooting
- **No internet access after enabling firewall?**
  - Ensure outgoing traffic is allowed:
    ```bash
    sudo iptables -P OUTPUT ACCEPT
    ```
- **Changes not persistent after reboot?**
  - Run:
    ```bash
    sudo netfilter-persistent save
    ```
- **Errors when running the script?**
  - Check if the config file is correctly formatted and sourced:
    ```bash
    cat config/firewall.conf
    ```

For more detailed troubleshooting, check the documentation in the `docs/` folder.

---

## Conclusion
This firewall provides a flexible and modular security solution. Use the optional features to enhance security as needed. For further customization, edit the `config/firewall.conf` file or modify scripts inside the `scripts/` directory.
