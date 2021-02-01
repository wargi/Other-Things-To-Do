# Linked list & DFS #

## 1. 문제

- 여섯 글자를 입력 받고, Linked list로 아래과 같이 연결해주세요.

```c++
// ex
head = new Node();
head->left = new Node();
head->right = new Node();
...
```

- Linked list Node에 각각 입력받은 문자를 넣어주세요.
- 만약, ABCDEF를 입력 받았다면 아래의 그림과 같습니다.

<img src="./Tree05.png" alt="Tree" style="zoom:80%;" />

- 모두 연결시킨 후, DFS로 탐색한 결과를 출력해주세요.

## 2. 입력
- 여섯 글자를 입력 받아 주세요.

## 3. 출력
- DFS로 탐색한 결과를 출력해주세요.

## 4. 예제 입력
```
ABCDEF
```

## 5. 예제 출력
```
ABDECF
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

struct Node {
    char data;
    Node* left;
    Node* right;
};

Node* head;

void run(Node* p) {
    if (p == NULL) return;
    cout << p->data;

    run(p->left);
    run(p->right);
}

char map[10] = "_ABC__DE";
char ch[1000];
char chMap[1000];
int main()
{
    cin >> ch;
    int n = strlen(ch);
    
    head = new Node({ ch[0] });
    head->left = new Node({ ch[1] });
    head->right = new Node({ ch[2] });
    head->left->left = new Node({ ch[3] });
    head->left->right = new Node({ ch[4] });
    head->right->left = new Node({ ch[5] });

    run(head);

    return 0;
}
```
