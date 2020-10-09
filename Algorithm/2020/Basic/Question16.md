# 직원 찾기

## 1. 문제
- 아래의 배열(3x4)을 하드코딩해주세요.

  ```
  65000 35 42 70
  70 35 65000 1300
  65000 30000 38 42
  ```

- 위 의 배열(3x4)에 직원들의 출근기록이 적혀져 있습니다. 그 중에, 가장 성실하게 출근한 사람을 출력해주세요.

## 2. 힌트
- DAT를 이용하여 풀어보세요(Direct Adress Table)

## 3. 출력
- 가장 빈도수가 많은 직원을 출력해주세요.

## 4. 예제 출력
```
65000
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    int check[65536] = { 0 };
    int map[4][3] = {
        65000, 35, 42, 70,
        70, 35, 65000, 1300,
        65000, 30000, 38, 42
    };

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            check[map[i][j]]++;
        }
    }

    int max = -1, id = 0;
    for (int i = 0; i < 65536; i++) {
        if (check[i] > max) {
            max = check[i];
            id = i;
        }
    }

    cout << id;
}
```
