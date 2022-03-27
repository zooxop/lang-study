def arithmetic(val):
    if val < 100:
        return val
    else:
        if val == 1000:
            val -= 1
        count = 99
        for i in range(100, val + 1):
            temp = list(map(int, str(i)))
            if (temp[0] - temp[1]) == (temp[1] - temp[2]):
                count += 1
        return count


print(arithmetic(int(input())))
