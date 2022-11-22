obj = {'a': {'b': {'c': {'d':{'e'}}}}}
key = 'd'
def findItem(obj):
    for k,v in obj.items():
        if type(v) is dict:
            yield(k,v)
            print("yield 1 ",k,v)
            print("yield 2 ",k,v)
            yield from findItem(v)
        else:
            print("yield 3 ",k,v)
            yield(k,v)

def getValue():
    for k, v in findItem(obj):
        if k == key:
            return v

result = getValue()
print(result)