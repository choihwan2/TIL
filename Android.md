# Android



1. 과정 목적

- 안드로이드를 구성하고 있는 주요 component

Activity Service Broadcast Receiver Content Provider



## Android의 정의

=> 안드로이드 안에는 OS(Linux Kernel) + 미들웨어 + 핵심 어플리케이션(ex: 전화, 갤러리, 카메라, 브라우저,..)

​     이런것들이 포함되어 있는 모바일 디바이스를 위한 소프트웨어 스택(계층구조로 쌓여있음) 

​	 하단에는 OS -> 미들웨어 -> 프레임워크 -> 어플리케이션



## Android의 특징

=> 오픈 소스 : 안드로이드 소스코드가 모든 개발자에게 개방

=> 자바언어로 개발 : 자바언오아 코틀린 언어로 개발

=> 앱간의 자유로운 연동

=> ART Runtime 이 탑재되어 사용함. 성능 좋음:+1:





## Android가 빠르게 시장점유율을 높이는 이유

=> 오픈 소스

=> Eco System 이 잘 되어있어요! (서로간의 시스템이 잘 연결되어있어서  서로의 이익을 창출)





## Android는 Framework

- Library vs Framework
- 라이브러리는 특정 기능을 쉽고 편하게 구현할 수 있다.  => 프로그램을 쉽게 만들어줌. (ex: json 을 쓰기위한 잭슨 라이브러리?) 하지만 결과적으로 유지보수가 어렵다.
- Framework 을 이해해야지 뭔가 만들 수 있음. 이 자체가 시간이 많이듬. 하지만 체계적인 틀이 잡혀있어서 유지보수가 편함. 

=> 안드로이드는 프레임워크들로 구성되어있는 플랫폼이다 그러니!! 프레임워크에 대한 제대로된 이해가 필요하다!



## Android를 구성하는 Component

4가지 주요 Component에 대해서 알아야한다!

1. Activity : Android App의 화면 1개, UI를 담당하는 Component, 사용자의 Event 처리를 담당 (오래걸리는 로직이나 과부화가 일어날수 있는 것들은 여기서 처리하면 안된다.)

   [Activity Lifecycle](https://starryz.tistory.com/2?category=853011)

   

2. Service : 내부 로직처리를 담당. 데이터베이스 연결, 네트워크 연결 처리, 사용자와의 interaction 은 담당하지 않는다. 일반적으로 background 에서 로직처리를 담당한다.

3. Broadcast Recevier : 안드로이드 시스템에서 발생되는 여러가지 broadcast(신호)를 받아서 적절한 처리를 하는 componet ex: 배터리가 없다는 신호를 잡아서 화면에 보여줘!의 신호를 송신함.

4. Content Provider & Resolver : 모든 안드로이드 앱은 SandBox Mode(하나의 앱이 독립적으로 사용됨.즉 다른앱이 나의 데이터에 들어오거나 할수 없는 것들l 을 이용. 한 앱이 사용하고 있는 데이터를 다른 앱으로 데이터 공유가 가능케하는것. 



## Android

Package를 유니크하게 만든다.



## Context

진짜 계속해서 봐도 이 context 개념이 머리에 잡히질 않는다.. 보다가 잘 정리된다면 수정 예정이다. 

[링크](https://starryz.tistory.com/4?category=853011) <- 제일 잘 정리되어있는 것 같다. 잘 모르겠으면 차근차근 한번씩 더 봐보자.

Context는 '상태' 라는 말과 제일 가까운 것 같다.





## Flag
- 안드로이드에서 자주 쓰는 플래그 세 개와 addFlag와 SetFlag의 차이점! [출처](https://stickyny.tistory.com/109)
- ![스크린샷 2020-03-31 오후 6.28.22](images/스크린샷 2020-03-31 오후 6.28.22.png)

