def solution(n):
    result = ''
    while n:
        result += str(n % 3)
        n = n // 3
    return int(result, 3)


if __name__ == "__main__":
    print(solution(45))

    print(int('21', 3))

