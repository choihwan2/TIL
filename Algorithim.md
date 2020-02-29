# 나만의 알고리즘 정리하기

## 바로가기!

- [문자열](#문자열)
- [배열](#배열)



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

