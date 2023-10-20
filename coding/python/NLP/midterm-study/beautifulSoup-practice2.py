from bs4 import BeautifulSoup
import urllib.request

api = 'https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp'
urls = urllib.request.urlopen(api).read()

soup = BeautifulSoup(urls, 'html.parser')

cities = soup.findAll("city")
print(len(cities))

wfs = soup.findAll("wf")

for i in range(len(cities)):
    print(f"{cities[i].string}의 날씨는 {wfs[i*13].string} 입니다.")

datas = soup.findAll("data")

for i in range(len(cities)):
    print(f"{cities[i].string}의 날씨는 {datas[i * 13].find('wf').string} 입니다.")
