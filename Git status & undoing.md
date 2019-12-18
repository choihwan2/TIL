# Git status & undoing

### 1. git commit

```bash
#gogo.txt 를 생성하고 add하지 않고 commit 한 경우 
$ git commit
On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
        gogo.txt

nothing added to commit but untracked files present
#gogo.txt를 해결해야함 지우고 난후
$ git commit
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean


```

### git status

1. add 한 이전

```bash
$ git status
On branch master
Your branch is up to date with 'origin/master'.

#add를 하지 않고 생성만 한 후 status 를 본 상황.
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        gogo.txt

nothing added to commit but untracked files present (use "git add" to track)
```

2. add 한 이후

```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   gogo.txt
```

### commit 메시지 작성하기 (메시지 없이 commit 한 경우)

```bash
$ git commit
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
# Your branch is ahead of 'origin/master' by 1 commit.
#   (use "git push" to publish your local commits)
#
# Changes to be committed:
#       new file:   gogo.txt
#

```

* 편집(입력모드) :  단축키 `I`
  * 문서 편집이 가능
* 명령 모드 : `esc`
  * `dd` : 라인삭제
  * `wq`: 저장 및 종료 (`w:write` 저장 `q:quit` 종료)
  * `q!` 강제 종료 (`q:quit`종료 `!`강제)

> vim adventure 라는 게임을 통해 vim 을 학습 할수 있다. 시간이 나면 해보자
>
> [고고](https://vim-adventures.com/)

### log

> 커밋은 해시 값에 의해서 구분된다.
>
> (commit 옆의 값)

```bash
$ git log
commit 75767bea66848e61476fb098e1833d80449ee1cb (HEAD -> master)
Author: choihwan2 <choihwan2@naver.com>
Date:   Wed Dec 18 09:40:03 2019 +0900

    Add a. txt

    * a.txt 내용 추가
    * blahblah
#~~~밑에 줄줄줄

$ git log -1
commit 75767bea66848e61476fb098e1833d80449ee1cb (HEAD -> master)
Author: choihwan2 <choihwan2@naver.com>
Date:   Wed Dec 18 09:40:03 2019 +0900

    Add a. txt

    * a.txt 내용 추가
    * blahblah
    
$ git log -1 --oneline
75767be (HEAD -> master) Add a. txt


```

> 좋은 commit 메시지를 위해 언제나 노력하자 다양한 회사 기술블로그를 참고하는게 좋음.
>
> [참고링크](https://meetup.toast.com/posts/106)

