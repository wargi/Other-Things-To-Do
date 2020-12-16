# Tree

## 1. 문제

- 인접행렬(n x n)을 입력받고, 0번 노드의 부모와 자식을 출력해주세요.
- 예시)

<img src="./Tree01.png" alt="Tree" style="zoom:80%;" />

## 2. 입력
- 첫 줄: 숫자 n을 입력 받아주세요.
- 다음 줄부터: n x n 사이즈의 인접행렬을 입력받으세요.

## 3. 출력

- 부모와 자식 노드를 출력해주세요.


## 4. 예제 입력
```
7
0 0 0 0 1 0 1
0 0 0 0 0 1 0
1 1 0 1 0 0 0
0 0 0 0 0 0 0
0 0 0 0 0 0 0
0 0 0 0 0 0 0
0 0 0 0 0 0 0
```

## 5. 예제 출력
```
boss:2
under:4 6
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

void countDown(int start, int end, bool flag) {
    if (start > end) return;
    if (start == 0) flag = false;
    
    cout << start << " ";
    if (flag) {
        countDown(--start, end, flag);
    }
    else {
        countDown(++start, end, flag);
    }
    
}

int main()
{
    int n;
    cin >> n;
    countDown(n, n, true);
}
```
