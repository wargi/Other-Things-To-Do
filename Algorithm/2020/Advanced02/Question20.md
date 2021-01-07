# Linked list 1

## 1. 문제

```
1. 11에서 36사이의 숫자 중 하나를 입력받아 주세요.

2. 입력받은 번호에 해당하는 문자를 순서대로 4개를 연결시켜주세요.(번호별 문자는 아래를 참고해주세요.)

3. 연결시킨 후에 head부터 모든 노드를 출력해주세요.

11: A   12: B   13: C
14: D   15: E   16: F
17: G   18: H   19: I
20: J   21: K   22: L
23: M   24: N   25: O
26: P   27: Q   28: R
29: S   30: T   31: U
32: V   33: W   34: X
35: Y   36: Z
```

## 2. 입력
- 숫자 n을 입력받아주세요. (11 <= n <= 36)

## 3. 출력

- 연결시킨 후에 head부터 모든 노드를 출력해주세요.

## 4. 예제 입력
```
14
```

## 5. 예제 출력

```
DEFG
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    char data;
    Node* next;
};

Node* head, * last;

void addNode(char data) {
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

    for (int i = 0; i < 4; i++) {
        char ch = char(n + 54 + i);
        addNode(ch);
    }
    
    for (Node* p = head; p != NULL; p = p->next) {
        cout << p->data;
    }
}
```
