from bs4 import BeautifulSoup

html = """
<html>
<head>
<title>스크레이핑 실습</title>
</head>
<body>
<h1>인하대학교</h1>
<p>웹스크레이핑</p>
<p>넘파이, 판다스, NLP ... </p>
</body>
</html>
"""

soup = BeautifulSoup(html, 'html.parser')
t = soup.html.head.title
h1 = soup.html.body.h1.string
p1 = soup.html.body.p
p2 = p1.next_sibling.next_sibling

print(p1.string)
print(p2.string)
print(h1)
print(t)
print(t.string)