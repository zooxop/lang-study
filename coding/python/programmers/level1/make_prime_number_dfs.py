arr = []
count = 0


def dfs(_nums, idx, _len):
    global count

    if _len == 3:
        if is_prime(sum(arr)):
            count += 1
        return

    for i in range(idx, len(_nums)):
        if _len < 3:
            arr.append(_nums[i])
            dfs(_nums, i+1, _len+1)
            arr.pop()


def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    return True


def solution(nums):
    global count
    count = 0

    dfs(nums, 0, 0)
    return count


if __name__ == "__main__":
    print(solution([1, 2, 3, 4]))  # 1
    print(solution([1, 2, 7, 6, 4]))  # 4
