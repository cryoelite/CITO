def checker(listOne,m=0):
    lenny=len(listOne)
    if m==0:
        index=0
        n=2
    elif(m==2):
        index=0
        n=1
        m=0
    else:
        index=1
        n=2
    for i in range(m,lenny,n):
        index+=n
        if(index<lenny):
            if(listOne[i]>=listOne[index]):
                listOne.pop(i)
                return 1,listOne
    return 0,listOne
if __name__=='__main__':
    listOne=list(map(int,input().split()))
    first,listOne=checker(listOne,0)
    second,listOne=checker(listOne,1)
    third,listOne=checker(listOne,2)
    print("Yes") if(first+second+third<=1) else print("No")
