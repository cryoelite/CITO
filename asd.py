class Temperature:
  celsius=9
  fahrenheit=0
  def __init__(self,value=0):
    self._fahrenheit=value
    self._celsius=value/2

  @property
  def celsius(self):
    print("getCel")
    return self._celsius

  @celsius.setter
  def celsius(self,value):
    print("setCel")
    self._celsius=value

  @property
  def fahrenheit(self):
    print("getTemop")
    return self._fahrenheit

  @fahrenheit.setter
  def fahrenheit(self,value):
    print("set temp")
    self._fahrenheit=value
  

human=Temperature(29)
print(human.fahrenheit)
human.fahrenheit=30
print(human.celsius)