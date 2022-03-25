N = int(input())
scores = [0] * N

for i in range(0, N):
    extra = 0
    cases = list(input())

    for case in cases:
        if case == 'O':
            extra += 1
            scores[i] += extra
        else:
            extra = 0

for score in scores:
    print(score)
