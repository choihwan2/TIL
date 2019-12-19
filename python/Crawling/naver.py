'''
1. request > naver.com
2. response > bs4
3. webbroser

'''
import requests
from bs4 import BeautifulSoup as bs
import webbrowser

url = "https://www.naver.com"
requests.get(url)
response = requests.get(url).text

#"html.parser" : 받아올 형식을 의미함. 
doc = bs(response, 'html.parser')

# . > class
# # > id
# result = doc.select_one(".ah_k")

result = doc.select(".ah_k")
# print(result)

search_url = "https://search.naver.com/search.naver?query="
for i in range(5): 
    webbrowser.open(search_url + result[i].text)
    # print(result[i].text)