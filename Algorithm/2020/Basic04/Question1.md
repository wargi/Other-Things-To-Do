# 문 워크 #

## 1. 문제
```
숫자 6개를 입력받고 아래의 예제처럼 재귀를 이용하여 출력해주세요.
ex)
input: 1 2 3 4 5 6
output: 1 2 3 4 5 6 5 4 3 2 1
```

## 2. 입력

-  숫자 6개를 입력받아주세요.

## 3. 출력
- 위의 예제처럼 재귀를 이용하여 출력해주세요.

## 4. 예제 입력
```
1 2 3 4 5 6
```

## 5. 출력

```
1 2 3 4 5 6 5 4 3 2 1
```

## 6. 코드

```c++
#include <iostream>
using namespace std;
int map[6];

void jackson(int n) {
    cout << map[n] << " ";
    if (n == 5) return;
    jackson(n + 1);
    cout << map[n] << " ";
}

int main()
{
    for (int i = 0; i < 6; i++) {
        cin >> map[i];
    }
    
    jackson(0);
}
```