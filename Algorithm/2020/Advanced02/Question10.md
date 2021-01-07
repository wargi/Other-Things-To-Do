# heap 익혀보기 3 #

## 1. 문제
```T
1. 아래의 연결된 상태를 heap을 이용하여 만들어 주세요.
head -> 3 -> 5 -> 4 -> 2

2. 연결 상태를 만들었다면 while을 이용하여 처음부터 끝까지 출력해주세요.
```

## 2. 출력
- 연결 상태를 만들었다면 while을 이용하여 처음부터 끝까지 출력해주세요.

## 3. 예제 출력
```
3 5 4 2
```

## 4. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* next;
};

int main()
{
    Node* head = new Node;

    head->data = 3;
    head->next = new Node;

    head->next->data = 5;
    head->next->next = new Node;

    head->next->next->data = 4;
    head->next->next->next = new Node;

    head->next->next->next->data = 2;
    head->next->next->next->next = NULL;

    Node* x = head;
    while (true)
    {
        cout << x->data << " ";
        x = x->next;

        if (x == NULL) break;
    }
}
```
