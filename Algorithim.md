# 나만의 알고리즘 정리하기

## 알고리즘 문제를 못풀었을 때 볼것

- [코딩테스트를 위한 tip]([https://github.com/JaeYeopHan/Interview_Question_for_Beginner/tree/master/Algorithm#%EC%BD%94%EB%94%A9-%ED%85%8C%EC%8A%A4%ED%8A%B8%EB%A5%BC-%EC%9C%84%ED%95%9C-tip](https://github.com/JaeYeopHan/Interview_Question_for_Beginner/tree/master/Algorithm#코딩-테스트를-위한-tip))
- 알고리즘은 책만으로 공부할 수 있는게 아니다
  - 강의 또는 지식 전달한 것을 듣고 공부했다고 착각하지 말자. 직접 코딩을 해서 본인것으로 만들어야 한다.
  - 내 실력에 맞는 문제를 풀자!
  - 너무 빠른 구글링은 실력을 낮출뿐. 구글링을 하더라도 이걸 어떻게 푸는것인지에 대한 이해가 중요하다.
  - 타인의 도움을 받아서 알게된 것은 완전히 내것은 아니다.(1번과 비슷) 완벽한 복기가 필요.

## 바로가기!

- [문자열](#문자열)
- [배열](#배열)
- [동적계획법](#동적계획법)
- [탐색](#탐색)



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
[출처](https://youtu.be/vYquumk4nWw?list=PLBZBJbE_rGRU5PrgZ9NBHJwcaZsNpf8yD)


- 피보나치 수열을 그냥 재귀로 풀게되면 시간이 꽤나 오래 걸린다 그걸 해결해보자!

<img src="images/스크린샷 2020-03-07 오후 5.54.20.png" alt="dynamic_1" style="zoom:80%;" />
> 그냥 재귀 함수로 구현시 같은 함수들을 몇번씩이나 호출하게 되는데 그때 마다 계산해주기 위해 많은 연산이 필요하게 된다.



- 위를 해결하기 위해 첫번째로 Memoized Solution을 사용한다. 배열을 사용한 해결법

> 후에 반복적이게 사용되는 함수들의 결과값을 처음 계산때 배열에 저장해 두는것이다.

- <img src="images/스크린샷 2020-03-07 오후 5.54.20.png" alt="dynamic_2" style="zoom:80%;" />>


> 보면 함수가 호출되기전에 먼저 배열을 하나 갖고 있고 그 배열의 값을 참조해서 문제를 해결했다. 시간이 O(2ⁿ) 에서 O(n)으로 엄청나게 줄어든 것을 볼 수 있다.



- 이것을 Bottom-Up Approach(상향식) 왼쪽에서 오른쪽으로 쭉 올라가면서 사용하기 때문에, 설명하자면 작은 값들을 차례대로 구하면서 큰값으로 가는 결과. 그래서 좀 더 정리해보면.
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



## 탐색

- ### 이진탐색(binarySearch)

  기본적으로 java에서는 이진탐색을 쉽게 도와주는 메소드 `Arrays.binarySearch(Object[], Object key)`메소드를 지원한다. 근데 이 메소드를 사용할 때 매개변수로 다양한 타입들이 들어갈 수 있다. 

  자연 정렬이 되는 int나 String 같은 경우 배열과 찾고자 하는 key 값으로만으로 해결할 수 있지만 자연 정렬이 되지 않는 객체타입 일 경우 어떻게 할 수 있을까? 

  바로 인터페이스 `Comparator<A>` 을 사용하는 것인데 이것을 중점으로 작성해보겠다.

- 전체 코드

```java
import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class PhysExamSearch {

	public static void main(String[] args) {
		Scanner stdIn = new Scanner(System.in);
		PhysData[] x = {
				new PhysData("이나영", 162, 0.3),
				new PhysData("원빈", 163, 2.0),
				new PhysData("잡스", 172, 1.3),
				new PhysData("강나영", 175, 0.8),
				new PhysData("고나영", 178, 3.3),
				new PhysData("민나영", 180, 2.3),
				new PhysData("수나영", 182, 1.7),
				new PhysData("박나영", 186, 0.9)
		};
		System.out.println("몇 cm 인 사람을 찾고 있나요? : ");
		int height = stdIn.nextInt();
		int idx = Arrays.binarySearch(x, new PhysData("", height, 0.0),PhysData.HEIGHT_ORDER);
		
		if(idx <0)
			System.out.println("없다");
		else {
			System.out.println("x[" + idx + "]에 있습니다.");
			System.out.println("찾은 데이터:" + x[idx]);
		}
		
		stdIn.close();

	}

	static class PhysData {
		private String name;
		private int height;
		private double vision;
        
		public PhysData(String name, int height, double vision) {
			super();
			this.name = name;
			this.height = height;
			this.vision = vision;
		}

		@Override
		public String toString() {
			return "PhysData [name=" + name + ", height=" + height + ", vision=" + vision + "]";
		}
		public static final Comparator<PhysData> HEIGHT_ORDER = new HeightOrderComparator();

		private static class HeightOrderComparator implements Comparator<PhysData> {
			@Override
			public int compare(PhysData d1, PhysData d2) {
				return (d1.height > d2.height) ? 1 : (d1.height < d2.height) ? -1 : 0;
			}
		}
	}
}
```

​	이 코드에서 중점이 되는 부분은 바로

```java
static class PhysData {
		private String name;
		private int height;
		private double vision;
    /*
    중략...
    */
		public static final Comparator<PhysData> HEIGHT_ORDER = new HeightOrderComparator();

		private static class HeightOrderComparator implements Comparator<PhysData> {
			@Override
			public int compare(PhysData d1, PhysData d2) {
				return (d1.height > d2.height) ? 1 : (d1.height < d2.height) ? -1 : 0;
			}
		}
	}
```

 	이 부분일 것 같다. `PhysData`라는 클래스 내부에 `Comparator`를 리턴해주는 `HEIGHT_ORDER` 를 지정하고 `HeightOrderComparator` 안에서 `compare()` 라는 어떻게 비교해 줄 것인지에 대한 것을 구현해서 후에 사용할때 넘겨주기만 하면 된다.



- 이 탐색에서 정렬부분 Compartor를 사용한 경우가 또 생겨서 정리해보려고 한다. [문제](https://www.acmicpc.net/problem/1931) 

```java
public class Problem1931 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int input_num = Integer.parseInt(br.readLine());
		ArrayList<Room> room = new ArrayList<>();
		int answer = 0;

		for (int i = 0; i < input_num; i++) {
			String[] input = br.readLine().split(" ");
			room.add(new Room(Integer.parseInt(input[0]), Integer.parseInt(input[1])));
		}
		Collections.sort(room, Room.ROOM_ORDER);

		Room tempRoom = room.get(0);
		answer++;
		for(int i = 1; i< room.size(); i++) {
			if(tempRoom.getEnd_t() <= room.get(i).getStart_t()) {
				tempRoom = room.get(i);
				answer++;
			}
		}
		System.out.println(answer);
	}

	static class Room {
		private int start_t;
		private int end_t;

		public int getStart_t() {
			return start_t;
		}

		public void setStart_t(int start_t) {
			this.start_t = start_t;
		}

		public int getEnd_t() {
			return end_t;
		}

		public void setEnd_t(int end_t) {
			this.end_t = end_t;
		}

		public Room(int s, int l) {
			this.start_t = s;
			this.end_t = l;
		}
		public static final Comparator<Room> ROOM_ORDER = new RoomOrderComparator();

		private static class RoomOrderComparator implements Comparator<Room> {

			@Override
			public int compare(Room o1, Room o2) {
				return o1.end_t > o2.end_t ? 1
						: o1.end_t < o2.end_t ? -1 : o1.start_t > o2.start_t ? 1 : o1.start_t < o2.start_t ? -1 : 0;
			}
		}
	}
}
```

- 처음 알고리즘을 풀면서 Comparator를 사용해본거라 좀 지저분하다.. compare 메소드를 오버라이딩 하면서 저렇게 하는게 맞는건지도 헷갈리지만.. 후에 좀더 알게되면 수정해보도록 해야겠다.
- 참고로 Arrays.sort() 함수는 기본적으로 오름차순의 정렬을 한다.

