def A1(strParam):
    num=int();
    romans={'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000}
    
    for i in range(strParam):
        num+=romans[strParam[i]]
        if(i!=0 and A2(strParam[i-1],strParam[i],romans)):
            num-=romans[strParam[i-1]]

def A2(c1,c2,romans):
    index1=list(romans.keys()).index(c1)
    index2=list(romans.keys()).index(c2)
    if(index1<index2):
        return True


strArr="XXIV"
print(A1(strArr))