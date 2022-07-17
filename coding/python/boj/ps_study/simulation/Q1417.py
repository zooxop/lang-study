N = int(input())
arr = []
count = 0

# TC: O(N)
for _ in range(0, N):
    arr.append(int(input()))

# TC: O(N) (대략적)
if N > 1:  # 단일 후보일 땐 매수할 필요가 없다.
    while True:
        _max = max(arr)
        if _max > arr[0]:
            idx = arr.index(_max)
            arr[idx] -= 1
            arr[0] += 1
            count += 1
        elif _max == arr[0] and arr.count(arr[0]) >= 2:
            count += 1
            print(count)
            break
        else:
            print(count)
            break
else:
    print(0)


""" pseudo code
arr[0] => 최대값이 되도록 변경시킬 변수

if N > 1 then  # 단일 후보일 땐 매수할 필요가 없음.
    while True do
        if max(arr) > arr[0] then
            - max값 index의 값을 1 내린다.
            - arr[0]의 값을 1 올린다.
            - count의 값을 1 올린다.
        else if max(arr) == arr[0] and max(arr).count() >= 2 then
            - count의 값을 1 올린다.
            - count 출력.
            - break;
        else then
            - count 출력.
            - break;
    endwhile
else
    - 0 출력.

"""