# Circular Queue #

## 1. 문제
- 이 문제에서는 원형 큐를 구현한다.
- 선형 큐는 “큐가 실제로는 비어있어도 Push와 Pop을 할 수 없는" 문제가 발생할 수 있다.
- 원형 큐는 이 문제를 해결한다.
- 원형 큐 역시 큐와 마찬가지로 다음 세 개의 연산을 지원한다.
  - Push X : 큐에 정수 X를 push한다. 만약 rear 포인터가 더 이상 뒤로 갈 수 없다면, “Overflow”를 출력한다.
  - Pop : 큐에서 정수 하나를 pop한다. 만약 front 포인터가 더 이상 뒤로 갈 수 없다면, “Underflow”를 출력한다.
  - Front : 큐의 front에 있는 정수를 출력한다. 만약 큐가 비어있다면 “NULL”을 출력한다.

- 크기가 n인 원형 큐에 m개의 연산을 하는 프로그램을 작성하시오.
- 입력의 편의를 위해서 Push는 “1”, Pop은 “2”, Front는 “3”으로 표현한다.
- 아래 예제를 보면 크기 4인 큐에 15개의 연산이 입력으로 주어졌을 때의 입력과 출력의 예가 적혀있다.
- 참고로, 다음 연산은 “큐 구현하기" 문제와 동일하지만, 선형 큐의 문제를 잘 해결한다는 것에 주목하자.

## 2. 입력

- 첫째 줄에 큐의 크기 n, 연산의 개수 m이 주어진다. ( 1 ≤ n ≤ 100, 1 ≤ m ≤ 1,000 )
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
3
6
```

## 6. 코드

```c++
#include <stdio.h>

const int MAX = 10000;

struct Queue {
  int capacity;
  int f, r;
  int numElement;
  int data[MAX];
  
  void create(int size) {
    f = 0;
    r = 0;
    numElement = 0;
    capacity = size;
  }
  
  void push(int n) {
    if(numElement >= capacity) {
      printf("Overflow\n");
    } else {
      data[r] = n;
      
      r = (r+1) % MAX;
      
      numElement++;
    }
  }
  
  void pop() {
    if(numElement <= 0) {
      printf("Underflow\n");
    } else {
      data[f] = 0;
      f = (f+1) % MAX;
      
      numElement--;
    }
  }
  
  int front() {
    if(numElement <= 0) return -1;
    else return data[f];
  }
  
  int size() {
    return numElement;
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
    } else if (cal == 3) {
      int front = q1.front();
      if(front == -1) printf("NULL\n");
      else printf("%d\n", front);
    }
  }

  return 0;
}
```
