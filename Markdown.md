# 마크다운(markdown)기초

## 제목(heading)

제목은 `#`

#의 갯수로 제목의 레벨을 표현 가능하며 1~6까지 사용가능.

### H3

#### H4

##### H5

###### H6



## 목록

* 순서가 없는 목록은`*`을 통해 표현합니다.

  * tab을 통해 목록의 레벨을 조정할수 있습니다
  * 엔터

  엔터

* 엔터로 여기까지

  * 탭
    * 탭	
      * 탭
      * 엔터
    * 엔터
  * 엔터

* 엔터

1.  순서가 있는 목록
2. 순서가 있는 목록`1.`
   1. tab 을 통해 목록의 레벨을 조정할 수 있습니다.

## 링크

[구글신](https://google.com)

[마크다운 활용법](https://guides.github.com/features/mastering-markdown/)

'[구글신]'`(링크)`

## 코드 블록

```java
int number = " ";
System.out.println("안녕");

```

```python
#파이썬 주석
print("hi");
def foo():
    return 'hi'
```

## 이미지

![dog](images/dog.jpeg)

## 표

| 본문     | 표       | 에      |
| -------- | -------- | ------- |
| 들어가서 | 만들도록 | 합시다. |
|          |          |         |
|          |          |         |

## 기타

> 인용문은 `>` 기호를 통해 작성합니다. 
>
>  ex) 누가한말 살고자하면 죽고 죽고자하면 살것이다. -이순신 or
>
>  한 단어 정의 부분.

* `---` 수직선
* 이텔릭체 기울체* `*이텔릭체*`
* **볼드체 굵게** `**볼드체**`
* ~~취소선~~`~~취소선~~`
* notion 알아보기!
* 















# clone library

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
# install library
~/.bash_it/install.sh



## git 명령어

* pwd -> 나의 위치가 어디인가.
* git init => 처음 실행을 위한 명령어. -> 깃저장소로 초기화 해썽!
* git config --global user.email "choihwan2@naver.com" 처음에 이메일을 정해줌
* touch a.txt =>  a라는 이름을 가진 텍스트 파일을 만듬.
* git status => 나의 저장소의 상태를 알려줌
* git add a.txt => 새로운 파일을 설정에 더해줌.
* git commit -m "~~~" => 무언가 생성하고 add하고 그다음 메시지를 보냄. ()

# Git 기초

## 0. 준비 사항

* [git bash](https://gitforwindows.org/)
  * git을 활용하기 위한 CLI(command Line interface)를 제공한다
  * source, tree, github desktop 등을 통해 GUI 환경에서도 활용 가능하다.

## 1. 로컬 저장소 활용하기

### 1. 저장소 초기화

```bash
$ git init
initialized existing Git repository in C:/Users/student/Desktop/git_tutorial/.git/

```



* 저장소(repository)를 초기화 하게 되면 .git 폴더가 해당 디렉토리에 생성된다.
* bush 창에서는 (master) 라고 표기된다.
  * 현재 브랜치가 master라는 것을 의미한다.

### 2. add ~staging area

> git으로 관리되는 파일들은 Working directory(작업 환경), Staging Area, commit 단계를 거쳐 이력에 저장된다.

```bash
$ git add a.txt #파일명
$ git add images #폴더명
$ git add . #현재 디렉토리의 모든파일 및 폴더
```



* add 후 상태

```bash
$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   b.txt
```

### 3. commit

> 커밋은 코드의 이력을 남기는 과정이다.

```bash
$ git commit -m "add:b.txt"
[master 46b3223] add:b.txt
 1 file changed, 1 insertion(+)
 create mode 100644 b.txt

```

* 커밋 메시지는 항상 해당 이력에 대한 정보를 담을 수 있도록 작성하는 것이 좋다.

* 일관적인 커밋 메시지를 작성하는 습관을 들이자

* 이력 확인을 위해서는 아래의 명령어를 활용한다.

  ```bash
  $ git log
  commit 46b32233afb1f111445cd3d2bbf586ae2e2725d8 (HEAD -> master)
  Author: choihwan2 <choihwan2@naver.com>
  Date:   Mon Dec 16 14:23:38 2019 +0900
  
      add:b.txt
  
  commit d5e516b29033aad088fe91bdead201ffd7c38eb7
  Author: choihwan2 <choihwan2@naver.com>
  Date:   Mon Dec 16 11:41:25 2019 +0900
  
      Fix:a.txt
  
  commit 76a5998098344000b84b2517e9104e507fcf3681
  Author: choihwan2 <choihwan2@naver.com>
  Date:   Mon Dec 16 11:30:19 2019 +0900
  
      Add: a.txt
  
  ```

  **항상 status 명령어를 통해 git의 상태를 확인하자! commit 이후에는 log 명령어를 통해 이력들을 확인하자**



## 원격 저장소 활용하기

> 원격 저장소(remote repository)를 제공하는 서비스는 다양하게 존재한다.
>
> github을 기준으로 설명ㅎㄴ다.

## 0. 준비하기

* Github에서 저장소(repository) 생성

### 1. 원격 저장소 설정

```bash
$ git remote add origin {github url}
```

* {github url} 부분에는 원격 저장소 url을 작성한다.
* 원격 저장소(remote)로 {github url}  을 orgin 이라는 이름으로 추가(add)하는 명령어이다.
* 원격 저장소 목록을 보기 위해서는 아래의 명령어를 활용한다.

```bash
$ git remote -v
origin  https://github.com/choihwan2/TR.git (fetch)
origin  https://github.com/choihwan2/TR.git (push)
```

### 2. push

```bash
$ git push origin master

Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 2.44 KiB | 2.44 MiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/choihwan2/TR.git
   46b3223..3c6588e  master -> master
```

* 설정된 원격 저장소(origin) 으로 push!

폴더의 내용을 수정 및 삭제, 생성 등을 하게 된다면 add comit push 명령어를 통해서 이력을 저장하고 push 명령어를 통해 업로드를 한다.