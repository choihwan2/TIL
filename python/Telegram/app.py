from flask import Flask, render_template, request
import requests
from decouple import config
import random
app = Flask(__name__)

token = config('TELEGRAM_BOT_TOKEN')
chat_id = config('CHAT_ID')

app_url = f"https://api.telegram.org/bot{token}"

lunches = ["자장면", "짬뽕", "오므라이스", "볶음밥", "고추잡채", "탕수육", "돈까스"]


@app.route("/")
def hello():
    return "안녕하세요 영재형"

@app.route("/write")
def write():
    return render_template("write.html")


@app.route("/send")
def send(clinet_id,message):
    # message = request.args.get("message")
    message_url = app_url + f"/sendMessage?chat_id={clinet_id}&text={message}"
    # message 받아서 telegram 메시지 보내는 요청
    requests.get(message_url)
    return "메시지 전송 완료 했어요"

# Webhook
@app.route(f"/{token}", methods=['POST'])
def telegram():
    # print(request.get_json())
    response = request.get_json()



    # 실습 1: 사용자의 아이디와 텍스트 가져오기
    clinet_id = response["message"]["chat"]["id"]
    message = response["message"]["text"]
    # print(clinet_id, message)
    #앵무새
    # 실습 2 : 텔레그램 메시지 보내기 요청

    if message == "/로또":
        send(clinet_id, random.sample(range(1,46),6))
    elif message == "/점심":
        send(clinet_id, random.choice(lunches))
    else :
        send(clinet_id,message)
    #return body, status_code
    return '', 200
    #요청이 잘 보내졌다는것을 200으로 알려줌.


if __name__ == "__main__":
    app.run(debug=True)