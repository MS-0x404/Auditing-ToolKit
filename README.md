# 🔍 Audit System Toolkit — PowerShell & Bash

A lightweight, cross-platform toolkit to monitor critical system events on both Windows and Linux environments.

🛡️ Built from scratch, written manually — designed for sysadmins, pentesters, and students who want to truly understand system logging **without relying on external tools**.

---

## 📂 Contents

### `auditing.ps1`
- Windows tool using PowerShell
- CLI interface
- Based on `Get-WinEvent`
- Supports Event ID search and optional filters (e.g. user, handle, object)
- Outputs to `C:\log_audit.txt`

### `auditing.sh`
- Linux script for manual auditing
- Checks root activity, logins, cron, sudo logs, and more
- Outputs to `/root/audit_log.log`

---

## 🚀 Features

- ✅ Security event monitoring on Windows (Logon, Account Locked, etc.)
- ✅ Optional user/object filter
- ✅ Clean persistent logging
- ✅ Readable, modifiable Linux script
- ✅ No external dependencies

---

## 🧠 Ideal For

- Junior sysadmins who want hands-on practice
- Red teamers or pentesters needing low-level visibility
- Students who want to understand system logs

---

## 🖥️ Requirements

### Windows
- PowerShell 5+
- Admin privileges to read Security logs

### Linux
- Bash
- Root privileges to access system logs

---

## 📦 Installation

### Windows
```bash
git clone https://github.com/matteosalis04/Auditing-ToolKit.git
cd Auditing-ToolKit/Windows
powershell -ExecutionPolicy Bypass -File auditing.ps1
```

### Linux
```bash
git clone https://github.com/matteosalis04/Auditing-ToolKit.git
cd Auditing-ToolKit/Linux
sudo bash auditing.sh
```

---

## 👤 Author

Made by **[@MS-0x404](https://github.com/MS-0x404)**  

---

## 📜 License

MIT — do what you want, just give credit.
