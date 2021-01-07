# Linked List로 구성된 이진 트리 탐색

## 1. 문제

- 아래의 이미지와 같이 노드를 만들어주세요.
- 한 문장을 입력받습니다.

```
* 입력 받은 문장이 "H" 라면 head가 가르키는 값을 출력하고,
* 입력 받은 문장이 "HR" 이라면 head->Right가 가르키는 값을 출력하고,
* 입력 받은 문장이 "HL"이라면 head->Left가 가르키는 값을 출력하고,
* 입력 받은 문장이 "HRR" 이라면 head->Right->Right가 가르키는 값을 출력하고,
* 입력 받은 문장이 "HLL" 이라면 head->Left->Left가 가르키는 값을 출력합니다.
* 입력 받은 문장이 "HLR" 이라면 head->Left->Right가 가르키는 값을 출력합니다.
```

<img src="./Tree04.png" alt="Tree" style="zoom:80%;" />

## 2. 입력

- 한 문장을 입력받습니다.

## 3. 출력

- 위에 적어놓은 조건을 적용하여 결과를 출력해주세요.


## 4. 예제 입력
```
HLL
```

## 5. 예제 출력
```
D
```

## 6. 예제 입력

```
HR
```

## 7. 예제 출력

```
C
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
#include <string>
using namespace std;

struct Node {
    char data;
    Node* left;
    Node* right;
};

int main()
{
    Node* head = new Node;
    head->data = 'A';
    head->left = new Node;
    head->right = new Node;

    head->left->data = 'B';
    head->left->left = new Node;
    head->left->right = new Node;

    head->right->data = 'C';
    head->right->left = head->right->right = NULL;

    head->left->left->data = 'D';
    head->left->left->left = head->left->left->right = NULL;

    head->left->right->data = 'E';
    head->left->right->left = head->left->right->right = NULL;

    string s;
    cin >> s;

    if (s == "H") cout << head->data;
    else if (s == "HL") cout << head->left->data;
    else if (s == "HR") cout << head->right->data;
    else if (s == "HLL") cout << head->left->left->data;
    else cout << head->left->right->data;

}
```
