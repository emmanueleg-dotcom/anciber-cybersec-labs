# Automated Nmap Scanner & Bootstrap Reporting

This project showcases an automated Bash scanning script designed to streamline network reconnaissance and vulnerability mapping using Nmap, generating professional, highly visual HTML reports via advanced Bootstrap stylesheets.

## 🚀 Features
* **Automated Scanning:** Executes comprehensive port discovery, service version detection (`-sV`), and Operating System fingerprinting (`-O`).
* **Integrated Vulnerability Analysis:** Leverages the Nmap Scripting Engine (NSE), specifically utilizing the `--script vulners` script to correlate software versions with active CVEs.
* **Professional Reporting:** Automatically parses native Nmap XML output into an aesthetic, responsive HTML dashboard using the `nmap-bootstrap.xsl` stylesheet.

## 📊 Sample Output Structure
The generated report dynamically organizes findings by:
* Active hosts ("Up hosts").
* Open ports color-coded by service state (Open/Filtered).
* Direct web hyperlinks to targeted CVE documentation for identified service versions.

---
*Disclaimer: Utilizing this script against networks without prior explicit written authorization is strictly prohibited and illegal.*
