from flask import Flask, render_template, request
import random
import datetime

app = Flask(__name__) #서버의 이름을 app으로 하겠다.

#url을 관리해주는 친구 > @시작하는 @app.route("/")

@app.route("/")
def hello():
    return "안녕!!"

@app.route("/dday")
def dday():
    today = datetime.datetime.now()
    final = datetime.datetime(2020, 6, 9)
    result = final - today
    return f"힘을 내야 하는 날이 {result.days}일 남았습니다."

@app.route("/lotto")
def lotto():
    numbers = random.sample(range(1,46), 6)
    return f"{numbers}"

@app.route("/christmas")
def christmas():
    now = datetime.date.today()
    today = datetime.datetime.now()

    print(today.date().strftime("%y년 %m월 %d일"))
    if now.month == 12 and now.day == 25:
        return "크리스마스에요!"
    else :
        return "<h1>아니에요 열심히 기다려봐요<h1>"

@app.route("/movies")
def movies():
    movies = ["겨울왕국2", "클라우스", "어바웃 타임", "나홀로 집에2", "이터널선샤인", "반지의 제왕"]
    return render_template("movie.html", movies = movies) ##앞 movies가 html 쪽 movies 뒤에는 어떤 리스트를 보낼지.


@app.route("/greeting/<name>")
def greeting(name):
    return f"안녕하세요 {name}님!"

@app.route("/cube/<int:num>")
def cube(num):
    result = num ** 3
    return str(result)

'''
def render_template(str, **args) :
    파이썬에서는 가변적인 개수가 들어가도 상관없다.
'''

@app.route("/lunch/<int:num>")
def lunch(num):
    lunches = ["자장면", "짬뽕", "오므라이스", "볶음밥", "고추잡채", "탕수육", "돈까스"]
    lunch = random.sample(lunches,num)
    return render_template("lunch.html", lunches = lunches,people = num, pick_lunch = lunch)
    # return f"{lunch}"
# 식사 메뉴 추천.
# 1. random
# 2. Dynamic route: @app.route("/lunch/1 2 3 4")
# - 숫자를 받아서 명수 개수 만큼 
# - List : 자장면, 짬뽕, 오므라이스, 볶음밥, 고추잡채, 탕수육, 돈까스, 
# - <int:num> 숫자 만큼 뽑기

@app.route("/vonvon")
def vonvon():

    return render_template("vonvon.html")

@app.route("/godmademe")
def godmademe():
    name = request.args.get("name")
    first_list = ["잘생김", "어중간함", "덤벙거림", "착함", "찌질", "재력", "귀여움"]
    second_list = ["애교", "힘", "용기", "지능", "센스", "식욕", "계획력"]
    third_list = ["운", "행복", "긍정", "생기", "감성", "재수없음", "답답함"]

    first = random.choice(first_list)
    second = random.choice(second_list)
    third = random.choice(third_list)

    return render_template("godmademe.html", name = name, first = first, second = second, third = third)


if __name__ == "__main__":
    app.run(debug=True)