# 시각화 lib
import matplotlib.pylab as plt
# 행렬 lib
import numpy as np
# 선형회귀 모델링 lib - sklearn
from sklearn.linear_model import LinearRegression
# 학습 데이터, 테스트 데이터 분리
from sklearn.model_selection import train_test_split
# 엑셀 lib
import pandas as pd

# 엑셀 데이터 불러오기
# data = pd.read_excel('./apartment.xlsx', sheet_name="Sheet3", names=['area', 'price'], header=None)
data = pd.read_excel('./test.xlsx', sheet_name="Sheet1", names=['WinRate', 'Result'], header=None)
# x = 면적, y = 가격
x = data['WinRate']
y = data['Result']

# train set 80% test set 20%
x_train, x_test, y_train, y_test = train_test_split(data[['WinRate']], data['Result'], test_size=0.1, random_state=0)
# 선형 회귀 모델 학습
model = LinearRegression()
model.fit(x_train, y_train)

# 테스트 데이터로 예측
# y_pred = model.predict(x_test)
y_pred = model.predict(x_test)

plt.plot(y_test, y_pred, '.')
plt.title("predict data price graph")
plt.xlabel('area')
plt.ylabel('price')

x = np.linspace(0, 2, 2)
y = x
plt.plot(x, y)
plt.show()
