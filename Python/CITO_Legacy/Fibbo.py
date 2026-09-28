class mumu:
    store=list()

def fibBa(n: int,p:int,temp:int):
    if(n == 0):
        return 0
    else:
        n = n - 1
        mumu.store.append(str(p))
        old=p
        p=p+temp
        temp=old
        return fibBa(n,p,temp)
if __name__ == '__main__':
    t = int(input())
    temp=dict()
    for i in range(t):
        fibBa(int(input()),1,0)
        temp[str(i)]=' '.join(mumu.store)
        mumu.store.clear
    for i in temp:
        print(temp[str(i)])
