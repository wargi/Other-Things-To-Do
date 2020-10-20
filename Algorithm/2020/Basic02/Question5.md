# 컬러 찾기 #

## 1. 문제
```
아래에 2차원 배열(2x6)을 하드코딩 해주세요.
3 55 42
-5 -9 -10
```

- 2차원 배열(2x2)를 입력받고, 입력받은 2차원 배열(2x2)의 각 인덱스의 값이 위의 하드코딩한 2차원 배열(2x6)에 
- 존재한다면 Y를 출력, 아니라면 N을 출력해주세요.

## 2. 입력
- 2차원 배열(2x2)를 입력받아주세요.

## 3. 출력
- 존재한다면 Y출력, 아니라면 N을 출력해주세요.

## 4. 예제 입력
```
1 10
55 -5
```

## 5. 예제 출력
```
N N
Y Y
```

## 6. 예제 입력

```
42 43
-7 -9
```

## 7. 예제 출력

```
Y N
N Y
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int map[2][3] = {
    3, 55, 42,
    -5, -9, -10
};

int isCheck(int n) {
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            if (map[i][j] == n) return 1;
        }
    }
    return 0;
}

int main()
{
    int pix[2][2];

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            cin >> pix[i][j];
        }
    }

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            if (isCheck(pix[i][j]) == 1) cout << "Y ";
            else cout << "N ";
        }
        cout << "\n";
    }
}
```
