import datetime
import logging
import azure.functions as func
from backup import run_backup   

def main(mytimer: func.TimerRequest) -> None:
    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()

    if mytimer.past_due:
        logging.warning('The timer is past due!')

    run_backup()  

    logging.info('Backup function ran at %s', utc_timestamp)
