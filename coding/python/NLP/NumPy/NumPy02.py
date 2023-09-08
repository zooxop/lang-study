import numpy as np

# zeros(), ones(): 주어진 모양(shape)에 대해 모든 요소가 0 또는 1인 배열을 생성하는 함수
# arange(): 지정된 범위 내에서 일정한 간격으로 숫자가 담긴 배열을 생성하는 함수
# linespace(): 지정된 범위 내에서 균등하게 분할된 숫자가 담긴 배열을 생성하는 함수
# reshape(): 배열의 모양(shape)을 변경하는 메서드로, 새로운 모양에 맞게 요소들을 재배열

ones = np.ones((3, 4))
print(ones)

zeros = np.zeros((3, 4), dtype=np.int16)
print(zeros)

zeros2 = np.zeros((2, 3, 4))
print(zeros2, zeros2.dtype)

a = np.arange(5)
print(a, a.ndim, a.shape, a.size)

b = np.arange(5, 11)
print(b, b.ndim, b.shape, b.size)

c = np.arange(5, 11, 2)
print(c, c.ndim, c.shape, c.size)

d = np.arange(2.0, 11.8, 0.2)
print(d, d.ndim, d.shape, d.size)