# 마스킹 된 배열에서 min값과 index 찾기

## 1. 문제
- 1차원 배열(1x6) 숫자 6개를 입력 받고, 아래의 하드코딩된 마스킹 배열에 마스킹 된 값들 중 min값과 index를 출력해주세요.

```
1 0 1 0 1 0
```

## 2. 입력
- 1차원 배열(1x6) 숫자 6개를 입력 받는다.

## 3. 출력
- 하드코딩된 마스킹 배열에 마스킹 된 값들 중 min값과 index를 출력해주세요.

## 4. 예제 입력
```
2 1 2 6 4 6
```

## 5. 예제 출력
```
arr[1]=1
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int arr[6];
    for (int i = 0; i < 6; i++) {
        cin >> arr[i];
    }

    int min = arr[0], index = 0;
    for (int i = 0; i < 6; i++) {
        if (min > arr[i] && i % 2 == 0) {
            min = arr[i];
            index = i;
        }
    }

    printf("arr[%d]=%d", index, arr[index]);
}
```
