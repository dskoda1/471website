def fib (n):
    if n < 2:
        return 1
    else :
        return fib(n-1) + fib (n-2)

def fibi (n):
     a = 1
     b = 1
     s = 1
     while s < n:
         s += 1
         t = a + b
         a = b
         b = t
     return b
def fibf (n):
    a = 1
    b = 1
    for i in range (2,n+1):    # i assumes the values 2 to n
        t = a + b
        a = b
        b = t
    return b 
