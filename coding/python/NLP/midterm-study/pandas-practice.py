import pandas as pd
"""
Series
 - 1차원 배열 형태의 자료구조로, 인덱스(index)와 값(value)으로 이루어져 있다.
 - 시리즈는 일련의 데이터를 레이블링된 인덱스와 함께 저장하고 처리하는데 사용됨.

DataFrame
 - 2차원 테이블 형태의 자료구조로, 여러 개의 시리즈(Series) 객체가 모여서 열(Column)과 행(Row)으로 구성.
 - 데이터 프레임은 엑셀 스프레드 시트나 SQL 테이블과 유사한 형태로 다양한 유형의 데이터를 관리하고 조작하는데 사용됨.
"""

s = pd.Series([1, 2, 3, 4])
print(s)
"""
0    1
1    2
2    3
3    4
dtype: int64
"""

# 인덱스에 레이블링 하기
s1 = pd.Series([1, 2, 3, 4], index=['a', 'b', 'c', 'd'])
print(s1)
"""
a    1
b    2
c    3
d    4
dtype: int64
"""

# 슬라이싱
s2 = pd.Series([99, 100, 98, 91, 92])
s2_subset = s2[1:4]
print(s2_subset)
"""
1    100
2     98
3     91
dtype: int64
"""

# 평균
s2_mean = s2.mean()
print(s2_mean)
"""
96.0
"""

