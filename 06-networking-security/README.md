# Networking Architecture & Cyber Defense Fundamentals

This module documents the core networking protocols, architectural models, and diagnostic baselines analyzed during hands-on cybersecurity training. Understanding these fundamentals is critical for traffic analysis, firewall routing, and Blue Team incident response.

---

## 🌐 1. Network Models & Layer Mapping
Understanding data encapsulation and how protocols map across the OSI and TCP/IP models.

* **Layer 4 (Transport):** Segment encapsulation using either connection-oriented protocols (TCP) or connectionless streams (UDP).
* **Layer 3 (Network):** Packet routing, logical addressing, and gateway mechanics via IP.
* **Layer 2 (Data Link):** Frame forwarding within local networks using physical hardware addresses (MAC).



### TCP vs UDP Performance & Security Baselines
* **TCP (Transmission Control Protocol):** Connection-oriented. Utilizes the **3-Way Handshake** (SYN, SYN-ACK, ACK) to guarantee reliable delivery, error checking, and packet sequencing. Critical for protocols requiring absolute data integrity (HTTP, SSH, SFTP).
* **UDP (User Datagram Protocol):** Connectionless. Prioritizes speed and low overhead over reliability, making it ideal for real-time traffic (DNS, DHCP, VoIP, Streaming) where dropped packets are acceptable.

---

## 🛠️ 2. Infrastructure Protocols & Core Services

### DNS (Domain Name System)
* **Function:** Translates human-readable domain names (e.g., `target.com`) into machine-routable IP addresses.
* **Security Implications:** Highly targeted for amplification DDoS attacks, DNS Spoofing/Poisoning, and command-and-control (C2) data exfiltration channels.

### DHCP (Dynamic Host Configuration Protocol)
* **Function:** Automatically assigns IP addresses, subnet masks, default gateways, and DNS servers to host devices dynamically.
* **Network Operations:** Operates on lease times. Security threats include DHCP Starvation attacks and Rogue DHCP servers performing Man-in-the-Middle (MitM) interceptions.

### HTTP Status Codes & Web Diagnostics
Crucial for web application auditing, log parsing, and identifying anomalies:
* **200 OK:** Request succeeded.
* **301/302 Redirection:** Resource moved permanently or temporarily.
* **400 Bad Request / 401 Unauthorized / 403 Forbidden:** Client-side errors often monitored during brute-force or credential stuffing detection.
* **404 Not Found:** Resource missing (frequent mapping indicator during directory busting scans).
* **500 Internal Server Error / 502 Bad Gateway:** Server-side failures often indicating successful application layer exploitation or resource exhaustion.

---

## 🔒 3. Transport Layer Security & Cryptography (TLS Basics)
* **TLS (Transport Layer Security):** Cryptographic protocol designed to provide end-to-end communication security over networks. It encrypts application layer protocols (turning HTTP into HTTPS).
* **Core Objectives:**
  * **Encryption:** Hiding data from unauthorized third parties (Confidentiality).
  * **Authentication:** Verifying the identity of the communicating parties via Certificates.
  * **Integrity:** Ensuring data is not altered during transit via MAC (Message Authentication Code).

---

## 🔌 4. Hardware Evolution: Hubs vs. Switches

| Metric | Hub | Network Switch |
| :--- | :--- | :--- |
| **OSI Layer** | Layer 1 (Physical) | Layer 2 (Data Link) |
| **Intelligence** | Dumb (Broadcasts all traffic to all ports) | Intelligent (Learns MAC addresses and maps ports) |
| **Collision Domains** | Single shared domain (High collision risk) | Per-port domain (Micro-segmentation, zero collisions) |
| **Security Risk** | Critical (Any connected device can sniff all traffic) | Secured (Traffic is isolated to the destination port) |

---

## 🏷️ 5. IPv4 Addressing & Network Segmentation
Baselines for architectural routing and subnetting rules based on Class structures:

* **Class A:** `1.0.0.0` to `126.255.255.255` (Default Mask: `/8` or `255.0.0.0`) - Used for massive enterprise infrastructures.
* **Class B:** `128.0.0.0` to `191.255.255.255` (Default Mask: `/16` or `255.255.0.0`) - Medium to large networks.
* **Class C:** `192.0.0.0` to `223.255.255.255` (Default Mask: `/24` or `255.255.255.0`) - Standard small-to-medium business networks.
* **Loopback Address:** `127.0.0.1` - Reserved for local host testing and internal routing verification.

---

## ⌨️ 6. Hands-on Network Diagnostics (Cheatsheet)
Essential CLI commands utilized during laboratory tasks to audit, troubleshoot, and map network configurations.

### Linux / macOS Utilities
* `ip a` or `ifconfig`: Displays active network interfaces, MAC addresses, and assigned IPv4/IPv6 addresses.
* `ping <ip/domain>`: Tests layer 3 connectivity and latency using ICMP Echo Requests.
* `nslookup <domain>` or `dig <domain>`: Queries DNS servers to resolve domains and audit DNS records (A, MX, TXT).
* `netstat -tunlp` or `ss -tunlp`: Lists all active network connections and listening ports, identifying potential unauthorized services.
* `traceroute <ip>`: Maps the exact path/routers a packet traverses to reach its destination.

### Windows Equivalents
* `ipconfig /all`: Detailed network adapter configuration summary.
* `nslookup <domain>`: Standard DNS diagnostic tool.
* `netstat -ano`: Displays all active TCP/UDP connections and their associated Process IDs (PID).

---
*All theoretical definitions and diagnostic metrics mapped directly from ANCiber laboratory topologies.*
