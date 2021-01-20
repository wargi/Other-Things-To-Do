# 최대 수익 내기 #

## 1. 문제
- 배열의 연속된 부분 중에 가장 큰 부분을 찾아 시작 인덱스와 끝 인덱스를 출력해주세요.

## 2. 입력

- 첫 줄: 배열의 사이즈를 입력받습니다.
- 마지막 줄: 배열의 값을 입력받습니다.

## 3. 출력
- 입력 받은 문자에 해당되는 한 줄을 출력해주세요.

## 4. 예제 입력
```
1 2 3 2 -3 0 1 -8 3 2 3 -1 2 3
```

## 5. 예제 출력
```
8 12
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int vect[10000];
    int n, sum = 0, sIdx = 0, eIdx, max = -21e8;

    cin >> n;

    for (int i = 0; i < n; i++) cin >> vect[i];

    for (int i = 0; i < n; i++) {
        if (sum < 0) {
            sIdx = i;
            sum = 0;
        }

        sum += vect[i];

        if (max < sum) {
            max = sum;
            eIdx = i;
        }
    }

    cout << sIdx << " " << eIdx;

    return 0;
}
```
