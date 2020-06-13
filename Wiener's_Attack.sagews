
def cont_fraction(x):
    licz = 1
    p = numerator(x)
    q = denominator(x)
    lista = []
    while licz != 0:
        r = math.floor(p / q)
        lista.append(int(r))
        licz = p
        licz -= (q * r)
        p = q
        q = licz
    return (lista)

def reducts(lista):
    len_lista = len(lista)
    p = []
    q = []
    p.append(1)
    p.append(lista[0])
    q.append(0)
    q.append(1)

    print(p)
    print(q)
    redukty=[]
    for i in range(0,len_lista-1):
        p.append(lista[i+1] * p[i + 1] + p[i])
        q.append(lista[i+1] * q[i + 1] + q[i])
    print(p,q)
    for i in range(0,len_lista):
        redukty.append(q[i+1]/p[i+1])

    return redukty

def wiener(N,e):
    fractions=[]
    redukty=[]
    x=(N/e)
    fractions=cont_fraction(x)
    redukty=reducts(fractions)
    len_redukty=len(redukty)
    for i in range(0,len_redukty):
        k=redukty[i].numerator()
        d=redukty[i].denominator()
        FiodN=(e*d-1)/k
        b=(-1)*N+FiodN-1
        a=1
        delta=pow(b,2)-(4*a*N)
        print(delta)
        p=(-b-sqrt(delta))/(2*a)
        q=(-b+sqrt(delta))/(2*a)
        if(p*q==N):
            return d
        else:None




print("************Wiener's Attack****************")
d=wiener(90581 ,17993)
print(d)









