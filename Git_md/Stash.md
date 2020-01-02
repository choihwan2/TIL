# Stash

> 변경사항을 임시로 저장 해놓는 공간.

```
1. feature branch에서 a.txt 변경 및 커밋
2. master branch에서 a.txt 수정 (add commit 상태)
3. merge 
```



stash 저장

```bash

$ git stash
Saved working directory and index state WIP on master: c489627 Update:Git status.md
```



stash 목록

```bash
$ git stash list
stash@{0}: WIP on master: c489627 Update:Git status.md
```



### 해결

```bash
$ git stash # 임시 공간 저장
$ git merge feature # 병합
$ git stash pop # 임시 공간에서 병합.

# 충돌 발생, 해결 후 작업 이어가기
```



## Reset vs Revert

>  공개된 저장소[원격 저장소]에 push 된 이력은 절대 reset 하지 않는다.
>
> 혼자 하던 일을 지워버리고 잊어버리는건 가능하지만. 팀으로 할 경우 충돌이 일어난다.

```bash
$ git reset [해시코드]
```

* `기본 [--mixed]`: 이후 변경 사항을 WD에 위치시켜줌
* `--hard `: 이후 변경 사항이 모두 삭제함.**주의**
* `--sort`: 지금 작업하고 있는 내용(WD) 및 변경 사항을 WD에 유지시켜줌.



### Revert

> 해당 커밋 으로 되돌렸다는 이력 (rever commit)을 남긴다. 즉, 다른 사람과의 작업에 방해가 적어진다.

```bash
$ git revert [해시코드]
```

* vim -> 커밋 메시지 작성