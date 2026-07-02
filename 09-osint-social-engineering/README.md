# OSINT, Darknet & Applied Social Engineering

This module documents practical laboratories, methodologies, and technical workflows for Open Source Intelligence (OSINT) gathering, anonymous Darknet navigation, advanced search operators (Google Dorks), and controlled social engineering simulations.

---

## 🔍 1. OSINT Foundations & Advanced Google Dorking

Information gathering is the critical reconnaissance phase (**T1592** in the MITRE ATT&CK framework) of any security assessment. It is divided into passive reconnaissance (no direct interaction with the target) and active reconnaissance.

### The OSINT Intelligence Cycle

* **Requirements:** Defining target scope, goals, and key performance indicators.
* **Collection:** Acquiring raw data from WHOIS, DNS records, public search engines, social media, and leaked databases.
* **Processing:** Normalizing, deduplicating, and sorting the collected data.
* **Analysis:** Cross-referencing data points (e.g., tying an obscure username to an official corporate email).
* **Dissemination:** Presenting actionable intelligence in a structured threat assessment report.

### Deep Dive: Google Dorking (Google Hacking)

Google Dorking utilizes advanced search engine operators to uncover sensitive data indexations that were never meant to be public.

### Key Search Operators

| Operator | Function | Example |
| :--- | :--- | :--- |
| `site:` | Restricts results to a specific domain or TLD | `site:gov.pt` |
| `filetype:` / `ext:` | Filters results by file extension | `filetype:pdf` |
| `intitle:` | Searches for specific strings inside the page title | `intitle:"index of"` |
| `inurl:` | Searches for specific strings inside the URL structure | `inurl:wp-content` |
| `intext:` | Searches for specific keywords within the page body | `intext:"API_KEY"` |

### Practical Reconnaissance Scenarios

#### 📂 Scenario A: Locating Directory Listings & Unprotected Backups
Administrators sometimes leave directory indexing enabled, exposing system backups or sensitive files.

site:target.com intitle:"index of" "backup" OR "old" OR "dump"
Analysis: If misconfigured, this dork returns a browsable directory tree containing compressed files (.zip, .tar.gz) containing old source code or database structures.

🔑 Scenario B: Hunting for Exposed Logins & Admin Panels
Exposing internal administrative portals directly to the public internet increases the external attack surface.

Plaintext
site:target.com inurl:login OR inurl:admin OR inurl:portal
Analysis: Identifies administrative boundaries. Adding filetype:php or filetype:asp helps narrow down the underlying technology stack.

⚙️ Scenario C: Extracting Configuration Files and Hardcoded Credentials
Locating exposed environment files (.env), XML configurations, or database connection strings.

Plaintext
site:target.com filetype:env OR filetype:xml "DB_PASSWORD"
Analysis: Directly targets developers who accidentally committed configuration profiles to public directories or unprotected staging environments.

🌐 2. Darknet & Tor Traffic Analysis
Investigating overlay networks and performing network forensics to dissect anonymous routing behaviors.

Tor Circuit Architecture
Plaintext
[ Client ] --(Encrypted)--> [ Entry Node ] (Knows Client IP; Doesn't know target)
                                   |
                           (Double Encrypted)
                                   |
                                   v
                            [ Middle Node ] (Relays traffic; Zero visibility)
                                   |
                            (Encrypted Layer Removed)
                                   |
                                   v
[ Target ] <--(Plaintext)---- [ Exit Node ] (Knows Target; Doesn't know Client)
Tor Routing Mechanics
Entry/Guard Node: Receives the packet from the client. It knows your real IP address but cannot read the encrypted payload or determine the final destination.

Middle Node: Acts as a buffer. It only knows which node sent the packet and which node receives it next, preventing the Entry and Exit nodes from colluding.

Exit Node: Strips the final layer of encryption and forwards the raw traffic to the destination host. It knows the final destination but is completely blind to the original client IP.

Lab Analysis: Tor Traffic vs. Standard TLS Traffic (Wireshark)
When capturing local network adapter interfaces with Wireshark during active Tor usage, the following network characteristics were observed:

Host Obfuscation: Standard HTTP/S connections reveal domain resolutions via DNS and Server Name Indication (SNI) handshakes. Tor traffic completely obscures this; the local packet trace shows direct TCP exchanges only with the IP addresses of known Tor Directory Authorities or Guard Relays.

Encrypted Payload: The entire communication payload is encapsulated inside standard TLS sessions (typically using non-standard port pairings like 9001 or 9050 unless running over bridges like obfs4).

Wireshark Analysis Filter
To isolate potential Tor handshakes and active relay connections on the network segment, the following display filter was constructed:

Snippet de código
tcp.port == 9001 || tcp.port == 9050 || (tcp.flags.syn == 1 and tcp.flags.ack == 0 and tcp.port == 443)
🧠 3. Human Element & Social Engineering Frameworks
Social engineering targets the weakest link in any corporate security chain: human psychology.

Core Psychological Triggers
Authority: Standardizing communications to mimic C-level executives, IT directors, or regulatory legal bodies to bypass standard verification procedures.

Urgency & Scarcity: Instilling artificial time constraints (e.g., "Your active directory access will expire in 15 minutes") to force rapid decision-making under stress.

Social Proof (Consensus): Convincing the target that their peers or team members have already completed the request (e.g., "John from Accounting already migrated his keys").

Reciprocity: Offering a small favor or assistance to make the victim feel obligated to return the favor by disclosing system details.

🎣 4. Phishing Simulation: Social-Engineer Toolkit (SET)
The Social-Engineer Toolkit (SET) is an open-source framework designed to execute automated, highly targeted social engineering attacks to assess organization-wide security awareness.

Step-by-Step Attack Walkthrough: Credential Harvester & Site Cloner
The objective of this simulation is to clone a corporate login page, host it on an attacker-controlled platform, and intercept submitted credentials.

Step 1: Initialize the Framework
Launch the tool inside Kali Linux under administrative privileges to allow network socket binding on restricted ports (such as port 80):

Bash
sudo setoolkit
Step 2: Navigate the Attack Menu
Follow the interactive prompt selection to configure the phishing delivery payload:

Select option 1) Social-Engineering Attacks from the main menu.

Select option 2) Website Attack Vectors to target web browser sessions.

Select option 3) Credential Harvester Attack Method to instruct SET to actively parse and log incoming HTTP POST forms.

Select option 2) Site Cloner to automatically mirror a target website's front-end code.

Step 3: Configure Network Listeners
SET prompts for the return IP address:

Plaintext
set:webattack> IP address for the POST back in Harvester/Tabnabbing: [192.168.1.105]
Attacker IP Configuration: Input your local network interface IP (or external WAN IP if executing a WAN-scoped test). This is where the cloned website's login form will send (POST) data.

Step 4: Clone the Target Web Interface
SET prompts for the URL to clone:

Plaintext
set:webattack> Enter the url to clone: [https://portal.spartabank.local/login](https://portal.spartabank.local/login)
Cloning Process: SET runs an automated scraping utility behind the scenes. It downloads the target's raw HTML, CSS structures, and script assets, modifying the <form action="..."> attributes to point directly back to the attacker's IP address on port 80.

Step 5: Credential Interception & Analysis
Once the server initializes, the attacker sends the target link to the victim (usually masked using a typosquatted domain or an active ARP/DNS spoofing vector). When the victim accesses the cloned page and submits their credentials, the console logs the transaction:

YAML
[file:harvester] WE GOT A HIT! Printing credentials gathered...

PARAM: username=j.silva@spartabank.local
PARAM: password=Winter2026!MyPassword123
Redirection Flow: Immediately after capturing the POST data, SET seamlessly redirects the victim back to the legitimate portal URL. To the victim, it appears as if they made a minor typing error or their session timed out, preventing immediate suspicion.

🛡️ Defenses and Mitigations
Multi-Factor Authentication (MFA): Enforcing FIDO2/WebAuthn hardware keys. Traditional SMS or OTP push notifications are still vulnerable to real-time reverse-proxy phishing tools (like Evilginx2), but hardware security keys completely defeat credential harvesters because the domain binding is checked directly by the web browser.

Email Gateway Protections: Implementing SPF, DKIM, and DMARC records to prevent attackers from spoofing legitimate corporate domains in email headers.

URL Sandboxing: Deploying endpoint detection agents that analyze and block newly registered domains or domains with poor reputation scores.

Aviso: All tasks and simulated exercises were executed strictly within a localized sandbox environment for academic exploration, in compliance with the Portuguese Cybercrime Law framework (Lei n.º 109/2009).
