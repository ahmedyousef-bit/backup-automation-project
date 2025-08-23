- Cloud Backup Automation

- Overview
Automated backup system using Python, Azure Function, Terraform, and CI/CD pipelines.  
Demonstrates Infrastructure as Code, Configuration Management, CI/CD, and Monitoring.

-Architecture
![Architecture Diagram](docs/architecture.png)

-Features / Skills Demonstrated
- Terraform for Infrastructure as Code
- Azure Function for automated backup
- Key Vault for secure secrets management
- CI/CD Pipelines with Azure DevOps
- Logging & Monitoring (simulated due to expired Azure subscription)
- Timer Trigger for daily backup

- How it works
1. Infra Pipeline creates Resource Group, Storage, and Key Vault.
2. App Pipeline deploys Python backup script as Azure Function.
3. Timer Trigger schedules backup daily (simulated locally).
4. Logs record success/failure in `backup.log`.

- File Structure
