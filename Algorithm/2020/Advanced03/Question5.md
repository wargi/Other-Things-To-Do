# Enqueue & Dequeue #

## 1. 문제
- 첫 줄에 두 개를 숫자를 입력 받습니다.
- 첫 줄의 첫 번째 숫자는 Queue에 Enqueue할 갯수입니다.
- 첫 줄의 두 번째 숫자는 Queue에 Dequeue할 갯수입니다.
- 다음 줄에는 Queue에 넣을 문자들을 입력받습니다.
- 최종 Enqueue & Dequeue한 Queue의 결과를 출력해주세요.

## 2. 입력
- 첫 줄에 두 개를 숫자를 입력 받습니다.
- 첫 줄의 첫 번째 숫자는 Queue에 Enqueue할 갯수입니다.
- 첫 줄의 두 번째 숫자는 Queue에 Dequeue할 갯수입니다.
- 다음 줄에는 Queue에 넣을 문자들을 입력받습니다.

## 3. 출력
- 최종 Enqueue & Dequeue한 Queue의 결과를 출력해주세요.

## 4. 예제 입력
```
5 2
A B C G K
```

## 5. 예제 출력
```
C G K
```

## 6. 예제 입력

```
3 1
A B C
```

## 7. 예제 출력

```
B C
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    char data;
    Node* next;
};

Node* head, * last;

void enQueue(char data) {
    if (head == NULL) {
        head = new Node();
        head->data = data;
        last = head;
        return;
    }

    last->next = new Node();
    last = last->next;
    last->data = data;
}

void deQueue(Node* p) {
    if (head->next == NULL) return;
    head = head->next;
}

int main()
{
    int e, d;
    cin >> e >> d;

    for (int i = 0; i < e; i++) {
        char ch;
        cin >> ch;

        enQueue(ch);
    }

    for (int i = 0; i < d; i++) {
        deQueue(head);
    }

    for (Node* p = head; p != NULL; p = p->next) {
        cout << p->data << " ";
    }
}
```
