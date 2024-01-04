#run.py에서 my_module의 함수 사용.
import my_module as mm
txt = mm.greet("홍길동")
print(txt)

p = mm.Person("이순신", 30)
print(p)

txt2 = mm.greet(p.name)
print(txt2)
#주피터에서 불러오기
