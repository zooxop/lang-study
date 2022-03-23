A, B = map(int, input().split())
C = int(input())

minute = (B + C)
hour = (minute // 60) + A

if hour > 23: hour-=24

print(hour, minute % 60)