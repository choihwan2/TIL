# TIL(Today I Learned)

> 오늘 배운 내용을 정리하자

## [JAVA](./java)

### import

package import 할때 가능하면 *보다는 하나하나 하자. 이유는 static 한 애들이 다 메모리에 들어가기 때문에.



### String

`String s3 = "java"` 라고 할시에 `"java"`라는 문자열이 코드폰? 이라는 힙과 다른 영역에 생성됨. 그다음 `s3`는 그 주소를 가르킨다.

`String s4 = "java"` 라고 할시에도 `"java"`를 가르키고 같은 주소를 가르키기 때문에 `s3 == s4` 가 `true` 가 나오는것이다.

`String` 은 기본형처럼 사용이 가능한 세미타입이라고 보는 것이 편함. 이뮤터블 객체. 즉, 불변의 객체이다. `toUppercase` 같은 경우도 

자체 주소에 가지고있는 데이터는 그대로지만 가지고 와서 대문자로 바꾼것을 보여준다. 

`s1 = s1.toUperCase` 같은 경우도 새로운 주소, heap에 새로운 대문자로 바꾼 문자열을 가진 객체를 만들어 가르킨다.

> String 객체가 불변객체(Immutable)인 이유
> 이쯤 되면 왜 String은 불변성을 가지게 설계되었는지 궁금할 수 있습니다. 앞서 설명했듯이 String은 가장 많이 사용되는 데이터 타입 중 하나입니다. 
> 그렇다는 말은 Java 어플리케이션에서 String 타입의 객체들이 가장 많은 메모리를 차지한다는 말이기도 합니다.
> Java 언어의 창시자인 제임스 고슬링 형님(?)께서는 문자열 객체는 재사용 될 가능성이 높기에 같은 값일 경우 
> 어플리케이션 당 하나의 String 객체만을 생성해두어 JVM의 힙(heap)을 절약하고자 했습니다.

### 비트연산자

`1 & 4 = 0` 같은곳에 있으면 1 나옴 아니면 0 즉, 0001 & 0100 => 0000
`1 | 4 = 5` 하나만 있어도 1  0001 | 0100 => 0101
`1 ^ 4  = 5 `달라야지 1이 나옴 0001 ^ 0100 => 0101



### switch 와 if

`swith` 문과` if `문 => if 다섯개 이상? 정도 될때는 `switch` 를 쓰자 `switch` 를 쓰려면 내부적으로 따로 환경을 구성하다보니 조금 더 오래 걸릴수도있음
가독성이 좋음.

`break` 라벨 씌워진 반복문을 탈출할 수 있다.

### super 와 this (feat. 다형성)

모든 객체의 생성자에서는 부모 객체의 생성자를 들렸다 온다

`super`로 즉 `Object` 클래스의 생성자를 들렸다가 와서 생성됨.

생성자함수는 무조건 부모생성자 함수를 들렸다가 옴. `super`가 없으면 생략 되어있는것.

부모를 갖고 있으면 부모를 먼저 메모리 상단에 얹어지고 그다음 레퍼런스 `object.` 을 하게 되면 밑으로 부터 올라감 같은 변수의 부모에 있는것을

사용하고 싶으면 `super`를 사용, 

```java
class A{
    public String x(){return "A.x";}
}
class B extends A{
    public String x(){return "B.x";}
    public String y(){return "y";}
}
public class PolymorphismDemo1 {
    public static void main(String[] args) {
        A obj = new B();
        System.out.println(obj.x());
    }
}
```



클래스 B의 데이터 타입을 클래스 A로 인스턴스화 했을 때 클래스 B의 메소드 y는 마치 존재하지 않는 것처럼 실행되지 않았다.

 => 클래스 B가 클래스 A화 되었다.



클래스 B의 데이터 타입을 클래스 A로해서 인스턴스화 했을 때 클래스 B의 메소드 x를 실행하면 

클래스 A에서 정의된 메소드가 아니라 클래스 B에서 정의된 메소드가 실행 되었다. 

=> 클래스 B의 기본적인 성질은 그대로 간직하고 있다.



`this.kind` 인 `this`를 사용했을때 그 영역내에 변수가 없다면 부모의 클래스로 넘어가서 찾아봅니다.

> tip: static 영역에서는 this를 사용할 수 없음. + super도



### 오버로딩 vs 오버라이딩

**오버로딩 = 같은 클래스내에서 같은 이름의 메소드가 매개변수와 자료형이 다른것.**

**오버라이딩 = 부모로 부터 상속받은 메소드를 자식에 맞게 재구현 하는것!**



> tip: proected => 상속관계면 가능!
>
> is a 관계와 has a 관계 -> 상속이거나 그안에서 객체 생성을 하는것.
>



### abstract class 

`abstract class` 상속을 전제로 하여 짜여진 코드. 다른 클래스에서 상속을 받게되면 무조건 비어있는 `abstract` 클래스를 구현해야함.



> tip: 무언가 클래스를 설계할때는 `Object` 에 있는 `toString` 과 `equals` 를 적합하게 바꾸는것이 클래스 설계의 기초이다.

### interface

안에서 추상클래스로 이루어져 있거나 static 한 상수만 존재 가능.

implements 를 사용하여 클래스에서 추상메소드 구현을 강제하는 약속을 담당한다.



```java
public class Interface {
	public static void main(String[] args) {
		T[] t = {new Circle_8(), new Rectangle_8()};
	}
}
interface T extends Drawable,Moveable{
}

interface Drawable {
	void draw();
}

interface Moveable {
	void move();
}

class Circle_8 implements T{
	String name = "Circle";
	@Override
	public void move() {}
	@Override
	public void draw() {}
}

class Rectangle_8 implements T{
	String name = "Rectangle";
	@Override
	public void draw() {
		// TODO Auto-generated method stub	
	}
	@Override
	public void move() {
		// TODO Auto-generated method stub
	}
}
```



인터페이스는 메모리 힙 영역에 올라가지 않는다. 이름규칙은 ~~able로 하는 것이 좋으며

인터페이스는 인터페이스끼리 다중상속이 가능하다. 

> tip: 후에 인터페이스 내부의 클래스 추가를 하기 위해서 default 연산자를 사용하여 추가도 가능! 

### Lamda식

```java
public class SelfTest {
	public static void main(String[] args) {
		String namestString = "hwan";
		Lamdable lamdable = name -> {
			System.out.println("chapchap");
			System.out.println(name);
		};
		lamdable.lam(namestString);
	}
}

interface Lamdable {
	void lam(String name);
}
```



이너클래스일 경우 폴더에서 class A{ class B } => A$B 라고 표현이 됩니다.

인터페이스 안의 추상메소드가 하나일때는 람다식으로 표현할 수 있음. 

인터넷의 좀더 많은 예제를 통하여 공부하자.



### try 와 catch

try() => 괄호안으로 반납해야 하는 자원을 넣어주면 자동으로 반납해줌. finall 안에 반납안해줘도 됨.



Clinet 에게 에러 메시지를 보여주거나 할때 main에서 보여줌. 메소드 안에서 try catch를 해결한다면 서버에서 해결하는것과 비슷.



```java
public class TryAndCatch {
	public static void main(String[] args) {
		System.out.println("start");
		String msg = "-5";
		int num = 0;
		int res = 0;
		try {
			num = Integer.parseInt(msg);
			res = 1000 / num;
			int[] number = new int[num];
		} catch (NumberFormatException e) {
			System.err.println("숫자로 바꿀수 있는 문자열을 입력하세요");
		} catch (ArithmeticException e) {
			System.out.println("0으로는 나눌수 없습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		
		} finally {
			System.out.println("무조건 들어오는 곳이라 자원반납. 항상수행됨.");
		}
	}
}
```





**stack = LIFO** 라스티인퍼스트 아웃. 

**queue = FIFO** 퍼스트인 퍼스트 아웃



### Java의 콜렉션

Set = *중복없이* 순서없이 객체를 삽입. = 주머니에 데이터를 본다고 생각하면됨. 

들어간 순서대로 데이터가 다시 나올 보장이없음.



LinkedList => 장점 : 삽입과 삭제가 쉬움 단점: 걍 확인이 느림. 엑세스 속도가 느림. 

노드기반 = 자료와 다음 주소를 가르키는 꼬리가 있음.



Map = key 와 value => key는 중복되지않는다. 지도에서 좌표를 찾아가면 진짜 땅이 있는걸로 기억합시다. 내부적으로 키값을 찾아서 해당하는 벨류를 찾는것이 매우 빠름. 



### SingleTone패턴

```java
class SingleTone {

	private static SingleTone s;

	private SingleTone() { // 여기 클래스 안에서만 생성함.

	}
	public static SingleTone getInstance() {
		if (s == null)
			s = new SingleTone();
		return s;
	}
}
```

**한번의 객체 생성만 되어 메모리에 올라간다.** 

구글링해보니 후에 문제가 발생할 수도 있다는데 그때 다시 돌아오도록 하자.

## 기타

* [Git](https://github.com/choihwan2)
* Markdown



