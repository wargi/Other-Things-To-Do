# BFS 2 #

## 1. 문제
- 8개의 노드를 가진 2진 트리 형태의 1차원 배열을 입력받고, BFS로 탐색하여 탐색 순서대로 값을 출력해주세요.(0은 없는 노드)
- <img src="./Tree09.png" alt="Tree" style="zoom:77%;" />
- 만약, 0 3 7 4 2 0 9 6 을 입력 받는다면, 위의 그림과 같은 트리가 됩니다.
- 위 트리의 출력결과는 3 7 4 2 9 6 입니다.

## 2. 입력
- 8개의 노드를 가진 2진 트리 형태의 1차원 배열을 입력받는다.

## 3. 출력
- BFS로 탐색하여 탐색 순서대로 값을 출력해주세요.

## 4. 예제 입력
```
0 1 2 3 0 0 4 5
```

## 5. 예제 출력
```
1 2 3 4 5
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int vect[8];
    int result[10];

    for (int i = 0; i < 8; i++) cin >> vect[i];

    int head = 1;
    int idx = 0;

    result[idx++] = vect[head];
    while ((head * 2 + 1) < 8) {
        if (vect[head * 2] > 0) result[idx++] = vect[head * 2];
        if (vect[head * 2 + 1] > 0) result[idx++] = vect[head * 2 + 1];
        head++;
    }

    for (int i = 0; i < idx; i++) {
        cout << result[i] << " ";
    }

    return 0;
}
```
