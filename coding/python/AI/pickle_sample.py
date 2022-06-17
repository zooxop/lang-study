from sklearn import datasets
from sklearn.neighbors import KNeighborsClassifier
import joblib

# 붓꽃 품종 데이터 세트 불러오기
dataset = datasets.load_iris()

# 입력 데이터와 타깃을 준비합니다.
X, y = dataset['data'], dataset['target']

# K 최근접이웃 모델 객체를 만듭니다.
model = KNeighborsClassifier(n_neighbors=5)

# K 최근접 이웃 모델에 입력 데이터와 타깃을 입력하고 학습시킨다.
model.fit(X, y)

# 학습시킨 모델을 현재 경로에 knn_model.pkl 파일로 저장합니다.
joblib.dump(model, './knn_model.pkl')

loaded_model = joblib.load('./knn_model.pkl')

score = loaded_model.score(X, y)
print('정확도: {score:.3f}'.format(score=score))



# 데이터를 불러오기 : sklearn은 유방암 데이터를 dict 타입으로 제안합니다.
from sklearn.datasets import load_iris
iris = load_iris()
# iris

import pandas as pd

df = pd.DataFrame(iris.data, columns=iris.feature_names)
df['class'] = iris.target

df.tail()
