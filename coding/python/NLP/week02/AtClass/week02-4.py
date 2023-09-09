import pandas as pd

df = pd.DataFrame({
    "a": [14, 51, 6],
    "b": [72, 8, 72],
    "c": [100, 11, 2]
    }, index=[1, 2, 3]
)

# print(df)
print(df.shape)
print(df['b'].value_counts())
print(df['b'].nunique())
print(df.describe())
