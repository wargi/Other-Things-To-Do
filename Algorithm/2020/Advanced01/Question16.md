# BFS 3

## 1. 문제
- 아래의 트리형태를 인접행렬로 하드코딩 해주세요.
- <img src="./Tree10.png" alt="Tree" style="zoom:77%;" />
- 하드 코딩된 행렬을 BFS를 이용하여 탐색을 시작할 노드를 입력받고, 탐색하여 탐색 순서대로 출력하는 프로그램을 작성해주세요.

## 2. 입력
- 첫째 줄: 문자 한 개를 입력 받는다. (탐색 시작할 노드)

## 3. 출력
- 탐색 순서대로 출력해주세요.

## 4. 예제 입력
```
A
```

## 5. 예제 출력
```
A B C D E F G H I J
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int map[10][10] = {
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
};

char names[11] = "ABCDEFGHIJ";

int main()
{
    char ch;
    cin >> ch;

    int head, tail, idx;
    int queue[11];

    for (int i = 0; i < 10; i++) {
        if (ch == names[i]) idx = i;
    }

    head = idx;
    tail = head + 1;

    queue[0] = head;
    while (head != tail) {
        for (int i = 0; i < 10; i++) {
            int now = queue[head - idx];
            if (map[now][i] == 1) {
                queue[tail - idx] = i;
                tail++;
            }
        }
        head++;
    }
    
    for (int i = idx; i < tail; i++) {
        cout << names[queue[i - idx]] << " ";
    }
    
     return 0;
}
```
