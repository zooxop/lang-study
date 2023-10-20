import pandas as pd

df = pd.DataFrame({
    "a": [14, 51, 6],
    "b": [72, 8, 9],
    "c": [100, 11, 2]
    }, index=[1, 2, 3]
)

print(df)
"""
    a   b    c
0  14  72  100
1  51   8   11
2   6   9    2
"""

df2 = (pd
       .melt(df)  # 멜팅(녹이기) => 2차원을 1차원으로.. (데이터 프레임을 시리즈로)
       .rename(columns={'variable': 'var', 'value': 'val'})  # 컬럼명 변경
       .query("val > 5"))  # 쿼리 기능도 쌉가능

print(df2)
"""
  var  val
0   a   14
1   a   51
2   a    6
3   b   72
4   b    8
5   b    9
6   c  100
7   c   11
"""