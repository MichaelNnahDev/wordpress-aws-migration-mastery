# 🚀 WordPress Migration: Hostinger Shared to AWS EC2 (Ubuntu 22.04)

This repository contains the definitive, CLI-only workflow for migrating a production WordPress site from a shared environment (Hostinger) to a self-managed AWS EC2 instance. This setup is optimized for performance, security, and SEO.

## 🛠 Tech Stack
- **Source:** Hostinger Shared Hosting (SSH Enabled)
- **Destination:** AWS EC2 (t2.micro)
- **Web Server:** Apache2 (Optimized Virtual Hosts)
- **Database:** MySQL 8.0
- **SSL:** Let's Encrypt (Certbot)
- **Automation:** Custom Shell Scripts for Permissions

---

## 🏗 Migration Workflow
1. **Data Extraction:** SSH into Hostinger, compress files via `tar`, and export DB via `mysqldump`.
2. **Server Prep:** Provisioning AWS EC2, installing LAMP stack, and configuring Swap Memory for stability.
3. **Deployment:** Direct server-to-server transfer via `SCP`, database import, and `wp-config.php` synchronization.
4. **Optimization:** Updating PHP memory limits and enabling Apache `mod_rewrite`.
5. **Security:** Configuring 301 redirects (WWW to Non-WWW) and installing Let's Encrypt SSL.
6. **Final Polish:** Using WP-CLI for global search-and-replace to ensure 100% HTTPS compatibility.

---

## 📂 Repository Contents & Automation
- `/configs/`: Production-ready Apache Virtual Host configuration files with custom error logging.
- `/scripts/`: 
  - `fix-permissions.sh`: Instantly resets `www-data` ownership and sets 755/644 permissions.
  - `setup-swap.sh`: Allocates 1GB of disk space as "Emergency RAM" to prevent MySQL crashes.
  - `install-wp-cli.sh`: Automates the installation of WordPress CLI for safe database migrations.

---

## ⚡Quick Start: Automation Scripts
To harden your server and automate the migration tasks, run these commands from your EC2 terminal:

### 1. Server Optimization (Stability)
Prevent Out-of-Memory (OOM) errors on small instances by adding a 1GB swap file:
```
chmod +x scripts/setup-swap.sh
sudo ./scripts/setup-swap.sh
```
### 2. Database Migration with WP-CLI
Install the gold-standard tool for search-and-replace (handles serialized data):
```
chmod +x scripts/install-wp-cli.sh
./scripts/install-wp-cli.sh
```
### 3. Permission Standards
Ensure your web server has the correct permissions to write files and perform updates:
```
chmod +x scripts/fix-permissions.sh
sudo ./scripts/fix-permissions.sh
```
### 4. SSL & Auto-Renewal (Certbot)
Secure your site with Let's Encrypt. Replace `michaelnnah.com` with your actual domain. Ensure your DNS A-Records are pointing to this EC2 IP first:

**Installation & Activation:**
```
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache -d michaelnnah.com -d [www.michaelnnah.com](https://www.michaelnnah.com)
```
**Perform a dry-run to test renewal logic**
```
sudo certbot renew --dry-run
```
---

## 💼 Hire Me for Your Migration
**Are you looking to move your business to the Cloud?**

I specialize in migrating high-traffic WordPress and WooCommerce websites from shared hosting (Hostinger, Bluehost, Namecheap) to high-performance **AWS Infrastructure**.

### Why Work With Me?
- **Zero Downtime:** I use a "staging-to-live" workflow to ensure your site stays online for customers during the entire move.
- **Speed Optimization:** AWS EC2 instances provide significantly faster TTFB (Time to First Byte) than shared hosting.
- **Security First:** I implement server-level firewalls, SSL encryption, and secure file permissions.
- **Cloud Expert:** Specializing in EC2, S3 backups, and CloudFront CDN integration.

**Let's talk about your project:**
- **Website:** [michaelnnah.com](https://michaelnnah.com)
- **Email:** <contact@michaelnnah.com>

---

## 📝 Key Lessons Captured
- **Redirection Loops:** Avoided by aligning WordPress Home/Site URL prior to the final DNS switch.
- **Swap Memory:** Implemented to prevent MySQL crashes on entry-level EC2 instances during heavy database tasks.
- **Permission Standards:** Automated via script to ensure `www-data` maintains correct ownership for seamless updates.
