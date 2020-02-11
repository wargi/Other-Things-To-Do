# Queue #

## 1. 문제
- 이 문제에서는 큐를 구현한다. 큐는 다음 세 개의 연산을 지원한다.
  - Push X : 큐에 정수 X를 push한다. 만약 rear 포인터가 더 이상 뒤로 갈 수 없다면, “Overflow”를 출력한다.
  - Pop : 큐에서 정수 하나를 pop한다. 만약 front 포인터가 더 이상 뒤로 갈 수 없다면, “Underflow”를 출력한다.
  - Front : 큐의 front에 있는 정수를 출력한다. 만약 큐가 비어있다면 “NULL”을 출력한다.

- 크기가 n인 배열로 만든 큐에 m개의 연산을 하는 프로그램을 작성하시오. 입력의 편의를 위해서 Push는 “1”, Pop은 “2”, Front는 “3”으로 표현한다.

## 2. 입력

- 첫째 줄: 큐를 만들 수 있는 배열의 크기 n, 연산의 개수 m이 주어진다. ( 1 ≤ n ≤ 100, 1 ≤ m ≤ 1,000 )
- 두 번째 줄부터 연산이 주어진다.
- 1은 Push, 2는 Pop, 3은 Front 연산을 의미한다.  

## 3. 출력
- 연산의 결과를 출력한다.

## 4. 예제 입력
```
4 15
1 1
1 2
1 3
3
2
2
3
1 4
1 5
3
2
2
1 6
2
3
```

## 5. 예제 출력
```
1
3
Overflow
3
Overflow
Underflow
NULL
```

## 6. 코드

```c++
#include <stdio.h>

struct Queue {
  int capacity;
  int f, r;
  int data[100];
  
  void create(int size) {
    f = 0;
    r = 0;
    capacity = size;
  }
  
  void push(int n) {
    if(r < capacity) {
      data[r++] = n;
    } else {
      printf("Overflow\n");
    }
  }
  
  void pop() {
    if(r - f <= 0) {
      printf("Underflow\n");
    } else {
      f++;
    }
  }
  
  int front() {
    if(r - f <= 0) return -1;
    else return data[f];
  }
  
  int size() {
    return r - f;
  }
  
};

int main() {
  int size, count;
  Queue q1;
  
  scanf("%d %d", &size, &count);
  q1.create(size);
  
  for(int i = 0; i < count; i++) {
    int cal;
    scanf("%d", &cal);
    
    if(cal == 1) {
      int val;
      scanf("%d", &val);
      q1.push(val);
    } else if (cal == 2) {
      q1.pop();
    } else {
      int front = q1.front();
      if(front == -1) printf("NULL\n");
      else printf("%d\n", front);
    }
  }

  return 0;
}
```
