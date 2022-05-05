# TC: O(N)
for _ in range(int(input())):
    N, M = map(int, input().split())

    prints = list(map(int, input().split()))
    key_list = list(range(len(prints)))

    key_list[M] = 't'  # target

    order = 0

    # TC: O(N) ~ O(N!)
    while True:  # target을 찾을 때 까지 반복
        if prints[0] == max(prints):
            order += 1

            if key_list[0] == 't':
                print(order)
                break
            else:
                prints.pop(0)
                key_list.pop(0)
        else:  # 회전
            prints.append(prints.pop(0))  # list에는 rotate()가 없다.
            key_list.append(key_list.pop(0))


"""pseudo code
1. 리스트를 입력받는다. (list)
2. 입력받은 리스트와 동일한 크기의 리스트를 새로 생성한다. (copy_list)
3. 출력 순서를 알고 싶은(target) 인덱스를 임의의 식별자(t)로 치환한다.

while True
begin
    if list[0]의 원소 값이 최대값인 경우 then
        if copy_list[0]의 원소값이 't'인 경우 then
        begin
            출력순서 ++
            print(출력순서)
            break
        end
        else then
        begin
            list[0]와 copy_list[0]을 pop한다.
        end
    else
        list와 copy_list를 반시계방향으로 1회전
end 
"""