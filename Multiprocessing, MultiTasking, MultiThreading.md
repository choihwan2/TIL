- Multiprocessing

  => Task 를 실행하는 core(processor) 가 2개 이상인 경우

- MultiTasking

  => 하나의 core 가 시분할(time slicing) 기법을 이용해서 여러개의 Task 를 마치 동시에 수행되는 것처럼 보이게 하는것.

- MultiThreading

  => 하나의 프로그램을 다중으로 분할하여 작업하는 것. 쓰레드 뮤텍스 세마포어 등등.

  => 하나의 Task 를 여러개의 sub Task 로 분할해서 동시간대에, 혹은 마치 동시간에 실행 되는 것처럼 만드는 기법. Thread 를 독립적인 실행 흐름 이라고 말하기도 한다. 