import os
import requests
import time
from datetime import datetime

ALB_URL = os.getenv("ALB_URL")
if not ALB_URL:
    raise Exception("❌ ALB_URL environment variable not set.")

def send_requests(rate_per_second, duration_sec):
    end_time = time.time() + duration_sec
    while time.time() < end_time:
        for _ in range(rate_per_second):
            try:
                res = requests.get(ALB_URL)
                print(f"[{datetime.now()}] Status: {res.status_code}")
            except Exception as e:
                print(f"[ERROR] {e}")
        time.sleep(1)

if __name__ == "__main__":
    print("🌱 Warming up traffic...")
    for rate in range(1, 6):
        send_requests(rate, 15)

    print("🚀 Peak traffic...")
    send_requests(15, 180)

    print("📉 Cool down...")
    for rate in reversed(range(1, 6)):
        send_requests(rate, 15)
