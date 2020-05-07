# Java thread

자바에서 thread 에 대해 알게된 내용과 구현을 정리 해보겠다.



## Thread?

Java 에서 thread를 구현하기에 앞서서 개념이 헷갈린다? 먼저 이 [글](https://donghoson.tistory.com/8?category=799810)을 읽고 오도록하자!



- 독립적인 실행 흐름

  - Thread class 를 직접 상속해서 작성
  - Runnable Interface 구현한 객체를 이요해서 Thread 를 생성(요걸로 안드로이드에서 많이 사용)

  





java 에서 A 라는 Thread 를 생성하면 A의 상태는 new 상태

=> A.start() 할시 A의 상태는 runnable 상태로 변환된다. (실행이 되는것이 아님. 실행 가능한 상태로 스케쥴링을 기다림.)

=> 그러면 JVM 안에 있는 스케쥴러가 임의로 쓰레드를 실행시킨다. (이건 프로그래머가 제어하기 힘듬)



# 동기화처리 (Synchronization)

하나의 자원을 여러 Thread가 사용하려고 할때, 한 시점에 하나의 Thread 만 사용 할 수 있도록 하는 것을 의미!

객체(공유객체, instance) 에 Thread가 접근하는 것을 제어하기 위해서 Moniter 라는 개념을 이용. 공유 객체는 각자의 Monitor 를 하나씩 가지고 있어요!

Thread 가 공유객체의 Monitor 를 획득하려면??

==> synchronized keyword 를 이용해서 처리합니다!  Sleep 같은 경우는 blocked 되고 runnable 로 돌아가 순서를 기다리지만 monitor 같은 경우 locking 이 걸린후 다른 thread가 moniter 사용후 dead상태가 되어 monitor 를 사용 가능하면 runnable 로 가지 않고 바로 실행이 됨.