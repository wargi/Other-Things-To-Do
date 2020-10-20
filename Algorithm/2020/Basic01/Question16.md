# 3중 for

## 1. 문제
- 숫자 두 개와 문자 한 개를 입력 받고 아래의 예시와 같이 출력해주세요.

  ```
  1 2 C 를 만약 입력 받았다면,
  
  CC
  
  CC
  
  를 출력.
  
  3 4 F 를 만약 입력 받았다면,
  
  FFFF
  FFFF
  FFFF
  
  FFFF
  FFFF
  FFFF
  
  를 출력해주시오.
  ```

## 2. 입력
- 첫째 줄: 숫자 두 개와 문자 한 개를 입력 받는다.

## 3. 출력
- 위의 예제의 규칙처럼 출력한다.

## 4. 예제 입력
```
2 3 D
```

## 5. 예제 출력
```
DDD
DDD

DDD
DDD
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int n, m;
    char k;

    cin >> n >> m >> k;

    for (int i = 0; i < n * 2 + 1; i++) {
        if (i * 2 == n * 2) {
            cout << "\n";
            continue;
        }
        for (int j = 0; j < m; j++) {
            cout << k;
        }
        cout << "\n";
    }
}
```
