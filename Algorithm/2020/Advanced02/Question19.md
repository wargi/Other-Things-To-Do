# heap 익혀보기 5

## 1. 문제
- 숫자 n을 입력받고, n의 배수 4개의 링크드리스트를 연결하여 만들고 출력해주세요.

```
input: 4

4 -> 8 -> 12 -> 16

output)
4 8 12 16
```

## 2. 입력
- 숫자 n을 입력받습니다.

## 3. 출력
- 연결된 링크드리스트를 head부터 순서대로 출력해주세요.

## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
2 4 6 8
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

void addNode(int data) {
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

int main()
{
    int n;
    cin >> n;

    for (int i = 1; i <= 4; i++) {
        addNode(n * i);
    }

    for (Node* p = head; p != NULL; p = p->next) {
        cout << p->data << " ";
    }
}
```
