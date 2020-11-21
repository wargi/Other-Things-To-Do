# 오프셋 찾기

## 1. 문제
- 아래의 2차원 배열(5x5)을 하드코딩 해주세요.

```
A B C D E
F G H I J
K L M N O
P Q R S T
U V W X Y
```

- 문자 한 개를 입력받아주세요. 그 후에 입력받은 문자가 'M'과 얼마나 떨어져 있는지 출력해주세요.

## 2. 입력
- 문자 한 개를 입력받는다.

## 3. 출력
- 입력받은 문자가 'M'과 얼마나 떨어져 있는지 출력해주세요.

## 4. 예제 입력
```
F
```

## 5. 예제 출력
```
-1,-2
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char alpha[5][6] = {
    "ABCDE",
    "FGHIJ",
    "KLMNO",
    "PQRST",
    "UVWXY"
    };

    char ch;
    cin >> ch;
    int dy, dx;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (ch == alpha[i][j]) {
                dy = i - 2;
                dx = j - 2;
            }
        }
    }

    cout << dy << "," << dx;
}
```
