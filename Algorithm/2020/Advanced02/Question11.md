# heap 익혀보기 4

## 1. 문제
- 문자 5개를 입력받고, 입력받은 순서대로 heap을 이용하여 링크드리스트에 저장하고 연결된 마지막 노드의 문자를 출력해주세요.

## 2. 입력
- 문자 5개를 입력받는다.

## 3. 출력
- 입력받은 순서대로 heap을 이용하여 링크드리스트에 저장하고 연결된 마지막 노드의 문자를 출력해주세요.

## 4. 예제 입력
```
A B C D E
```

## 5. 예제 출력
```
E
```

## 6. 예제 입력

```
S W I F T
```

## 7. 예제 출력

```
T
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    char data;
    Node* next = NULL;
};

int main()
{
    Node* head = new Node;
    Node* n;

    for (int i = 0; i < 5; i++) {
        n = head;
        cin >> n->data;
        n = n->next;
    }
    
    n = head;
    while (true) {
        if (n->next == NULL) {
            cout << n->data;
            break;
        }

        n = n->next;
    }

}
```
