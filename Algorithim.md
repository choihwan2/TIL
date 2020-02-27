# 나만의 알고리즘 정리하기

## 바로가기!

- [문자열](#문자열)
- 



## 문자열

- Java 에서 Scanner를 사용해서 문자인 Character형을 받을 수 없다. 그래서 이 방법을 주로 사용한다.

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

- Java 에서 Character 타입의 변수를 Int로 바꾼다면 ASCII코드로 값을 구하거나 해줘야한다 그렇지 않기 위해 메소드를 사용해보자 (`Character.getNumericValue`를 사용해보자!)

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

