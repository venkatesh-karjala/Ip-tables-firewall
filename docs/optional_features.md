# Optional Features for IPTables Firewall

This document describes the optional features available in the IPTables Firewall project. Users can enable these features based on their specific security needs.

## 1. Rate Limiting

### Description
Limits the number of SSH connection attempts to prevent brute-force attacks.

### Configuration
- Enable this feature by setting `ENABLE_RATE_LIMITING=true` in `config/firewall.conf`.
- Alternatively, run the script with the flag:
  ```bash
  sudo ./scripts/firewall.sh --enable-rate-limit
  ```

### Script
`scripts/rate_limiting.sh`

---

## 2. Anti-Spoofing

### Description
Blocks spoofed packets from invalid source addresses to enhance network security.

### Configuration
- Enable this feature by setting `ENABLE_ANTI_SPOOFING=true` in `config/firewall.conf`.
- Alternatively, run the script with the flag:
  ```bash
  sudo ./scripts/firewall.sh --enable-anti-spoofing
  ```

### Script
`scripts/anti_spoofing.sh`

---

## 3. Port Blocking

### Description
Blocks specific ports from being accessed. Customize the blocked ports in `config/firewall.conf`.

### Configuration
- Enable this feature by setting `ENABLE_PORT_BLOCKING=true` in `config/firewall.conf`.
- Customize blocked ports in the `BLOCKED_PORTS` array in `config/firewall.conf`.
- Alternatively, run the script with the flag:
  ```bash
  sudo ./scripts/firewall.sh --block-ports
  ```

### Script
`scripts/block_ports.sh`

---

## Customization
Each feature is implemented in a separate script to allow easy customization. Modify the scripts inside the `scripts/` directory to adjust rules based on your security needs.

## Notes
- These optional features **do not run by default**. You must explicitly enable them using the `firewall.conf` file or the provided flags.
- Ensure the scripts are executable:
  ```bash
  chmod +x scripts/*.sh
  ```
- Always test new firewall rules before deploying them in a production environment.

---# Optional Features for IPTables Firewall

This document describes the optional features available in the IPTables Firewall project. Users can enable these features based on their specific security needs.

## 1. Rate Limiting

### Description
Limits the number of SSH connection attempts to prevent brute-force attacks.

### Configuration
- Enable this feature by setting `ENABLE_RATE_LIMITING=true` in `config/firewall.conf`.
- Alternatively, run the script with the flag:
  ```bash
  sudo ./scripts/firewall.sh --enable-rate-limit
  ```

### Script
`scripts/rate_limiting.sh`

---

## 2. Anti-Spoofing

### Description
Blocks spoofed packets from invalid source addresses to enhance network security.

### Configuration
- Enable this feature by setting `ENABLE_ANTI_SPOOFING=true` in `config/firewall.conf`.
- Alternatively, run the script with the flag:
  ```bash
  sudo ./scripts/firewall.sh --enable-anti-spoofing
  ```

### Script
`scripts/anti_spoofing.sh`

---

## 3. Port Blocking

### Description
Blocks specific ports from being accessed. Customize the blocked ports in `config/firewall.conf`.

### Configuration
- Enable this feature by setting `ENABLE_PORT_BLOCKING=true` in `config/firewall.conf`.
- Customize blocked ports in the `BLOCKED_PORTS` array in `config/firewall.conf`.
- Alternatively, run the script with the flag:
  ```bash
  sudo ./scripts/firewall.sh --block-ports
  ```

### Script
`scripts/block_portssh`

---

## Customization
Each feature is implemented in a separate script to allow easy customization. Modify the scripts inside the `scripts/` directory to adjust rules based on your security needs.

## Notes
- These optional features **do not run by default**. You must explicitly enable them using the `firewall.conf` file or the provided flags.
- Ensure the scripts are executable:
  ```bash
  chmod +x scripts/*.sh
  ```
- Always test new firewall rules before deploying them in a production environment.

---