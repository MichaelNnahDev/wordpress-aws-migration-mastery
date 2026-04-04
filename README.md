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

## 📂 Repository Contents
- `/configs/`: Production-ready Apache Virtual Host configuration files.
- `/scripts/`: Automation scripts to fix Linux file permissions instantly.

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
