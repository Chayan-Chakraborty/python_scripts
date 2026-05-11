import requests
import traceback
from datetime import datetime

SLACK_BOT_TOKEN = "xoxb-your-token"
CHANNEL = "#alerts"  # or channel ID like C12345678

def send_slack_alert(message, level="ERROR"):
    url = "https://slack.com/api/chat.postMessage"

    headers = {
        "Authorization": f"Bearer {SLACK_BOT_TOKEN}",
        "Content-Type": "application/json"
    }

    payload = {
        "channel": CHANNEL,
        "text": f"{level} Alert 🚨",
        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f"*{level} Alert* 🚨\n```{message}```"
                }
            },
            {
                "type": "context",
                "elements": [
                    {
                        "type": "mrkdwn",
                        "text": f"Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}"
                    }
                ]
            }
        ]
    }

    response = requests.post(url, headers=headers, json=payload)
    
    if not response.json().get("ok"):
        print("Slack error:", response.json())