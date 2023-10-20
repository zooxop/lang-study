import numpy as np

# ndim: 배열의 차원 수
# shape: 배열의 차원, 크기를 튜플로 나타냄
# dtype: 배열의 데이터 타입
# stride: 배열의 요소와 행 간격

a = np.array([1, 3, 5, 7])
print(a, a.ndim, a.shape, a.dtype, a.strides)

b = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
print(b, b.ndim, b.shape, b.dtype, b.strides)


# zeros(), ones(): 주어진 모양에 맞게 모든 요소가 0 또는 1인 배열 생성
# arange(): 지정된 범위 내에서 일정한 간격으로 숫자가 담긴 배열을 생성하는 함수
# linespace(): 지정된 범위 내에서 균등하게 분할된 숫자가 담긴 배열을 생성하는 함수
# reshape(): 배열의 모양(shape)을 변경하는 메서드로, 새로운 모양에 맞게 요소들을 재배열

ones = np.ones((3, 4))  # 3줄 4컬럼짜리
print(ones)

zeros = np.zeros((3, 4), dtype=np.int16)
print(zeros)

q = np.arange(5)  # 5칸짜리 1차원 배열을 0부터 하나씩 더하면서 넣어줌.
print(q)

w = np.arange(5, 11)  # [ 5  6  7  8  9 10]
print(w)