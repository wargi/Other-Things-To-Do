# 로또 번호 생성하기 #

## 1. 문제

- 로또 번호를 추천하는 프로그램을 만들려고 합니다.
- N을 입력받아 NxN의 번호판과, NxN 비트배열을 입력 받고, 비트 배열의 값이 1인 좌표에 해당하는 번호판 숫자를 추출합니다.

```
- 번호판이 아래와 같이 입력을 받고,
3 4 1 6
7 7 2 4
2 6 4 5
4 2 6 5

- 비트배열이 아래와 같이 입력을 받는다면,
0 1 0 0
0 1 0 0
0 0 1 0
0 1 0 0

비트배열 값이 1에 해당하는 추출되는 숫자는 4 7 4 2 입니다.
```

- 추출되는 아래의 정렬 우선 순위에 따라 정렬해주세요.
- [정렬 우선 순위]

1. 빈도수가 높은 순

2. 숫자가 작은 순

   > - 위의 예제 추출 숫자 4, 7, 4, 2를 우선 순위 정렬을 하면 4, 4, 2, 7이 됩니다.

## 2. 입력

- 첫 줄: 번호 배열, 비트 배열의 사이즈 N을 입력받습니다.
- 다음 줄부터: 번호 배열과 비트 배열을 입력받습니다. 

## 3. 출력
-  정렬 우선 순위에 따라 정렬하고 출력해주세요.

## 4. 예제 입력
```
4
3 4 1 6
7 7 2 4
2 6 4 5
4 2 6 5
0 1 0 0
0 1 0 0
0 0 1 0
0 1 0 0
```

## 5. 예제 출력
```
4 4 2 7
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int check[10] = { 0 };

bool compare(int a, int b) {
    if (check[a] > check[b]) return true;
    else if (check[a] < check[b]) return false;
    return a < b;
}

int main()
{
    int map[10][10];
    int bit[10][10];
    
    vector<int> result;

    int n;
    cin >> n;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> map[i][j];
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> bit[i][j];

            if (bit[i][j]) {
                result.push_back(map[i][j]);
                check[map[i][j]]++;
            }
        }
    }

    sort(result.begin(), result.end(), compare);

    for (int i = 0; i < result.size(); i++) cout << result[i] << " ";

    return 0;
}
```
