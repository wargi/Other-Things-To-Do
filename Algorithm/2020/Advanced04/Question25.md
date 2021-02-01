# 세로줄의 합

## 1. 문제

```
아래의 2차원 배열(3x4)을 하드코딩 해주세요.
3 4 1 5
3 4 1 3
5 2 3 6

위의 하드코딩 배열의 세로줄을 합한 결과를 sum이라는 배열을 만들어주세요.
```

## 2. 입력
- sum의 인덱스를 입력받습니다.(0 ~ 3)

## 3. 출력

- 입력받은 인덱스의 값을 출력해주세요.


## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
5
```

## 6. 예제 입력

```
0
```

## 7. 예제 출력

```
11
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int calSum(int index) {
    int map[3][4] = {
    3, 4, 1, 5,
    3, 4, 1, 3,
    5, 2, 3, 6
    };

    int sum = 0;
    for (int i = 0; i < 3; i++) {
        sum += map[i][index];
    }

    return sum;
}

int main()
{
    int sum[4], n;
    cin >> n;

    for (int i = 0; i < 4; i++) {
        sum[i] = calSum(i);
    }

    cout << sum[n];
}
```
