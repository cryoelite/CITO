import pyautogui
import time
x1=1583
y1=306
x2=1393
y2=789
time.sleep(10)
for i in range(0,65):
    pyautogui.moveTo(x1, y1)
    time.sleep(0.3)
    pyautogui.click()
    time.sleep(5)
    pyautogui.moveTo(x2,y2)
    time.sleep(0.3)
    pyautogui.click()
    time.sleep(5)

