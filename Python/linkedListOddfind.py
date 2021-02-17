class linker:
  def __init__(self,start):
    self.start=start
  def linking(self):
    pass
class linkedList:
  def __init__(self,value):
    self.value=value
    self.next=None
  
if __name__=='__main__':
  val=int()
  size=int(input())
  arr=int()
  head=linker(linkedList(0))
  temp=head.start
  for i in range(size):
    arr=int(input())
    temp.next=linkedList(arr)
    temp=temp.next
  temp=head.start
  for i in range(size+1):
    if(i%2!=0):
      val+=temp.value
    temp=temp.next
  print(val)