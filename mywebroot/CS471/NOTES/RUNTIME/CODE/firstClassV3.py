def make_multiplier (m):
    return lambda x: m*x

def test():
    double = make_multiplier (2)
    triple = make_multiplier (3)

    print("double(5) = ", double(5))
    print("double(3) = ", double(3))
    print("triple(5) = ", triple(5))
    print("triple(3) = ", triple(3))
    return
