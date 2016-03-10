import dis

def A(i):
    def B(j):
        return i
    return B

def C(i):
    def D(j):
        return j
    return D

##Disassembler documentation: https://docs.python.org/3/library/dis.html
print('A bytecode')
dis.dis(A)
print('C bytecode')
dis.dis(C)
