1. Mysql Database 가동

=> bin 폴더에서 mysqld



2. Mysql Database 종료

=> bin 폴더에서 mysqladmin -u root shutdown



3. Tomcat 설치



Round trip



Web 에서 동작하는 Java Program => Servelt



url mapping : 지금 만들고 있는 웹 프로그램(Servlet) 을 클라이언트가 웹 상에서 지칭하기 위해 사용하는 논리적인 이름 url mapping은 "/" 로 시작해요!! => /searchTitle



Servlet code가 자동으로 생성되요!

이 Servlet을 web에서 호출하는 방식은 크게 2가지 있어요 GET POST

=> GET 방식 호출의 특징 : 프로그램에게 데이터를 전달하기 위해서 URL 을 이용, 편하게 사용이 가능하고 전달하는 데이터의 크기의 한계가 있다. 그리고 보안성이 없다. 

=> POST 방식 호출의 특징 : protocol의 head안에 전달하는 데이터가 포함되어 전달된다.(눈에 보이지 않음) 전달하는 데이터의 크기에 제한이 없다. 보안성이 상대적으로 있다. 

=> 우리는 GET 방식을 이용해서 Servlet 을 호출한다!

