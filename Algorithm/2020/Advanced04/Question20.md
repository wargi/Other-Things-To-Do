# 배관 수리

## 1. 문제

- 수압이 좋지 않은 집을 수리하기 위해, 배관을 선택해 주세요.

<img src="./Array05.png" alt="Array" style="zoom:80%;" />

- 전체 배관의 맵은 2차원 배열로 주어지고 각 행에서 0이 아닌 칸을 한 개씩 열어야 합니다.
- 총 수압은 각 행의 칸을 선택했을때, 선택한 칸들의 곱입니다.

<img src="./Array06.png" alt="Array" style="zoom:80%;" />

- 위 그림처럼, **첫 번째 줄의 6, 두 번째 줄의 4, 세 번째 줄의 4, 네 번째 줄의 9 를** 선택한다면, 총 수압의 값은 864 로 수압의 값이 가장 큰 상태가 됩니다. 
- 또한, 최대 값이 중복될 수 있습니다. 
- 모든 경우의 수에서 가장 큰 값을 출력해주세요.

## 2. 입력
- 배관 사이즈의 세로, 가로 N 이 입력됩니다. (3 <= N <= 10)
- 배관 사이즈의 정보가 음수와 양수로 입력 됩니다.

## 3. 출력

- 배관을 열어, 선택한 배관들의 곱이 가장 큰 숫자를 출력하세요.

## 4. 예제 입력

```
4
3 4 -2 6
0 -4 4 1
-4 4 0 -2
5 1 6 9
```

## 5. 예제 출력
```
864
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
using namespace std;

int n, maxV = -21e8;
int check[10] = { 0 };
vector<vector<int>> arr;

void dfs(int level, int sum) {
    if (level == n) {
        if (sum > maxV) maxV = sum;
        return;
    }

    for (int i = 0; i < n; i++) {
        if (arr[level][i] != 0) {
            dfs(level + 1, sum * arr[level][i]);
        }
    }
}

int main()
{
    cin >> n;

    for (int i = 0; i < n; i++) {
        vector<int> t;
        for (int j = 0; j < n; j++) {
            int m;
            cin >> m;

            t.push_back(m);
        }
        arr.push_back(t);
    }
    
    dfs(0, 1);
    cout << maxV;

    return 0;
}
```
