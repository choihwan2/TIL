# R

- <h4>R은 통계계산을 위해서 만들어지 프로그래밍 언어이면서 소프트웨어</h4>

> 어떻게 하면 통계적 지식이 별로 없이 데이터 분석을 잘 할 수 있을까? *통계가 아예 필요없는건 아니다.



### R로 무엇을 할 수 있을까?

- 통계분석 : 기초 통계, 가설검정
- 머신러닝 
- 텍스트 마이닝
- 그외 등등..

> 여기에 적혀있는 것들을 한번 더 찾아서 공부해보자!





<h4><i>그렇다면 데이터 분석을 하기 위해서 R이 최선일까??</i></h4>
-> <b>NO!</b> SAS ,SPSS라는 것들도 있음 하지만 유로툴이고 통계 전문가들이 사용할 때 편의 일반인들이 사용하기 난이도가 너무 높다.

Excel 도 있다. 기본적인 통계기능을 포함한다. 

그래서 일반적으로 R을 많이 사용한다. 무료고 유료툴에 버금가는 기능! + 코드 베이스(재연성을 보장한다.)

> 재연성이란? => 코드를 써놓으면 고대로~ 나오는 것. printf("Hello Wolrd!") => Hello World! 출력



<b>이제 R을 시작해보자!</b>



## 설치

- R 설치

  [CRAN](https://cran.r-project.org/) 여기로 들어가서 다운을 받아보자!

- IDE 인 R Studio 를 설치해보자

  [링크](https://rstudio.com/products/rstudio/download/#download) 들어가서 OS에 맞는걸 선택하자.



## 설정

R Studio 의 들어가서 Tools- Global Setting 을 해보자.

Code 의 Soft-wrap 체크 , Saving에서 문자를 UTF-8 로 변경



## R의 기본

####  주석과 변수 선언

```R
# R의 주석은 #을 이용한다.

# Ctrl + Shift + C 여러줄 주석
# 한 라인에 하나의 statement만 존재한다면 ; 생략가능!
# 작성된 코드를 실행하려면 ctrl + enter
# case-sensitive(대소문자를 구별합니다.)
# camel-case notaion 을 사용하자.
# 변수 선언과 사칙연산
# weak type 언어라 => 변수 선언시 type을 명시하지 않는다.


a = 100 #이것도 가능하지만
a <- 300 #R에서는 이게 기본이다.
200 -> a #이것도 가능..
```



#### 사칙연산과 출력

```R

# data type(자료형) , data structure(자료구조)
# vector : 1차원, 같은 데이터 타입만 사용할 수 있음.
# vecotr 중에 원소가 1개만 있는 vector => scalar

myvar <- 300 #vector 이면서 scalar 지만 scalar 라고 부르자.
result = myvar - 200;

result
#[1] 100 이라는 값이 나온다.
# R은 index 가 0이 아니라 1부터 시작한다.

#print라는 함수로는 하나의 값만이 출력가능하다.
print(result)

#두개 이상의 값 출력에는 cat을 사용하자! (linux?)
cat(result,myvar)

#경로안의 파일에 가서 값을 입력하고 싶을때. 기존의 내용에다가 덮어씀..
cat("결과값은 : ", result, myvar, file="C:/R_workspace/R_lecture/test.txt")

#그렇다면 추가하고싶다면? append =TRUE 를 붙여보자. append =T 도 가능.
cat("결과값은 : ", result, myvar, file="C:/R_workspace/R_lecture/test.txt",append=TRUE)


# 기본적인 연산자는 다른 언어와 상당히 유사
var1 <- 100
var2 <- 3

result <- var1 / var2

result # 33.33333 (총 7개의 digits로 표현 - default 가 7개 로 정해져있는 것이다.)
options(digits = 5) # 옵션 변경또한 가능.
result # 33.333

# c와 java 처리 format 을 이용한 출력도 가능
sprintf("%.8f", result)

result = var1 %/% var2 # 몫을 구할때 사용
result # 33

result = var1 %% var2 # 나머지를 구할때 사용
result # 1
```



#### 비교 연산과 논리연산

```R
#비교 연산 => 다른 언어와 같습니다
var1 = 100
var2 = 200

var1 == var2
var1 != var2

# 논리 연산 => 약간의 주의 필요

# &, && => 의미는 같다.
# |, || => 의미는 같다.
#하나짜리와 두개짜라는 vector 인지 scalar 인지에 따라서 동작이 달라집니다.

#combine 함수를 이용해서 vector 를 생성 = > c()
c(TRUE,FALSE) & c(TRUE,FALSE) # &이면 앞에 것 한번 뒤에것 한번 즉 벡터화 연산을 수행한다.


#&&를 이용하면 맨 처음에 있는 요소를 가지고 연산
c(TRUE,FALSE) && c(TRUE,FALSE)
```

> & 와 && | 과 || 을 잘 생각해보자



## R의 데이터 타입

#### R의 기본적인 데이터 타입

1. **`numeric`** : 수치형 데이터 타입으로 정수와 실수를 구분하지 않는다.

```R
# 100, 100.3 (둘다 실수) 10L(정수)
```

2. **`character`** : 문자형 데이터로 R에서는 하나의 문자, 문자열 둘 다 문자열로 간주되고 `' '` ,`" "` 을 혼용해서 사용이 가능하다.

3. **`logical`** : 논리형 데이터로 `TRUE` 와 `FALSE` 를 갖는다. 다 대문자로 써야 하고 줄여서 `T` `F` 로도 표현이 가능하다.

4. **`complex`**: 복소수형 데이터 타입으로 현실 수학 세계에서 `i` 를 의미하는 것 같다. 아직 내 레벨에서는 많은 사용은 없을 것 같음.



#### R의 특수한 데이터 타입

1. **`NULL`**: 가르키는 객체가 없다. (java와 유사한 형태)
2. **`NA`**: Not Available, 유효하지 않다. 일반적으로 결측치(ex: 센서에서 값을 가져오다가 날아가는 경우)를 표현할 때 사용한다.
3. **`NAN`**: Not A Number, 수치 값이지만 숫자로 표현이 안되는 값.

```R
sqrt(-9) # NaN
```

4. **`Inf`** : 양의 무한대를 뜻한다.

```R
3/0 # Inf
```



#### R에서 사용하는 기본적인 함수 2개

- **mode** : 해당 데이터의 타입을 알려준다.
- **is**: 어떤 계열의 함수가 맞는지 확인할 수 있다.

```R
var1 <- 200
mode(var1) # "numeric"

# is 계열의 함수
is.numeric(var1) #TRUE
```



#### R에서 데이터 타입의 입력 우선순위

- R에서 데이터 타입 입력의 우선순위는

  `character > complex > numberic > logical` 이 순서이다.

```R
#기본적으로 사용되는 자료구조가 vector
myvar = c(10,20,30,40)
myvar # 10 20 30 40

myvar = c(10,20,30,FALSE)
myvar # 10 20 30 0

myvar = c(10,"뿡",30,FALSE)
myvar # "10" "뿡" "30" "FALSE"

#as 계열의 함수를 이용한 casting(형변환)
myvar = "100"
as.numeric(myvar) # 100
```



## R Package

- R의 package는 처리할 Data + 기능(함수, 알고리즘) 들을 담고있는 집합이라고 볼 수 있다. R의 package 시스템은 크게 보면 두 가지인 `base System` 과 `other package`로 나뉜다고 볼 수 있다.

```R

# R package

# R의 package는 처리할 Data + 기능(함수, 알고리즘) 
# R의 package 시스템은
# 1. base System (기본적으로 R설치시 따라오는것)
#   - base package (리얼 기본)
#   - recommended package (자주 사용하는 애들)
# 2. other package(그 외의 모든것.) 로 구성된다.

# 간단하게 package를 하나 설치해 보아요!
install.packages("ggplot2")

# package 삭제하려면
# remove.packages("ggplot2")

# 어디에 설치 되었는지 확인해 보자
.libPaths()

# 경로를 바꾸려면?
.libPaths("C:/myLib")

#이렇게 package를 설치한 후 사용을 하기이해서는
# 메모리에 loading 을 해야해요!
library(ggplot2)
require(ggplot2)

myvar = c("남자","여자","여자","여자","여자","남자")

qplot(myvar) #R studio 에서 실행시 막대 그래프로 남자 여자 의 수가 나온다.
```



- **help** : 함수가 어떤 기능인지 알려주는 함수이다.

```R
# mean 이라는 함수가 가지고 있는 기능을 도움말로 알려준다.
help(mean)
# help()를 이용해도 좋으나 RDcoumentation.org 사이트를 이용하는게 더 좋아보인다!

```



## R의 자료구조

- 자료형은 저장된 데이터의 타입을 지칭한다면 자료구조는 **데이터가 메모리에 어떤 방식으로 저장되어 있는가**를 뜻한다고 볼 수 있다. 먼저 간단하게 R의 자료구조를 살펴보고 하나씩 세부적으로 알아보자.



#### homogenous(동질)

1. **vector** : 1차원 선형구조로 순서 개념이 존재한다. 같은 종류의 데이터 타입을 이용한다.
2. **metrix** : 2차원 구조로 인덱스를 사용할 수 있다. 같은 종류의 데이터 타입을 이용한다.
3.  **array** : 3차원 이상의 구조로 인덱스를 사용할 수 있고 같은 종류의 데이터 타입을 이용한다.



#### hetrogeneous(다른 종류)

1. **list** : 1차원 선형 구조로 순서개념이 존재하고 실제 저장되는 구조는 map(key,value)의 구조이다.
2. **data frame** : 2차원 테이블 구조로 데이터베이스에서 보던 형태와 매우 유사하다.



![r_datastructure](images/r_datastructure.jpg)



## Vector

- 1차원 선형자료 구조로 순서의 개념이 있다. index를 이용하여 vector를 사용 할 수도 있고 index의 시작은 1이다. `[]`이용해서 각 요소를 접근할 수도 있다. 요소가 1개인 vector 는 scalar라고 부른다.

#### vector를 만드는 방법

- **combine**

```R
# 1. combine() 함수를 이용하기 => c()
#    vector를 만드는 가장 대표적인 방법이다.
#    2개 이상의 vector 를 하나의 vector로 만들때도 사용할 수 있다!
myVar1 = c(10,20,30)
myVar2 = c(3.14,10,100) 

myVar1
myVar2 #3.14 10.00 100.00 형태를 같게 만들어준다

result <- c(myVar1,myVar2) #합치기!
```



- **`:`**
```R
# 2. ":" 을 이용해서 만들수 있다!
#     수치형 데이터에만 사용할 수 있고
#     단조증가,단조감소 형태의 vector를 생성
myVar = 1:10
myVar # 1 2 3 4 5 6 7 8 9 10
myVar = 8.7 : 2
myVar # 8.7 7.7 6.7 5.7 4.7 3.7 2.7

# 3. 2번의 일반형
myVar = seq(1,10,2)
myVar # 1 3 5 7 9

myVar = seq(from = 10, to = 3, by = -3); #가능하면 이렇게 사용
myVar # 10 7 4
```



- 반복적인 값을 이용한 vector 생성
```R
# 4. 반복적인 값을 이용해서 vector 생성
#     rep()
myVar = rep(1:3, times =3)
myVar # 1 2 3 1 2 3 1 2 3

myVar = rep(1:3, each=3)
myVar # 1 1 1 2 2 2 3 3 3
```




- 요소의 길이 알아내기
```R
# vector안의 요소 개수를 알아 내는 함수
length(myVar)
```



- vector 요소의 사용
```R
# vector 요소의 사용(indexing 방식)
myVar = c(3.14, 100, "Hello", TRUE, 300)
myVar

# *****
myVar[1] # 첫번째 요소
myVar[length(myVar)] # 마지막 요소를 access

result = myVar[2:4] # 2~4 번째 요소를 가져오자
                    # slicing
result # "100" "Hello" "TRUE"

result =  myVar[c(2,3,5)] # 2,3,5 번째 요소를 가져오자
                          # fancy indexing
result # "100" "Hello" "300"

myVar[-1] # 1번빼고 나머지!
myVar[-(3:4)] # 3 ~ 4 번째 빼고 나머지
myVar[-c(1,4,5)] # 1,4,5 번째 뺴고 나머지!

### Vector 데이터에 이름을 붙여보자
myVar = c(10,20,30,40,50)

names(myVar) # NULL 이름을 아직 정해주지 않았다.

names(myVar) = c("a","b","c","d","e")

names(myVar) # "a" "b" "c" "d" "e"

myVar 
# a  b  c  d  e 
# 10 20 30 40 50 
myVar[1] # a 10
myVar["a"] # a 10
```




- vector의 연산

```R

# vector : 연산

myVar1 = 1:3 # 1 2 3
myVar2 = 4:6 # 4 5 6

result = myVar1 + myVar2
result # 5 7 9

myVar3 = 1:6 # 1 2 3 4 5 6

result = myVar1 + myVar3 #(rectcle rule)
      #1 2 3 1 2 3  1 2 3 4 5 6
result#2 4 6 5 7 9

# vector에 대한 집합연산(합집합, 교집합, 차집합)
var1 = 1:5 # 1 2 3 4 5
var2 = 3:7 # 3 4 5 6 7

union(var1,var2) # 합집합: 1 2 3 4 5 6 7 
intersect(var1,var2) # 교집합: 3 4 5
setdiff(var1,var2) # 차집합: 1 2 
```
