import numpy as np

m = np.array([[1, 1, 2, 2],
              [3, 3, 4, 4],
              [5, 6, 7, 8],
              [9, 9, 9, 0]])

print(m[::2, 1:3])

print(m[::2, 1])

print(m[:2, 1:3])

print(m[2])
print(m[2, :])

print(m[:, 1])
print(m[..., 1])

print(m[2, 1:3])
print(m[2:3, 1:3])  # 2D로(matrix 로) 리턴된다.
