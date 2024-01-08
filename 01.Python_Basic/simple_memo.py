
import os

def memo():
    os.makedirs("output", exist_ok= True)
    print("저장할 파일을 입력히세요.")
    
    txt_name = input("파일명을 입력하세요 : ")
    print("="*50)
    
    with open(f"output/{txt_name}.txt", "wt", encoding = "utf - 8") as fw:
        print('안녕하세요')
        print('='*50)
        while True:
            line_txt = input(">> : ")

            if line_txt == "!q":
                break
            fw.write(line_txt+"\n")
            
    memo()
    
