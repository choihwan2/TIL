# MMM



## Multiprocessing

=> Task 를 실행하는 core(processor) 가 2개 이상인 경우 즉, 여러개의 프로세서(CPU)가 서로 협력적으로 일을 처리하는 것이다. 

장점 : 여러개의 단일 프로세싱보다 비용이 절감된다. 한개의 프로세서가 고장난다 하더라도 시스템이 정지하는 것이 아닌, 속도만 늦춰지게 만들 수 있다 = 신뢰성 증가.

종류 : 대칭형 멀티 프로세싱(SMP, Symmetric multi-processing, 대칭형 다중 처리) 과 비대칭형 멀티 프로세싱(AMP, Asymmetric multi-processing, 비대칭형 다중 처리) 가 있다.



[참고](https://donghoson.tistory.com/15?category=799810)



## MultiTasking

=> 하나의 프로세서가 운영체제의 스케쥴링 방식에 따라서 Task 를 마치 동시에 수행되는 것처럼 보이게 하는것.즉, 컴퓨터로 워드를 하면서 음악감상을 하거나 검색을 하는 것.

멀티 태스킹은 크게 비선점형과 선점형 방식으로 나뉜다. 

프로그램이 실행된다면, 프로세스가 되고 프로세스는 여러 개의 쓰레드를 실행한다. 쓰레드들은 CPU의 한정적인 자원을 갖기 위해 경쟁하고 운영체제가 돌아가며 실행할 수 있게 한다. 이때, CPU를 차지하고 있는 쓰레드가 자신의 작업이 끝날을 때만 운영체제가 이를 회수 할수 있는 것을 비선점형(non-preemptive) 방식이다. 반대로 운영체제가 강제로 회수할 수 있는 것은? 당연히 선점형 (preemptive) 방식이 된다. 대부분의 OS는 선점형인데 그 이유는? 당연하다.. 어떤 프로그램이 CPU 독차지하고 있다면?? 멀티 태스킹이 잘 이루어지지 않기 때문이다. 

> 스케쥴링 방법 : Multiprogramming, Time-slicing(시분할), Real-time(실시간 시스템) 방법들이 있다.



[참고](https://donghoson.tistory.com/16?category=799810)



## MultiThreading

=> 하나의 프로그램을 다중으로 분할하여 작업하는 것.

=> 하나의 Task 를 여러개의 sub Task 로 분할해서 동시간대에, 혹은 마치 동시간에 실행 되는 것처럼 만드는 기법. Thread 를 독립적인 실행 흐름 이라고 말하기도 한다. 

### 참고

- [링크](https://donghoson.tistory.com/8)

