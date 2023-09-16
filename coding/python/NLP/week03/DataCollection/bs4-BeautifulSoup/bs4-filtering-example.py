from bs4 import BeautifulSoup
import urllib.request

api = 'https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp'
urls = urllib.request.urlopen(api).read()

soup = BeautifulSoup(urls, 'html.parser')

cities = soup.findAll("city")
print(len(cities))

""" 이 방식은 원하지 않는 <wf> 태그를 가져오는 방식임. 
wfs = soup.findAll("wf")
wfs.pop(0)  # html의 맨 위에 <wf> 태그를 사용한 중기날씨 요약표가 존재하므로 pop시켜서 제거함.

for i in range(len(cities)):
    print(f"{cities[i].string}의 날씨는 {wfs[i*13].string} 입니다.")
"""

# <data> 태그 안에 들어있는 <wf> 태그를 찾는다.
datas = soup.findAll("data")

for i in range(len(cities)):
    print(f"{cities[i].string}의 날씨는 {datas[i * 13].find('wf').string} 입니다.")