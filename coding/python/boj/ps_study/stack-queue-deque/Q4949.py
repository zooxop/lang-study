_str = ['']
result = []

while _str[0] != '.' or _str.__len__() > 1:
    is_success = True

    _str = list(input())
    _stack = []

    idx = _str.index('.')
    if idx > 0:
        _str = _str[:idx]

    for _chr in _str:
        if _chr == '[':
            _stack.append(_chr)
        elif _chr == ']':
            if _stack and _stack[-1] == '[':
                _stack.pop()
            else:
                is_success = False
                break
        elif _chr == '(':
            _stack.append(_chr)
        elif _chr == ')':
            if _stack and _stack[-1] == '(':
                _stack.pop()
            else:
                is_success = False
                break

    if is_success and not _stack:
        result.append("yes")
    else:
        result.append("no")

result.pop()
for temp in result:
    print(temp)

""" pseudo code
while input != "." 또는 input.length > 1 do
begin
    
end

"""
