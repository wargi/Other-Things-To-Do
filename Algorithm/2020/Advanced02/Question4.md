# BFS - 인접행렬 Tree #

## 1. 문제

- 아래의 인접행렬(6x6) 트리를 하드코딩 해주세요.

```c++
int tree[6][6] = {
	0, 1, 0, 0, 1, 0,
  0, 0, 1, 0, 0, 1,
  0, 0, 0, 1, 0, 1,
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0
};
```

- 위의 인접행렬 Tree의 노드들을 BFS로 탐색하여 주세요.
- 탐색 시작 노드를 입력 받고, 각 노드를 방문할 때 마다 값을 출력해주세요.
- 단, 한번 방문한 노드는 다시 방문할 수 없습니다.
- 아래의 그림은 위의 하드코딩한 인접행렬을 Tree로 나타낸 모습입니다.
- <img src="./Tree01.png" alt="Tree" style="zoom:77%;" />

## 2. 입력

- 탐색 시작 노드를 입력 받습니다.

## 3. 출력
- 각 노드를 방문할 때 마다 값을 출력해주세요.

## 4. 예제 입력
```
0
```

## 5. 예제 출력
```
0 1 4 2 5 3
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int map[6][6] = {
    0, 1, 0, 0, 1, 0,
    0, 0, 1, 0, 0, 1,
    0, 0, 0, 1, 0, 0,
};

int main()
{
    int n;
    cin >> n;

    int head = 0, tail = 1, vect[6] = { n, };

    while (head != tail) {
        int now = vect[head++];

        for (int i = 0; i < 6; i++) {
            if (map[now][i] == 1) vect[tail++] = i;
        }
    }

    for (int i = 0; i < head; i++) {
        cout << vect[i] << " ";
    }

    return 0;
}
```
