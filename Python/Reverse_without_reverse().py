"""
Note: Reverse the contents of a list without using the reverse() method of a list and without using slicing.

Input:

Lst=[12,23,4,8,1,11,27]

Output:

Original List

[12,23,4,8,1,11,27]

Reverse List

[27,11,1,8,4,23,12]
"""


My Solution:

First solution:


li=input()
print("Original List")
print(li)
li=li.replace('[','').replace(']','').split(',')
lenli=len(li)-1
bklenli=lenli
i=0
while(i<int(bklenli/2)):
  temp=li[i]
  li[i]=li[lenli]
  li[lenli]=temp
  lenli-=1
  i+=1
print("Reverse List")
li[0]='['+li[0]
li[bklenli]=li[bklenli]+']'
li=','.join(li)
print(li)

