# 저렴한 비행 구간 #

## 1. 문제
- 5개국 여행 계획을 세워주는 여행사에서 경로추천을 해주려합니다.
- DFS를 활용하여 시작점부터 도착지점까지의 최소 비용과 경로를 출력해주세요.
- 아래 그래프를 인접행렬로 하드코딩해주세요.

<img src="./Graph02.png" alt="Graph" style="zoom:80%;" />

## 2. 입력
- 시작점과 도착지점을 입력 받아주세요.

## 3. 출력
- 최소 비용과 경로를 출력해주세요. 
- 갈 수 있는 길이 없다면 "impossible" 을 출력 하세요.

## 4. 예제 입력
```
G B
```

## 5. 예제 출력
```
6:GTHB
```

## 6. 코드

```c++
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using namespace std;

int map[5][5] = {
    0, 3, 6, 2, 0,
    0, 0, 2, 0, 4,
    0, 0, 0, 0, 1,
    0, 0, 0, 0, 8,
    0, 10, 0, 0, 0
};

int flag = 0;
int check[5] = { 0 };
char names[6] = "GTHKB";
char path[6];
char minPath[6];
int cost = 21e8;

void run(int level, int start, int end, int sum) {
    if (start == end) {
        if (cost > sum) {
            cost = sum;
            strcpy(minPath, path);
        }
        flag = 1;
        return;
    }

    if (level > 4) return;

    for (int i = 0; i < 5; i++) {
        if (!check[i] && map[start][i]) {
            check[i] = 1;
            path[level + 1] = names[i];
            run(level + 1, i, end, sum + map[start][i]);
            path[level + 1] = 0;
            check[i] = 0;
        }
    }
}

int main()
{
    int sIdx, eIdx;
    char s, e;
    cin >> s >> e;

    for (int i = 0; i < 5; i++) {
        if (s == names[i]) sIdx = i;
        if (e == names[i]) eIdx = i;
    }
    
    check[sIdx] = 1;
    path[0] = s;
    
    run(0, sIdx, eIdx, 0);

    if (!flag) cout << "impossible";
    else cout << cost << ":" << minPath;

    return 0;
}
```
