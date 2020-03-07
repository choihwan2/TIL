# 나만의 알고리즘 정리하기

## 바로가기!

- [문자열](#문자열)
- [배열](#배열)
- [동적계획법](#동적계획법)



## 문자열

- java 에서 Scanner를 사용해서 문자인 Character형을 받을 수 없다. 그래서 이 방법을 주로 사용한다.

```java
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
      Scanner scanner = new Scanner(System.in);
      String str = scanner.next();
      char c = str.charAt(0);
	}
}
```



- java 에서 Character 타입의 변수를 Int로 바꾼다면 ASCII코드로 값을 구하거나 해줘야한다 그렇지 않기 위해 메소드를 사용해보자 (`Character.getNumericValue`를 사용해보자!)

```java
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
				Scanner scanner = new Scanner(System.in);
        scanner.nextLine();
        Character.getNumericValue(str.charAt(0));
        scanner.close();
	}
}
```



- java 에서 문자열 타입을 쪼개서 사용할때 유용한 함수인 `StringTokenizer`를 알아보자!

```java
package backjoon.algorithim.string;

import java.util.Scanner;
import java.util.StringTokenizer;

//백준 문제 1152를 참고했다. 문제는 몇개의 문자로 구성되어있는지 찾아내는것 앞뒤에 공백을 들어갈수도 있어서 
//String클래스 안에있는 것으로만 해결하려면 꽤 귀찮아진다. 하지만 StringTokenizer를 사용하면..? 한방해결.
public class Problem1152 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String str = scanner.nextLine();
		StringTokenizer stz = new StringTokenizer(str);
		System.out.print(stz.countTokens());
	}
}

```

> 제공되는 클래스들을 너무 많이 사용하면 좋지 않은 문제들도 있지만.. 이건 너무 유용할것같다. 시간단축 + 유용성 클래스명이 꽤 긴편이니 잘 외워서 사용하자. stz.nextToken() 으로 분리된 String을 표현 할 수도 있음!



- java에서 문자열 변수를 많이 바꿔주는 상황이 발생하면 꼭 `StringBuilder` 혹은 `StringBuffer` 클래스를 잘 활용하도록 하자.

```java
import java.util.Scanner;

public class Problem2908 {
	public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        String a,b;
        a = scanner.next();
        b = scanner.next();
        StringBuilder str = new StringBuilder();
        StringBuilder str2 = new StringBuilder();
        for(int i=0; i<a.length(); i++){
            str.append(a.charAt(a.length()-i-1));
          //그냥 String에 += 해준다면 한번할때마다 새로운 String을 만들게 된다.
        }
        for(int i=0; i<b.length(); i++){
            str2.append(b.charAt(b.length()-i-1));
        }
        a = str.toString();
    //다시 String에 할당해 줄때는 toString()메소드를 활용!
        b = str2.toString();
        System.out.println(Math.max(Integer.parseInt(a),Integer.parseInt(b)));
        scanner.close();
    }
}
```



## 배열

- java에서 배열을 만든 후 하나의 값으로 초기화 하는법을 배워보자

```java
import java.util.Scanner;
import java.util.Arrays;

public class Main{
  public static void main(String[] args){
    int[] a = new int[26];
    Arrays.fill(a, 3);
    System.out.println(Arrays.toString(a));
    /*[3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]*/
  }
}
```

> Arrays 클래스를 사용하기 위해서는 import 해줘야 하는것을 잊지말자! 그리고 fill 함수는 안에 범위를 지정해줄수도 있다.



## 동적계획법

- 피보나치 수열을 그냥 재귀로 풀게되면 시간ㅇ니 꽤나 오래 걸린다 그걸 해결해보자!

<img src="images/스크린샷 2020-03-07 오후 5.54.20.png" alt="dynamic_1" style="zoom:80%;" />
[출처](https://youtu.be/vYquumk4nWw?list=PLBZBJbE_rGRU5PrgZ9NBHJwcaZsNpf8yD)

> 그냥 재귀 함수로 구현시 같은 함수들을 몇번씩이나 호출하게 되는데 그때 마다 계산해주기 위해 많은 연산이 필요하게 된다.

- 위를 해결하기 위해 첫번째로 Memoized Solution을 사용한다. 배열을 사용한 해결법
<img src="images/스크린샷 2020-03-07 오후 5.54.20.png" alt="dynamic_2" style="zoom:80%;" />


> 보면 함수가 호출되기전에 먼저 배열을 하나 갖고 있고 그 배열의 값을 참조해서 문제를 해결했다. 시간이 O(2ⁿ) 에서 O(n)으로 엄청나게 줄어든 것을 볼 수 있다.

- 이것을 Bottom-Up Approach 왼쪽에서 오른쪽으로 쭉 올라가면서 사용하기 때문에 이렇게 부르는(맞나?) 것 같다. 그래서 좀 더 정리해보면.
<img src="images/스크린샷 2020-03-07 오후 6.01.38.png" alt="dynamic_3" style="zoom:80%;" />

> 시간 계산 자체는 O(n)으로 동일하겠지만 그전에 배열을 선언해서 갖고있던 메모리 낭비와는 다르게 한번 사용후 버려지는 효율점이 있지 않을까 생각한다.



- 그렇게 해서 풀게 된 Programmer의 [연습문제](https://programmers.co.kr/learn/courses/30/lessons/12945)이다. 

<img src="images/스크린샷 2020-03-07 오후 6.16.25.png" alt="dynamic_problem" style="zoom:50%;" />

```java
class Solution {
  public int solution(int n) {
      int answer = 0;
      answer = f(n);
      return answer;
  }
    
    public static int f(int n){
        int[] fib_arr = new int[n+2];
        int answer = 0;
        fib_arr[0] = 0;
        fib_arr[1] = 1;
        if (n == 0 || n== 1)
            return fib_arr[n];
        for(int i = 2; i<=n; i++){
            fib_arr[i] = (fib_arr[i-2] + fib_arr[i-1]) % 1234567;
        }
        return fib_arr[n];
    }
}
```

