# 3차원 배열 2 #

## 1. 문제
- 아래와 같이, 3차원 배열(2x2x3)을 하드코딩하여 채워주세요.

  ```
  A T B
  C C B
  
  A A A
  B B C
  ```
  
- 이제 문자 하나를 입력받고, 문자가 위의 배열에 있는 확인하고 있다면 "발견", 없다면 "미발견"이라고 출력해주세요.


## 2. 입력
- 문자 하나를 입력받아 주세요.

## 3. 출력
- 문자가 위의 배열에 있는 확인하고 있다면 "발견", 없다면 "미발견"이라고 출력해주세요.

## 4. 예제 입력
```
K
```

## 5. 예제 출력
```
미발견
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

bool run(char ch) {
    char map[2][2][4] = {
        { "ATB", "CCB" },
        { "AAA", "BBC" }
    };

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            for (int k = 0; k < 3; k++) {
                if (ch == map[i][j][k]) return true;
            }
        }
    }

    return false;
}

int main()
{
    char ch;
    cin >> ch;
    
    if (run(ch)) cout << "발견";
    else cout << "미발견";
}
```
