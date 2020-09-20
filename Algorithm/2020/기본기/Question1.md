# Find the tail #

## 1. 문제
- 입력받은 문장의 맨 끝 글자를 출력한다.

## 2. 입력
-  - 세 문장을 2차원 배열에 입력 받아주세요. 사이즈: 3 x 10

## 3. 출력
- 문장의 맨 끝 글자들을 출력한다.

## 4. 예제 입력
```
HELLO
SANGWOOK
PARK
```

## 10. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char arr[3][10];
    for (int i = 0; i < 3; i++) cin >> arr[i];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 9; j++) {
            if (arr[i][j + 1] == '\0') {
                cout << arr[i][j];
                break;
            }
        }
    }
}```
