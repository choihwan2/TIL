import random
import json

import requests
from bs4 import BeautifulSoup as bs # bs4에 있는 BeautifulSoup 이라는 것을 가져오는데 bs로 이름을 사용하겠다.


numbers = random.sample(range(1,46), 6)
url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=836"

response = requests.get(url)
#print(response.text)

lotto = json.loads(response.text)
#print(lotto.get("drwtNo6"))

winner = []

for i in range(1, 7):
    winner.append(lotto.get(f"drwtNo{i}"))

print(winner)

# Python 함수
def pickLotto():
    picked = sorted(random.sample(range(1, 46),6))
    print(picked)
    matched = len(set(winner) & set(picked))
    print(matched)

    if matched == 6:
        print("1등")
    elif matched == 5:
        print("3등")
    elif matched == 4:
        print("4등")
    elif matched == 3:
        print("5등")
    else:
        print("꽝")

pickLotto()