# Ethical Hacking: Reconnaissance & Web Vulnerability Auditing

This repository documents hands-on offensive security infrastructure mappings, target enumeration workflows, and web application exploitation laboratories executed in fully isolated environments.

---

## 🛠️ 1. Active Reconnaissance & Enumeration Framework

Practical deployment of scanning and mapping engines to blueprint network systems, identify running application daemons, and flag exposed entry points.

### Nmap (Network Mapper)
Used to perform stealthy host discovery and precise service version fingerprinting.
* **Stealth SYN Scan:** `sudo nmap -sS -p- <target_ip>` (Maps all 65,535 TCP ports bypassing standard application layer logs).
* **Service & OS Enumeration:** `nmap -sV -O <target_ip>` (Interrogates banners to determine exact software versions and kernel signatures).
* **Scan Timing Optimization:** Utilizing advanced execution flags like `-T4` to accelerate target polling inside stable lab switching fabrics.

### Nikto (Web Server Scanner)
Deployed for comprehensive CGI and web platform vulnerability multi-testing.
* **Basic Web Assessment:** `nikto -h http://<target_hostname>` (Audits for outdated server software, missing security headers, dangerous HTTP options, and common server misconfigurations like exposed `robots.txt` paths).

### Gobuster (Directory & Subdomain Brute-Forcer)
Utilized for high-velocity resource discovery via dictionary matching against web routing patterns.
* **Directory Enumeration:** `gobuster dir -u http://<target_url> -w wordlist.txt` (Forces lookups to expose hidden internal administrative panels, compressed backups, or isolated API routes).

---

## 💀 2. Web Application Vulnerabilities: SQL Injection (SQLi)

In-depth technical breakdown of structural manipulation vulnerabilities targeting backend Relational Database Management Systems (RDBMS).



### Attack Classifications
* **In-Band SQLi:** Exploiting the same channel for injection and output retrieval.
  * *UNION-based:* Injecting `UNION SELECT` operations (Requires exact structural matching of column counts and compatible structural data types).
  * *Error-based:* Forcing explicit database engine syntax exceptions to read configuration details via returned system error stack verbalizations.
* **Blind (Inferential) SQLi:** Used when application errors are hidden. Data is parsed bit-by-bit by monitoring application behavior.
  * *Boolean-based:* Observing physical page response changes against structured True/False logical queries.
  * *Time-based:* Forcing database sleep functions (e.g., `sleep(15)`) to measure server processing latency shifts.
* **Out-of-Band (OOB) SQLi:** Triggering secondary external network connection lookups (DNS/HTTP requests) to transfer payload results out of the infrastructure.

### Defensive Remediation: Prepared Statements
Securing source layers using data parametrization to isolate processing strings from structural syntax. Example structure (PHP Data Objects/MySQLi):
```php
$stmt = $conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
$stmt->bind_param("ss", $user_input, $password_input);
$stmt->execute();
