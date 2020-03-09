# R

- <h4>R은 통계계산을 위해서 만들어지 프로그래밍 언어이면서 소프트웨어</h4>

> 어떻게 하면 통계적 지식이 별로 없이 데이터 분석을 잘 할 수 있을까? *통계가 아예 필요없는건 아니다.



### R로 무엇을 할 수 있을까?

- 통계분석 : 기초 통계, 가설검정
- 머신러닝 
- 텍스트 마이닝
- 그외 등등..

> 여기서 적혀있는 것들을 한번 더 찾아서 공부해보자!





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

- 주석과 변수 선언

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



- 사칙연산과 출력

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



- 비교 연산과 논리연산

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



## R의 데이터 타입

- R의 기본적인 데이터 타입

```R
# R의 데이터 타입
# 1. numberic(수치형) : 정수와 실수를 구분하지 않음.
#   100, 100.3 (둘다 실수) 10L(정수)
# 2. character(문자형) : 하나의 문자, 문자열 둘 다 문자열로 간주되고 '', "" 둘다 혼용해서 사용이 가능하다!
# 3. logical(논리형) : TRUE(T) FALSE(F) 
# 4. complex(복소수형) : 4 - 3i 

# 특수데이터 타입
# 1. NULL : 가르키는 객체가 없다. (java와 유사)
# 2. NA(Not Available) : 유효하지 않다. 일반적으로 결측치(ex: 센서에서 값을 가져오다가 날아가는경우)를 표현할때 사용(missing value)
# 3. NAN(Not A Number) : 수치 값이지만 숫자로 표현이 안되는 값
sqrt(-9) # NaN
# 4 . Inf(Infinite) : 양의 무한대
3 / 0 # Inf
```



- R에서 사용하는 기본적인 함수 2개

```R
# R에서 제공하는 기본적인 함수 2개
# mode() 해당 데이터의 타입을 알려줌
var1 <- 200
mode(var1) # "numeric"

# is 계열의 함수
is.numeric(var1) #TRUE
```



- R에서 데이터 타입의 입력 우선순위

```R
#데이터 타입 입력 우선순위
#character > complex > numberic > logical

#기본적으로 사용되는 자료구조가 vector
myvar = c(10,20,30,40)
myvar

myvar = c(10,20,30,FALSE)
myvar

myvar = c(10,"뿡",30,FALSE)
myvar

#as 계열의 함수를 이용한 casting(형변환)
myvar = "100"
as.numeric(myvar)
```



## R Package

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

qplot(myvar)

# 평균
help(mean)
# help()를 이용해도 좋으나 RDcoumentation.org 사이트를 이용하는게 더 좋아보인다!
```



## R의 자료구조

```R
## 자료구조

## 자료형은 저장된 데이터의 타입을 지칭
## 자료구조는 데이터가 메모리에 어떤 방식으로 저장되어 있는가

## homogeneous (동질의 = 같은 종류의) 데이터 종류가 같은 애들의 집합
#   - 1. vector : 1 차원 선형구조, 순서개념이 존재.
#                 같은 종류의 데이터 타입을 이용
#   - 2. metrix : 2 차원 구조. 인덱스를 사용할 수 있음.
#                 같은 종류의 데이터 타입을 이용.
#   - 3. array  : 3 차원 이상의 구조. 인덱스를 사용할 수 있음.
#                 같은 종류의 데이터 타입을 이용.


## heterogeneous(다른 종류의) 데이터 종류가 다른 집합
#   - 1. list   : 1 차원 선형구조, 순서개념이 존재.
#                 실제 저장되는 구조는 map구조
#   - 2. data frame : 2차원 테이블 구조 
```



## Vector

