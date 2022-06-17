import numpy as np
import matplotlib.pylab as plt

# 가중치 이동
# W(a)값이 작을때 -> 클 때
def logreg(z):
    return 1 / (1 + np.exp(-z))


W_list = [0.3, 0.5, 1]
b_list = [0, 1]
xx = np.linspace(-10, 10, 100)
for W in W_list:
    for b in b_list:
        yy = logreg( W * xx + b )
        plt.plot(xx, yy, label = W)
plt.legend()
plt.show()
