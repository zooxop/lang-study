import numpy as np
import time

m = np.array([[1, 1, 2, 2],
              [3, 3, 4, 4],
              [5, 6, 7, 8],
              [9, 9, 9, 0]])

print(m)

print(m[2][2])
print(m[2, 2])  # 이 방식이 인덱싱을 한 단계 덜 하므로, 훨씬 빠르다.

start = time.time()
for i in range(10_000_000):
    m[2][2]

print(time.time() - start)

start = time.time()
for i in range(10_000_000):
    m[2, 2]

print(time.time() - start)