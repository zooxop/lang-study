import urllib.request

# 1. 이미지 다운받기
# url = 'https://inha.ac.kr/sites/kr/images/logo.png'
# urllib.request.urlretrieve(url, 'inha.png')
#
# print('saved!')

# 2. 이미지를 다운받는 과정에서 편집을 할 수 있는 방법
url = 'https://inha.ac.kr/sites/kr/images/logo.png'
logo = urllib.request.urlopen(url).read()  # 메모리 버퍼에 이미지를 임시 저장해놓기

# File Pointer 활용
with open('inha.png', 'wb') as fp:
    fp.write(logo)  # 파일 저장

print('saved!')