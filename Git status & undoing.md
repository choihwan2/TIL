# Git status & undoing

### git commit

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

### commit undoing



1. 커밋 메시지 수정

```bash
$ git commit --amend
Add a. txt

* a.txt 내용 추가
* blahblah

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Wed Dec 18 09:40:03 2019 +0900
#
# On branch master
# Your branch is ahead of 'origin/master' by 2 commits.
#   (use "git push" to publish your local commits)
#
# Changes to be committed:
#       new file:   gogo.txt
#
# Changes not staged for commit:
#       modified:   Git status & undoing.md
#

```

커밋 메시지 수정하는 경우 해시값이 변경되므로, 다른 이력으로 관리가 된다.

**따라서, 공개된 저장소[원격저장소]에 이미 push 한 경우 절대 수정해서는 안된다.**

> commit 을 역사라고 생각하고 역사를 바꾸려는 시도는 가능하면 하지말자.

2. 특정 파일 추가하기
   * `c.txt` 파일을 같이 커밋하려고 했는데 `add` 를 하지 않고 커밋 해버린 경우.

```bash
$ git add c.txxt
$ git commit --amend
# add하지 않았던 c.txt를 add하고 commit --amend 로 시점을 돌려서 commit 을 한다고 생각.
```



### Staging area

1. 커밋 이력이 있는 파일 수정 하는 경우

```bash
$ git status
On branch master
#변경 사항인데 staging은 아닌 상황.
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt

no changes added to commit (use "git add" and/or "git commit -a")
$ git add a.txt
# git add로 staging에 올림.
$ git status
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   a.txt



```



### add 취소하기

```bash
$ git restore --staged <file>
# 다시 내려와!!

$ git status
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt
# 내려왔음 ㅠㅠ..
no changes added to commit (use "git add" and/or "git commit -a")
```

* 구 버전의 git 에서는 아래의 명령어를 사용해야 한다.

  ```bash
  $ git reset HEAD <file>
  ```



### WD 변화 삭제하기(되돌리기)

> git에서는 모든 commit 시점으로 되돌릴 수는 있다.
>
> 다만 WD 삭제하는 것은 되돌릴 수가 없다. 

```bash
$ git status
#지워진 파일 확인
$ git status
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    .gitignore
        modified:   Git status & undoing.md
        deleted:    a.txt
        deleted:    b.txt
        deleted:    c.txt
$ git resotre <file>
# 지워진 파일을 돌아가자. 혹은 그 시점으로 돌아간다
```

* 구버전 git 에서는 아래의 명령어를 사용해야 한다.

  ```bash
  $ git checkout -- <file>
  # 과거에 친구와 함께 팀플할때는 이거 썼었는데..
  ```





## 기타

* github student pack
* jetbrains 학생 - IDE(통합개발환경)
* notion student

도메인 - edu, ac