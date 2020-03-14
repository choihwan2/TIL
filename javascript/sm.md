# 소마 준비

- Algorithim

```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;
class Main {
	public static void main(String[] args) throws Exception {
		
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		String first = bf.readLine();
		StringTokenizer strToken = new StringTokenizer(first);
		int num = Integer.parseInt(strToken.nextToken());
		int K = Integer.parseInt(strToken.nextToken()) - 1;	// 범위 보다 1개 적게 줘야지 왼쪽 오른쪽으로 나눴을때의 계산이 편해진다.
		int[] arr = new int[num];
		int answer = 0;
		
		String values = bf.readLine();
		strToken = new StringTokenizer(values);
		int temp =0;
		while (strToken.hasMoreElements()) {
			arr[temp++] = Integer.parseInt(strToken.nextToken());
		}
		
		int min = arr[0];  
		int pos = 0;	//최소값의 위치를 찾는다.
		for(int i = 1; i< arr.length; i++) {
			if(min > arr[i]) {
				min = arr[i];
				pos = i;
			}
		}
		
		int left = pos;	//왼쪽 갯수
		int right = arr.length - pos -1;	//오른쪽 갯수
		
		answer += left / K;
		int rest_L = left%K;
		answer += right / K;
		int rest_R = right%K;
		if(rest_L + rest_R > K) {
			answer += 2;
		}else {
			answer++;
		}
		if(rest_L + rest_R ==0) {
			answer--;
		}
		
		
		System.out.println(answer);
		
	}
}
```



- html

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SW마에스트로 11기 선발 코딩 테스트 웹 문제 - 객관식 문제 만들기</title>
</head>
<body>
<div class="body">
    <div>
        <p>우리나라의 대표적인 독립운동가로 '흥사단'이라는 단체를 만들어 교육과 계몽운동을 통해 독립운동을 편쳤던 이사람은 누구일까요?</p>
    </div>
    <div>
        <input type="checkbox" id="n1" value="김구" /><label for="n1">김구</label>
        <input type="checkbox" id="n2" value="안창호" /><label for="n2">안창호</label>
        <input type="checkbox" id="n3" value="손병희" /><label for="n3">손병희</label>
        <input type="checkbox" id="n4" value="양기탁" /><label for="n4">양기탁</label>
        <input type="checkbox" id="n5" value="안중근" /><label for="n5">안중근</label>
    </div>
    <button id="submit_btn" class="body__submit_btn" onclick="submit()">제출</button>
    <div>
        <span>결과: </span><span id="result"></span>
    </div>
</div>
```

- js

```javascript
function submit () {
		let length = document.getElementsByTagName("input").length;
		let check_arr = [];
		for(let i = 1; i<=length; i++) {
				let check = document.getElementById("n" + i).checked;
				if (check) {
						let value = document.getElementById("n" + i).value;
						check_arr.push(value);
				}
		}

		fetch('/submit', {
				method: 'POST',
				headers: {'Content-Type': 'application/json'},
				body: JSON.stringify({answers:check_arr})
		})
				.then(res => res.json())
				.then(ret => {
						let text = document.getElementById("result");
						if(ret){
								text.innerHTML = "정답입니다.";
						}else{
								text.innerHTML = "오답입니다.";
						}
				});
}
```





# SQL

### 모든 레코드 조회하기

```sql
SELECT * from ANIMAL_INS;
```



### 역순 레코드 조회

```sql
SELECT NAME, DATETIME from ANIMAL_INS ORDER BY animal_id desc;
```



### 조건에 맞는 레코드 찾기

```sql
SELECT ANIMAL_ID, NAME from ANIMAL_INS where INTAKE_CONDITION = 'Sick' order by ANIMAL_ID
```



### 이중 조건에 맞는 레코드 찾기

```mysql
SELECT ANIMAL_ID, NAME, DATETIME FROM ANIMAL_INS ORDER BY NAME,DATETIME DESC;
```



### 상위 몇개 레코드 찾기

```mysql
SELECT NAME FROM ANIMAL_INS ORDER BY DATETIME limit 1;

#하위는 반대로 desc 넣어주고 limit ㄱ
```



### 레코드의 개수 세기

```mysql
SELECT count(*) as 'count' from ANIMAL_INS;
```



### 중복을 제거한 레코드의 개수 세기

```mysql
SELECT COUNT(DISTINCT NAME) FROM ANIMAL_INS;
```



### 그룹지어서 레코드 개수 세기

```MYSQL
SELECT ANIMAL_TYPE, count(*) as 'count' from animal_ins group by ANIMAL_TYPE;
```



### 조건이 있는 그룹 레코드 개수 세기

```mysql
SELECT NAME,COUNT(NAME) from ANIMAL_INS GROUP BY NAME HAVING COUNT(NAME) > 1;
```



### 시간 별로 그룹지어 레코드 개수 세기

```mysql
SELECT HOUR(DATETIME) AS HOUR, COUNT(HOUR(DATETIME)) AS COUNT 
from ANIMAL_OUTS GROUP BY HOUR(DATETIME) HAVING HOUR>=9 AND HOUR<=19;
```

[링크](https://jang8584.tistory.com/7) 날짜 관련 좋은 함수들이 많다.



### 비어있는 시간들도 모두다 표현하기

```mysql
set @hour := -1;
SELECT 
    (@hour := @hour + 1) as 'HOUR',
    (select count(*) from animal_outs where hour(datetime) = @hour) as 'COUNT'
from 
    animal_outs
where
    @hour < 23;
```

> 진짜 이것만 잘 쓸줄 알아도 모든 쿼리문 다짤것같다..





### NULL & NOT NULL 인 레코드 조회하기

```mysql
SELECT ANIMAL_ID from ANIMAL_INS where NAME is NULL;

-- NOT NULL
SELECT ANIMAL_ID FROM ANIMAL_INS WHERE NAME IS NOT NULL
```



### LEFT JOIN 두 개의 테이블을 연결해서 레코드 조회하기

```mysql
SELECT A.ANIMAL_ID, A.NAME
FROM ANIMAL_OUTS A LEFT JOIN ANIMAL_INS B ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE B.ANIMAL_ID IS NULL
ORDER BY A.ANIMAL_ID

#ANIMAL_OUTS에만 존재하는 레코드를 조회한다.
```



### JOIN 후  ORDER BY

```mysql
SELECT A.ANIMAL_ID,A.NAME 
FROM ANIMAL_INS A LEFT JOIN ANIMAL_OUTS B on 
A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.DATETIME > B.DATETIME # A 시간보다 B시간이 더 빠를때 이렇게 표현
ORDER BY A.DATETIME
```

