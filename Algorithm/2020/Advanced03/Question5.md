# 1 ~ 3등 출력 #

## 1. 문제
- 대회에서 n명의 선수가 점수를 냈습니다.
- 선수들의 점수를 입력받고 1 ~ 3등을 뽑아 출력할려고 합니다.
- 하지만, 점수 저장 컴퓨터의 문제로 인해서 네 칸의 배열만을 사용할 수 있습니다.
- 네 칸의 배열을 이용해서 1 ~ 3등의 점수를 출력해주세요.
- 삽입 정렬로 풀어주세요.

## 2. 입력
- 첫 줄에 선수가 몇 명인지 입력받습니다.
- 다음 줄부터 선수들의 점수를 입력받습니다.

## 3. 출력
- 최종 1 ~ 3등 점수를 출력해주세요.

## 4. 예제 입력
```
6
35
69
73
83
95
99
```

## 5. 예제 출력
```
1등99
2등95
3등83
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int n, idx = 0;
    cin >> n;

    int rank[4] = { 0 };
    int* point = new int[n];

    for (int i = 0; i < n; i++) cin >> point[i];

    for (int i = 0; i < n; i++) {
        if (i < 4) rank[idx++] = point[i];
        if (i >= 4 && rank[3] > point[i]) continue;

        rank[3] = point[i];

        for (int j = idx - 1; j > 0; j--) {
            if (rank[j - 1] < rank[j]) swap(rank[j - 1], rank[j]);
            else break;
        }
    }

    cout << "1등" << rank[0] << "\n";
    cout << "2등" << rank[1] << "\n";
    cout << "3등" << rank[2];

    return 0;
}
```
