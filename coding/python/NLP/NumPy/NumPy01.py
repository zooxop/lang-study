import numpy as np

# ndim: 배열의 차원 수를 나타내는 속성
# shape: 배열의 차원과 크기를 나타내는 튜플 형태의 속성
# dtype: 배열 요소들의 데이터 타입을 나타내는 속성
# stride: 배열 요소와 행 간의 간격(데이터 크기 기준)을 나타내는 속성

a = np.array([1, 3, 5, 7])
print(a, a.ndim, a.shape, a.dtype, a.strides)

b = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
print(b, b.ndim, b.shape, b.dtype, b.strides)

c = np.array([[[1, 2, 3, 4], [5, 6, 7, 8]], [[9, 10, 11, 12], [13, 14, 15, 16]]])
print(c, c.ndim, c.shape, c.dtype, c.strides)
