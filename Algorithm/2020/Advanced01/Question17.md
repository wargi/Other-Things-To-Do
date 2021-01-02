# 바이러스 퍼트리기

## 1. 문제
- 바이러스 하나가 있습니다.
- 이 바이러스에 걸린 한명은 1초에 3명씩 감염시킵니다.
- 바이러스가 2초가 되면(0초: 1명 -> 1초: 4명 -> 2초: 13명) 이런식으로 계속 늘어납니다.
- n초를 입력받고 몇 명이 감염되었는지 출력하는 프로그램을 작성하시오.


## 2. 입력
- 첫 줄: 몇 초간 바이러스간 퍼진지 n을 입력받으세요.

## 3. 출력
- 몇 명이 감염되었는지 출력해주세요. 

## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
40
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

int main()
{
    int n;
    cin >> n;

    enQueue(1);
    for (int i = 0; i < n; i++) {
        int data = last->data * 3;
        enQueue(data);
    }

    int cnt = 0;
    for (Node* p = head; p != NULL; p = p->next) {
        cnt += p->data;
    }

    cout << cnt;

    return 0;
}
```
