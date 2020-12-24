# 그래비티

## 1. 문제
- 2차원 배열(4x3)을 입력받고, 아래의 예제처럼 실행한 후 결과를 출력해주세요.

```
중력 없이, 둥둥 떠다니는 문자 배열을 중력을 받아 떨어진 문자 상태 배열로 만들어 출력해주세요.
A _ B     _ _ _
_ C _  -> _ _ _
D _ _     A _ _
_ _ _     D C B
```

## 2. 입력
- 2차원 배열(4x3)을 입력받는다.

## 3. 출력
- 예제처럼 실행한 후 결과를 출력해주세요.

## 4. 예제 입력
```
ABC
___
D_E
___
```

## 5. 예제 출력
```
___
___
A_C
DBE
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char map[4][4];

    for (int i = 0; i < 4; i++) {
        cin >> map[i];
    }

    for (int i = 3; i > 0; i--) {
        for (int j = i - 1; j >= 0; j--) {
            if (map[i][0] == '_' && map[j][0] != '_')
            {
                char temp = map[i][0];
                map[i][0] = map[j][0];
                map[j][0] = temp;
            }

            if (map[i][1] == '_' && map[j][1] != '_')
            {
                char temp = map[i][1];
                map[i][1] = map[j][1];
                map[j][1] = temp;
            }

            if (map[i][2] == '_' && map[j][2] != '_')
            {
                char temp = map[i][2];
                map[i][2] = map[j][2];
                map[j][2] = temp;
            }
        }
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            cout << map[i][j];
        }
        cout << "\n";
    }
}
```
