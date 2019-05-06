# Plate #

## 1. 문제
- 접시가 a, b, c, d 가 있고, 알파벳 순으로 한쪽이 막혀 있는 세척기에 들어간다고 할 때, b a c d 순으로 꺼내기 위해서는 push, push, pop, pop, push, pop, push, pop을 하면 된다.
- 세척기에서 꺼내는 순서가 주어질 때 그 동작을 출력하는 프로그램을 작성하시오.
- 만약 주어진 순서대로 접시를 꺼낼 수 없다면 “impossible”을 출력한다.

## 2. 입력
- 첫째 줄: 소문자 알파벳이 주어진다.
- 중복된 소문자 알파벳은 입력되지 않는다.
- 알파벳 소문자는 26개이다.  

## 3. 출력
- 접시를 꺼내는 것이 가능한 경우 push, pop의 순서를 출력한다.
- 이것이 불가능하다면 impossible을 출력한다.  

## 4. 예제 입력
```
bacd
```

## 5. 예제 출력
```
push
push
pop
pop
push
pop
push
pop
```

## 6. 예제 입력

```
dabc
```

## 7. 예제 출력

```
impossible
```

## 8. 코드

```c++
#include <stdio.h>
#include <string.h>

struct Stack {
  char arr[27];
  int top = -1;
  int topIndex;
  int numArr[10000], cnt = 0;
  
  void push() {
    numArr[cnt++] = 1;
    top++;
  }
  
  char pop() {
    numArr[cnt++] = 0;
    top--;
  }
};

int main() {
  char alpha[29];
  int alphaLength, cnt = 0;
  
  Stack p1;
  
  for(int i = 0; i < 26; i++) {
    p1.arr[i] = 97 + i;
  }
  
  scanf("%s", alpha);
  alphaLength = strlen(alpha);
  
  for(int i = 0; i < alphaLength;) {
    if(p1.top > -1 && alpha[i] == p1.arr[p1.topIndex]) {
      p1.pop();
      if(p1.top > -1) p1.topIndex--;
      i++;
      continue;
    } else if(alpha[i] == p1.arr[cnt]) {
      p1.push();
      p1.pop();
      i++;
    } else {
      p1.push();
      p1.topIndex = cnt;
    }
    if(cnt < alphaLength) cnt++;
    else if(p1.arr[p1.topIndex] != alpha[i]) break;
  }
  
  if(p1.top == -1) {
    for(int i = 0; i < p1.cnt; i++) {
      if(p1.numArr[i] == 1) printf("push\n");
      else printf("pop\n");
    }
  } else {
    printf("impossible");
  }
   
  return 0;
}
```
