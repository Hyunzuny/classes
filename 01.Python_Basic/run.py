#run.py에서 my_module의 함수 사용.
import my_module as mm  #무조건 별칭으로 호출.
from my_package import calculator as c
print(c.plus(5,6))

print("__name__:", __name__)

txt = mm.greet("홍길동")
print(txt)

p = mm.Person("이순신", 30)

print(p)

txt2 = mm.greet(p.name)
print(txt2)
#주피터에서 불러오기
