#모듈 => 재사용가능한 전역변수, 함수, 클래스들을 정리한 스크립트 파일.

__version__ = 1.0

def greet(name):
    return f"{name}님 안녕하세요"

class Person:
    
    def __init__(self, name, age):
        self.name = name
        self.age = age
        
    def __str__(self):
        return f"이름 : {self.name}, 나이 : {self.age}"

#메인 모듈로 실행할때 실행되는 코드.(sub모듈로 실행될때는 실행되면 안됨.)
if __name__ =="__main__": #main 코드 sub 코드
    print("my_module.__name__:",__name__)    
    print(greet('이름'))
    p = Person("안현준", 10)
    print(p)
