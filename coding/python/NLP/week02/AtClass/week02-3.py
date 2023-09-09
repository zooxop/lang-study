import pandas as pd

df = pd.DataFrame({
    "a": [14, 51, 6],
    "b": [72, 8, 9],
    "c": [100, 11, 2]
    }, index=[1, 2, 3]
)

print(df)

df2 = (pd
       .melt(df)
       .rename(columns={'variable': 'var', 'value': 'val'})
       .query("val > 5"))
print(df2)
