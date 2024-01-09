
import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime

url = "https://news.daum.net/"
user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'


def get_news_list():
    #1. 요청
    res = requests.get(url, headers = {'User_agent':user_agent})

    if res.status_code ==200:
        soup = BeautifulSoup(res.text,"lxml")

    #     print(soup.prettify())
        tag_list = soup.select("body > div.container-doc > main > section > div > div.content-article > div.box_g.box_news_issue > ul > li > div > div > strong > a")
        print(len(tag_list))

        link_list =[] #링크 저장 리스트
        title_list =[] #제목 저장 리스트
        for tag in tag_list:
    #         print(tag.get("href"), tag.get_text())  #뉴스 링크 : get("href)", 뉴스제목 : get_text
            link_list.append(tag.get("href"))
            title_list.append(tag.get_text().strip())

        df = pd.DataFrame({      #표만들기 - 판다스
            "제목" : title_list,
            "url"  : link_list
        })

        return df
    
def get_news(url):
    
    res_news = requests.get(url , headers = {"user_agent" : user_agent})

    if res_news.status_code == 200:
        soup = BeautifulSoup(res_news.text, "lxml")
        title = soup.select_one("#mArticle > div.head_view > h3").get_text()
#         return "제목 : ", title

        p_tag_list = soup.select("#mArticle > div.news_view.fs_type1 > div.article_view > section > p")  #리스
    #     print(len(p_tag_list))

        content_list = []
        for p_tag in p_tag_list:
            content_list.append(p_tag.get_text())
    #   [p_tag.get_text() for p_tag in p_tag_list]

        news = "\n".join(content_list)
        return news

