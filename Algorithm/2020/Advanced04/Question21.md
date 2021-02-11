# 다빈치 코드

## 1. 문제

- 다빈치 코드게임을 벤치 마킹하여 게임을 만들었습니다. 
- 서로 M 개의 카드를 상대방의 카드패에서 뽑고, 카드들의 각각의 값들을 곱한 값으로 승패를 가립니다.
- 이길 확률을 높이려면 상대방이 내 카드에서 M 개를 뽑아 그 숫자들의 곱이 최소값이 되도록 유도해야합니다.

```
[예시]
- 7개의 카드패가 주어 지고 M이 3이라면 카드패들의 곱이 가장 작은 값이 나와야합니다.
1 5 4 -2 6 7 -1

- 만일, M이 3이라면 -2, 6, 7을 뽑도록 유도하여 최소값인 -84 가 나오도록 해야 이길 확률이 높아 집니다.
```

## 2. 입력

- 숫자 카드의 개수 N이 입력 됩니다. (3 <= N <= 1,000)
- 다음 줄에, 음수와 양수의 값을 가진 카드들이 입력 됩니다.
- 그리고, 뽑아야할 카드 개수 M 이 입력 됩니다. (2 <= N < N)

## 3. 출력

- M 개를 선택하여 곱한 값이 최소값이 될때의 값을 출력하세요.

## 4. 입력 예시

```
7 3
1 5 4 -2 6 7 -1
```

## 5. 출력 예시

```
-84
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
using namespace std;

vector<int> v;
int check[1000] = { 0 };
int n, m, mini = 21e8;

void dfs(int level, int sum) {
    if (level == m) {
        if (sum < mini) mini = sum;
        return;
    }

    for (int i = 0; i < n; i++) {
        if (!check[i]) {
            check[i] = 1;
            dfs(level + 1, sum * v[i]);
            check[i] = 0;
        }
    }
}

int main()
{
    cin >> n >> m;
    
    for (int i = 0; i < n; i++) {
        int t;
        cin >> t;
        v.push_back(t);
    }

    dfs(0, 1);
    cout << mini;

    return 0;
}
```
