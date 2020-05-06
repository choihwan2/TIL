# javascript30

## 시작에 앞서

[https://javascript30.com/](https://javascript30.com/) 에서 한 프로젝트들을 하면서 알게된 웹 프로그래밍을 정리해본 글이다.



## JavaScript Drum kit

<img src="images/javascript_1_drum.gif" alt="javascript_1_drum" style="zoom:80%;" />



## 코드

 ```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Hwan Drum</title>
  </head>
  <style type="text/css">
    .keys {
      display: flex;
      flex: 1;
      min-height: 100vh;
      align-items: center;
      justify-content: center;
    }

    .key {
      border: 0.4rem solid black;
      border-radius: 0.5rem;
      margin: 1rem;
      font-size: 1.5rem;
      padding: 1rem 0.5rem;
      transition: all 0.07s ease; /*무언가 변화가 일어나는것을 0.07s 로 */
      width: 10rem;
      text-align: center;
      color: white;
      background: rgba(0, 0, 0, 0.4);
      text-shadow: 0 0 0.5rem black;
    }

    .playing {
      transform: scale(1.1);
      border-color: #ffc600;
      box-shadow: 0 0 1rem #ffc600;
    }
  </style>
  <body>
    <div class="keys">
      <div data-key="65" class="key">
        <kbd>A</kbd>
        <span class="sound">clap</span>
      </div>
      <!--...-->
    </div>
    <audio data-key="65" src="sounds/clap.wav"></audio>
    <!--...-->

    <script>
      function playSound(e) {
        const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
        const key = document.querySelector(`.key[data-key="${e.keyCode}"]`);
        if(!audio) return;// 다른 단축키 들어오면 멈추기
        audio.currentTime = 0; // 연속해서 누를때 계속 다시 시작하도록 하려고
        audio.play();
        key.classList.add('playing');
      }
      
      
      function removeTransiotion(e){
        if(e.propertyName !== 'transform') return; // 바뀌는 이벤트가 아니면 하지않기
        
        this.classList.remove('playing') // 클래스 이름뒤에 있는 playing 이라는 것을 없애준다.
        
      }
      window.addEventListener('keydown', playSound);
      
      const keys = document.querySelectorAll('.key');
      keys.forEach(key => key.addEventListener('transitionend', removeTransiotion));
    </script>
  </body>
</html>
 ```

- 가자 유용하게 사용한 부분은 바로 `document.querySelector`로 `audio` 태그안에 있는 `data-key` 의 값에 접근하여 키 코드 값을 가져 온 것이다.
- `window.addEventListner('keydown', playSound)` 입력키가 들어오는 이벤트가 발생하면 `playSound`라는 함수 호출
- 마지막줄인 `keys.forEach` 구문을 잘 확인해 두자. 
- `createElement` 로 새로운 element 를 생성할 수 있다.





```mysql
SELECT STAGE,ROUND(AVG(STUDENT_NUM)),ROUND(AVG(STUDENT_NUM / TEACHER_NUM),1) FROM SCHOOLS 
GROUP BY STAGE
ORDER BY ROUND(AVG(STUDENT_NUM)) DESC,ROUND(AVG(TEACHER_NUM),1);
```





