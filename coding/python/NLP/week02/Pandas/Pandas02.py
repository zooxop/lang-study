import pandas as pd


def square(n) -> int:

    return n * n


df = pd.DataFrame(
    [[4, 7, 10],
     [5, 8, 11],
     [6, 9, 12]],
    index=[1, 2, 3],
    columns=['a', 'b', 'c'])

print(df)
print(df.apply(square))
print(df.apply(lambda x: x * x))  # lambda 스타일

df2 = pd.melt(df)
print(df2)

df2 = (pd.melt(df)
       .rename(columns={'variable': 'var', 'value': 'val'}))
print(df2)

df2 = (pd.melt(df)
       .rename(columns={'variable': 'var', 'value': 'val'})
       .query('val > 10'))
print(df2)

df2 = (pd.melt(df)
       .rename(columns={'variable': 'var', 'value': 'val'})
       .query('val > 10')
       .sort_values('val', ascending=False))
print(df2)

# iloc : index를 기준으로 데이터 슬라이싱
df3 = df.iloc[0:2]
print(df3)

df3 = df.loc[1:2]
print(df3)

# 이렇게 하면 0번, 2번 열에 대한 값만 가져온다.
df3 = df.iloc[:, [0, 2]]
print(df3)

# DataFrame에 len()을 사용하면 행의 개수가 리턴됨.
print("df의 행의 개수 : ", len(df))

