# 삼각관계

## 1. 문제

- 아래의 이미지와 같이 링크드리스트를 구현해주세요.
- 링크드리스트를 만들었다면, head를 이용하여, son의 love1과 love가 누구인지 출력해주세요.

<img src="./Tree05.png" alt="Tree" style="zoom:80%;" />

## 3. 출력

- head를 이용하여, son의 love1과 love가 누구인지 출력해주세요.


## 4. 예제 출력
```
girlfriend
boyfriend
```

## 5. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

struct Node {
    string name;
    Node* love1;
    Node* love2;
};

int main()
{
    Node* head = new Node;

    head->name = "boss";
    head->love1 = new Node;
    head->love2 = new Node;

    head->love1->name = "wife";
    head->love1->love1 = head;
    head->love1->love2 = head->love2;

    head->love2->name = "son";
    head->love2->love1 = new Node;
    head->love2->love2 = new Node;

    head->love2->love1->name = "girlfriend";
    head->love2->love1->love1 = head->love2;
    head->love2->love1->love2 = head->love2->love2;

    head->love2->love2->name = "boyfriend";
    head->love2->love2->love1 = head->love2->love1;
    head->love2->love2->love2 = NULL;

    cout << head->love2->love1->name << "\n";
    cout << head->love2->love2->name;
}
```
