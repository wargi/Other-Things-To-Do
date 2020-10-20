# 배열의 좌표 찾기 #

## 1. 문제
- 6개의 숫자를 입력받고, 2 x 3 사이즈의 배열을 채워주세요.
- 그리고, 배열의 값 중에 max값의 좌표와 min값의 좌표를 리턴해주세요.

## 2. 입력
- 6개의 숫자를 입력받는다.

## 3. 출력
- 첫째 줄: max값의 좌표를 출력
- 둘째 줄: min값의 좌표를 출력

## 4. 예제 입력
```
1 2 3 4 5 6
```

## 5. 예제 출력
```
(1,2)
(0,0)
```

## 6. 예제 입력

```
2 4 9 1 6 5
```

## 7. 예제 출력

```
(0,2)
(1,0)
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int arr[2][3];

void getMax(int* dy, int* dx) {
    int max = arr[*dy][*dx];

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            if (max < arr[i][j]) {
                *dx = j;
                *dy = i;
                max = arr[i][j];
            }
        }
    }
}

void getMin(int* dy, int* dx) {
    int min = arr[*dy][*dx];

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            if (min > arr[i][j]) {
                *dx = j;
                *dy = i;
                min = arr[i][j];
            }
        }
    }
}

int main()
{
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            cin >> arr[i][j];
        }
    }

    int minX = 0, minY = 0;
    int maxX = 0, maxY = 0;
     
    getMax(&maxY, &maxX);
    getMin(&minY, &minX);

    cout << "(" << maxY << "," << maxX << ")" << "\n";
    cout << "(" << minY << "," << minX << ")";
}
```
