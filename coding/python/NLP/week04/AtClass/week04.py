import matplotlib.pyplot as plt
import pandas as pd
# from sklearn.linear_model import LinearRegression
from sklearn.neighbors import KNeighborsRegressor
# import InhaLearn

# 데이터셋을 다운로드한다.
life_satisfaction = pd.read_csv("https://github.com/ageron/data/raw/main/lifesat/lifesat.csv")
X = life_satisfaction[["GDP per capita (USD)"]].values
y = life_satisfaction[["Life satisfaction"]].values

# Visualize the data
life_satisfaction.plot(kind='scatter', grid=True, x="GDP per capita (USD)", y="Life satisfaction")
plt.axis([23_500, 62_500, 4, 9])
plt.show()

# 선형회귀 모델 생성
# model = InhaLearn.LinearRegression()

# 최근접 이웃 회귀
model = KNeighborsRegressor(3)

# 모델을 훈련시킨다.
model.fit(X, y)

X_new = [[42_396.76]]  # 한국 데이터 입력해봄
print(model.predict(X_new))
print(life_satisfaction)
