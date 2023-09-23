import urllib.request
import urllib.parse

api = 'https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp'
id = input('input local code : ')  # 108, 109, 105  (전국, 서울, 강원)

values = {'stnId': id}
parameters = urllib.parse.urlencode(values)

url = api + '?' + parameters
print(url)  # https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=105

urls = urllib.request.urlopen(url).read()
texts = urls.decode('utf-8')
print(texts)