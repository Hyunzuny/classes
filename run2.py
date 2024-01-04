#run.py에서 my_module의 함수 사용.
from my_module import greet #my_module에 있는 greet만 사용할 때.
#모듈 안의 특정 함수/클래스만 import
#from 모듈명 import import대상

txt = greet("홍길동")
print(txt)
