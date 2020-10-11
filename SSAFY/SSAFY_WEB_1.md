# HTML

웹의 동작원리!

- 클라이언트(사용자 PC)에서 URL을 브라우저에 입력한다 DNS 를 통한 URL로 접속요청(HTTP) 서버가 요청사항 분석 계산후 해당 결과값을 Client에서 결과값을 보내고 접속을 끊습니다. 브라우저가 해당 결과값을 받습니다. 클라이언트 화면에 출력. 각 웹브라우저는 브라우저 엔진이 내장되어 있고, 이 엔진이 `tag` 를 해석하여 화면에 표현

  ![스크린샷 2020-09-08 오전 9.56.09](images/스크린샷 2020-09-08 오전 9.56.09.png)



- HTML의 주석은 Java의 주석과 다르게 서버에 주석을 포함한 모든걸 보내준다. java는 컴파일과정에서 아예 없애버림



- `<p>` 는 한줄 `<span>` 은 씌여진 블록만



- 외워야 하는 특수문자



![스크린샷 2020-09-08 오전 10.25.47](images/스크린샷 2020-09-08 오전 10.25.47.png)



`<Map>`

![스크린샷 2020-09-08 오전 11.12.13](images/스크린샷 2020-09-08 오전 11.12.13.png)



# CSS(Cascading Sytle Sheets)

Selector

- Element(tag)
- class(.)
- id(#)



# JavaScript

- JavaScript 는 프로토 타입 기반의 스크립트 프로그래밍 언어 => 객체지향 개념을 지원
- 브라우저가 JavaScript를 HTML과 함께 다운로드 하여 실행
- 브라우저가 HTML 문서를 읽어 들이는 시점에 JavaScript Engine이 실행된다
- JavaScript Engine sms ECMA-262을 기반





# Ajax

- Ajax는 언어나 프레임워크가 아닌 구현하는 방식을 의미한다.
- 웹에서 화면을 갱신하지 않고 데이터를 서버로부터 가져와 처리하는 방법.

- JavaScript의 XMLHttpRequest(XHR) 객체로 데이터를 전달하고 비동기 방식으로 결과를 조회
- 화면 갱신이 없으므로 사용자 입장에서는 편리하지만, 동적으로 DOM을 구성해야하므로 구현이 좀 복잡하다.



## GET vs POST

**GET**

- URL에 변수를 포함시켜 요청한다
- 데이터를 Header(헤더)에 포함하여 전송한다
- 최소한의 보안이 되지 않음(URL에 데이터가 노출되어 보내진다)
- 많은양의 데이터를 못보냄(용량제한이 있음) 주소를 통해 보내다보니
- 캐싱 할 수 있다.

**POST**

-  URL에 데이터가 노출되지 않아서 기본 보안은 되어있다.

-  `body`에 내용을 담아서 보냄
-  전송하는 길이에 제한이 없다.
-  캐싱 할 수 없다.

HTTP 에 XML 을 감싸서 보냄 => soap (XML 자체가 무겁다보니 점점 안쓰는 추세)

=> Restful : Json 을 보냄 클라이언트에서 DOM을 찾아서 그 부분만 새롭게 바꾸고 다시 렌더링함(화면 최신화)



비동기는 데이터가 날아와서 원하는 위치에 데이터를 바꿔주거나 추가. 그래서 새롭게 화면을 구성





# Connection Pulling

=> 이미 연결할 것 장치(?)들을 만들어놓고 DB와 연결하고 끊기만 함

DB 접근의 성능개선을 위해선 이부분을 건드려야하는것같다. 인터넷에서 찾아보자





# Servelt & JSP

Jsp(잡바 서버 페이지) => HTML 내에 자바 코드를 삽입하여 웹 서버에서 동적으로 웹페이지를 생성하여 웹 브라우저에 돌려주는 언어이다. Jsp는 실행시에 자바 서블릿으로 변환된 후 실행되므로 서블릿과 거의 유사하다.



jsp 의 선언 

- `<%! %>` => 안에 멤버변수와 method의 작성
- `<% %>` => 스크립트릿 서블릿으로 변환시 service()의 영역 request 와 response는 여기서 모두 해결해야한다.
- `<%= %>` => 데이터를 브라우저에 출력할때 사용



jsp의 기본 객체 영역

- pageContext : 하나의 페이지

- request : 다음의 페이지까지

- session : 전체 페이지(하나의 웹브라우저)

- application : 프로젝트 전체





# 정리

=hong&age=13

post
```html

<form action='min.jsp' method='post' >

<input type='text' name='name'/>

<input type='text' name='age'/>

</form>
```

hello.jsp 바디에

?name=hong&age=13

AJAX - callback

AJAX = Asynchronous JavaScript And XML.

AJAX is not a programming language.

AJAX just uses a combination of:

A browser built-in XMLHttpRequest object (to request data from a web server)

JavaScript and HTML DOM (to display or use the data)

동기보다 좋은점 - 

XMLHttpRequest -> jquery $.ajax $.get $.post

4 200 -> success: { } , fail: { }

404

500

float: left right

diplay inline block  none

​     a span input img- inline



## Stateless & statefull

Httpproticol은 대표적인 stateless 이다



## Cookie & Session

Cookie => 서버에서 사용자의 컴퓨터에 저장하는 정보파일 (서버에서 생성되어 사용자 컴퓨터에 저장한다.)

쿠키는 key와 value로 구성되고 String 형태로 이루어져있다.

브라우저마다 저장되는 쿠키는 다르다.



#### Cookie의 사용 목적

세션관리 : 사용자 아이디, 접속시간, 장바구니등 서버가 알아야 할 정보 저장

개인화 : 사용자마다 다르게 그 사람에 적절한 페이지를 보여줄 수 있다.

트래킹 : 사용자의 행동과 패턴을 분석하고 기록



### Cookie의 사용 예

- ID 저장(자동로그인)
- 일주일간 다시 보지 않기
- 최근 검색한 상품들을 광고 추천
- 쇼핑몰 장바구니(쿠키,세션,DB등등 다른 방법으로 만드는 곳도 있음)





### Cookie의 구성요소

- 이름 : 여러 개의 쿠키가 client 컴퓨터에 저장되므로 각 쿠키를 구별하는데 사용되는 이름
- 값 : 쿠키의 이름과 매핑되는 값
- 유효기간 : 쿠키의 유효기간
- 도메인 : 쿠키를 전송할 도메인
- 경로 : 쿠키를 전송할 요청 경로



### Cookie의 동작순서

- Client가 페이지를 요청
- WAS는 Cookie를 생성
- HTTP Header에 Cookie를 넣어 응답
- Browser는 넘겨받은 Cookie를 PC에 저장하고, 다시 WAS가 요청할 때 요청과 함께 Cookie를 전송
- Browser가 종료되어도 Cookie의 만료 기간이 남아 있다면 Client는 계속 보관.
- 동일 사이트 재방문시 Client PC에 해당 Cookie가 있는 경우, 요청 페이지와 함께 Cookie를 전송



### Cookie의 특징

- 이름, 값, 만료일, 경로 정보(Domain) 으로 구성되어 있다.
- 클라이언트에 총 300개 쿠키를 저장 가능
- 하나의 도메인당 20개의 쿠키를 가질 수 있다.
- 하나의 쿠키는 4KB까지 가능하다.





## JSTL & EL

#### EL

- JSP안에 있는 있는 java 언어들이 Tag로 다 변형된다. View를 위한 단이다보니 자바 언어가 많은 것 보다는 태그들로 표현하는게 좋다.

- EL 은 표현을 위한 언어, 스크립트의 표현식(`<%= %>`)을 대신하여 속성 값을 쉽게 출력하도록 고안된 언어이다.



#### EL에서 제공하는 기능

- JSP의 네가지 기본 객체가 제공하는 영역의 속성 사용(page, request, session, application 단의 사용되는 attribute들)
- 자바 클래스 메소드 호출 기능
- 표현 언어만의 기본 객체 제공
- 수치,관계,논리 연산 제공



#### JSTL(JSP Standard Tag Library)

자바서버 페이지 표준 태그 라이브러리, Java EE 기반의 웹 어플리케이션 개발 플랫폼을 위한 컴포넌트 모음. 





커넥션 풀링 - 미리 DB와의 연결을 해놓고 후에 요청했을때 바로바로 처리해주는 것.



redirect 와 forward

redirect : 직접 주소가 변경되면서 접근하게됨

forward : 주소가 변경되지않고 뷰(화면)만 변경된다.

