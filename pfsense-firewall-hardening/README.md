# pfSense Firewall Hardening & Network Segmentation Lab

This repository documents the practical implementation, configuration, and hardening of an enterprise-grade open-source firewall using the **pfSense** platform, aligned with industry best practices for corporate network security[cite: 4, 6].

## 🎯 Project Objectives
* Design and implement robust network segmentation to mitigate lateral movement[cite: 4, 6].
* Configure strict access control policies (Firewall Rules)[cite: 4, 6].
* Deploy traffic inspection and value-added network services (IDS/IPS, Secure DNS)[cite: 4].

## 🗺️ Network Architecture & Segmentation
The infrastructure was divided into three distinct, isolated security zones[cite: 4, 6]:
1. **WAN (Wide Area Network):** The untrusted interface connected to the Internet (simulated/lab environment)[cite: 4].
2. **LAN (Local Area Network):** A restricted internal network dedicated to corporate users and workstations[cite: 4, 6].
3. **DMZ (Demilitarized Zone):** An isolated zone hosting public-facing services (e.g., a Web Server) ensuring that a compromise here does not impact the internal LAN[cite: 4, 6].

## ⚙️ Implemented Configurations

### 1. Firewall Rules
* **Default Deny:** An implicit block policy applied to all traffic that is not explicitly authorized[cite: 4].
* **DMZ Isolation:** Rules tailored to allow WAN traffic only to specific web server ports (e.g., 80/TCP and 443/TCP), while strictly prohibiting any DMZ-initiated connections toward the LAN[cite: 4, 6].
* **Anti-Lockout & Management Hardening:** Restrained WebGUI administrative access exclusively to a dedicated IP/segment within the LAN using a customized management port[cite: 4, 6].

### 2. Core Network Services
* **DNS Resolver (Unbound):** Configured with DNS over TLS (DoT) for enhanced privacy and DNSSEC validation.
* **DHCP Server:** Static mapping pools implemented to ensure predictable IP assignment for streamlined asset auditing.

## 🛡️ System Hardening (pfSense)
* Changed default administrative credentials (`admin` / `pfsense`).
* Disabled plain HTTP web administration, enforcing HTTPS-only connections with modern TLS cipher suites.
* Enabled `Block bogon networks` and `Block private networks` on the WAN interface to mitigate spoofing vectors[cite: 4].

---
*Note: This project was developed strictly for educational purposes and to demonstrate practical network security competencies.*
