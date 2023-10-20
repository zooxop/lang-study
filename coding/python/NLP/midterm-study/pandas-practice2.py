import pandas as pd


def square(n) -> int:
    return n * n


df = pd.DataFrame(
    [
        [4, 7, 10],
        [5, 8, 11],
        [6, 9, 12]
    ],
    index=[1, 2, 3],
    columns=['a', 'b', 'c']
)

print(df)
"""
   a  b   c
1  4  7  10
2  5  8  11
3  6  9  12
"""

print(df.apply(square))  # 정의된 함수를 클로져로 보내서 각 값에 적용시킴
"""
    a   b    c
1  16  49  100
2  25  64  121
3  36  81  144
"""

print(df.apply(lambda x: x * x))
"""
상동
"""

df2 = pd.melt(df)
print(df2)
"""
  variable  value
0        a      4
1        a      5
2        a      6
3        b      7
4        b      8
5        b      9
6        c     10
7        c     11
8        c     12
"""

df2 = (pd.melt(df)
       .rename(columns={'variable': 'var', 'value': 'val'})
       .query('val > 10')
       .sort_values('val', ascending=False))  # 내림차순
print(df2)
"""
  var  val
8   c   12
7   c   11
"""

# iloc: index를 기준으로 데이터 슬라이싱
df3 = df.iloc[0:2]
print(df3)
"""
   a  b   c
1  4  7  10
2  5  8  11
"""

# 모든 행 / 0, 2번 열
df3 = df.iloc[:, [0, 2]]
print(df3)

# DataFrame에 대해 len()을 사용하면 "행"의 개수가 리턴됨.
print("df의 행의 개수 : ", len(df))
