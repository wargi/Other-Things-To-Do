# Linked List를 Tree로 바꾸기

## 1. 문제

- heap을 이용하여 아래의 그림처럼 연결 해주세요.
- 입/출력 값은 없습니다 :)

<img src="./Tree03.png" alt="Tree" style="zoom:80%;" />

## 2. 코드
```c++
#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* pre;
    Node* post;
};

int main()
{
    Node* head = new Node;

    head->data = 3;
    head->pre = new Node;
    head->post = new Node;

    head->pre->data = 7;
    head->pre->pre = head->pre->post = NULL;

    head->post->data = 6;
    head->post->pre = new Node;
    head->post->post = NULL;

    head->post->pre->data = 2;
    head->post->pre->pre = head->post->pre->post = NULL;

    return 0;
}
```
