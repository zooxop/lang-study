from bs4 import BeautifulSoup

html = """
<html>
<head>
<title>스크레이핑 실습</title>
</head>
<body>
<a href="http://www.inha.ac.kr">인하대학교</a>
<a href="http://www.harvard.edu">하버드대학교</a>
</body>
</html>
"""

soup = BeautifulSoup(html, 'html.parser')
urls = soup.findAll("a")

print(urls)

for url in urls:
    print(f"{url.string}의 URL 주소는 {url.attrs['href']} 입니다.")
