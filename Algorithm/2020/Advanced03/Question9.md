# Enqueue & Dequeue 2

## 1. 문제
- 10의 크기를 가진 Queue를 생성해주세요.
- 반복할 횟수 n을 입력받아주세요.
- 1번 반복에 1, 2, 3을 enqueue하고 dequeue를 3번합니다.
- Dequeue를 할 때마다 Dequeue하는 값을 출력해주세요.

## 2. 입력
- 반복할 횟수 n을 입력받아주세요.

## 3. 출력
- Dequeue를 할 때마다 Dequeue하는 값을 출력해주세요.

## 4. 예제 입력
```
5
```

## 5. 예제 출력
```
123123123123123
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* next;
};

Node* head, * last;

void enQueue(int x) {
    if (head == NULL) {
        head = new Node({ x });
        last = head;
        return;
    }

    last->next = new Node({ x });
    last = last->next;
}

void deQueue() {
    cout << head->data;
    head = head->next;
}

int main()
{
    int n;
    cin >> n;
    for (int i = 0; i < n; i++) {
        enQueue(1);
        enQueue(2);
        enQueue(3);
        deQueue();
        deQueue();
        deQueue();
    }
}
```
