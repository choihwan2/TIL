import requests
from decouple import config


token = config('977161601:AAHU7TD-67j0bTuMEmE-MZ8-1m8kjBm3BUQ')
app_url = f"https://api.telegram.org/bot{token}"
chat_id = config('CHAT_ID')

update_url = app_url + "/getUpdates"

text = "사랑합니다."
message_url = app_url + f"/sendMessage?chat_id={chat_id}&text={text}"

requests.get(message_url)