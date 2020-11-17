# 3차원 배열 4

## 1. 문제
```
숫자 2개를 변수에 입력 받습니다.

만약 1, 3을 입력 받았다면
input: 1 3
output)
1 1 1
3 3 3

1 1 1
3 3 3

1 1 1
3 3 3

위 처럼 3차원 배열에 저장하고 출력해주세요. 
```


## 2. 입력
- 첫 줄: 숫자 2개를 변수에 입력 받습니다.

## 3. 출력
- 위 예제 처럼 출력해주세요. 

## 4. 예제 입력
```
2 4
```

## 5. 예제 출력
```
2 2 2
4 4 4

2 2 2
4 4 4

2 2 2
4 4 4
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int a, b;
    cin >> a >> b;

    int map[3][2][3];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 2; j++) {
            for (int k = 0; k < 3; k++) {
                if (j == 0) map[i][j][k] = a;
                else map[i][j][k] = b;
            }
        }
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 2; j++) {
            for (int k = 0; k < 3; k++) {
                cout << map[i][j][k] << " ";
            }
            cout << "\n";
        }
        cout << "\n";
    }
}
```
