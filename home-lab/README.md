# 🛡️ Cybersecurity Home Lab Setup

Welcome to my cybersecurity home lab repository. This project documents the complete installation, configuration, and architecture of my environment used for security research and practical labs.

---

## 🏗️ Phase 1: Installing the Core Attacking Machine (Kali Linux)

This guide documents the step-by-step deployment of Kali Linux as the primary attacking machine inside a virtualized environment.

### 📋 Prerequisites & Requirements
* **Hypervisor:** VirtualBox (or VMware)
* **OS ISO:** Kali Linux Installer Image (64-bit)
* **Allocated Resources:** 2 vCPUs, 4GB RAM, 20GB Dynamic Storage

### 🛠️ Installation Step-by-Step

#### 1. Virtual Machine Creation
* Opened VirtualBox and created a new VM named `Kali-Linux`.
* Selected **Linux** as the Type and **Debian (64-bit)** as the Version.
* Configured the base memory to **4096 MB** and allocated **2 processors**.
* Created a Virtual Hard Disk with **20 GB** of space.

#### 2. Mounting the ISO & Initial Boot
* Went to VM Settings -> Storage -> Controller: IDE.
* Attached the downloaded Kali Linux `.iso` file to the optical drive.
* Started the virtual machine and selected **Graphical Install** from the boot menu.

#### 3. Operating System Configuration
* **Language/Locale:** Selected English (US) / Portuguese.
* **Network:** Set the hostname as `kali` and left the domain name blank.
* **User Accounts:** Created a non-root user account (e.g., `emmanueleg`).
* **Partitioning:** Chosen "Guided - use entire disk" and selected "All files in one partition".
* **Software Selection:** Kept the default desktop environment (XFCE) and the core collection of tools.

#### 4. Post-Installation & Network Check
* Installed the GRUB boot loader to the primary drive (`/dev/sda`).
* Restarted the system, logged in, and verified internet connectivity by running:
  ```bash
  sudo apt update && sudo apt upgrade -y
