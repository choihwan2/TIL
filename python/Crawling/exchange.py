import requests
from bs4 import BeautifulSoup as bs

url = "https://finance.naver.com/marketindex/"
resopnse = requests.get(url).text
soup = bs(resopnse, "html.parser")

dollar = soup.select_one("#exchangeList > li.on > a.head.usd > div > span.value")

print(dollar.text)

#파일 저장
#내부에서만 잠깐 사용하겠다 with
with open("test.txt", 'w', encoding='utf-8') as f:
    f.write(dollar.text)