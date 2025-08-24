import datetime
import os

def run_backup():
    now = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    filename = f"backup-{now}.txt"

    # Simulate backup
    with open(filename, "w") as f:
        f.write("This is a simulated backup file.\n")

    print(f"Backup created: {filename}")

if __name__ == "__main__":
    run_backup()
import datetime
import os
import logging

 Logging
logging.basicConfig(
    filename='backup.log', 
    level=logging.INFO, 
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def run_backup():
    backup_path = os.getenv("BACKUP_PATH", "/tmp")
    try:
        filename = f"{backup_path}/backup-{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}.txt"
        with open(filename, "w") as f:
            f.write("This is a simulated backup file.\n")
        logging.info(f"Backup created successfully: {filename}")
    except Exception as e:
        logging.error(f"Backup failed: {str(e)}")
