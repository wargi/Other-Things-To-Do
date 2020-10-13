# 가족 찾기 #

## 1. 문제
```
아래의 2차원 배열(2x3)을 하드코딩 해주세요.
G K G
_ _ _
```

- 문자 세개를 입력받아 배열의 _ 부분을 채우고, 배열을 검사하여 같은 문자가 세 개 이상 발견되면 "존재"를 출력 아니라면 "없음"을 출력하시오.

## 2. 입력

-  문자 세 개를 입력받아주세요.

## 3. 출력
- 배열을 검사하여 같은 문자가 세 개 이상 발견되면 "존재"를 출력 아니라면 "없음"을 출력하시오.

## 4. 예제 입력
```
A B C
```

## 5. 출력

```
없음
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int check[1000] = { 0 };
    char family[2][4] = {
        "GKG"
    };

    for (int i = 0; i < 3; i++) {
        check[family[0][i]]++;
        cin >> family[1][i];
        check[family[1][i]]++;
    }

    int flag = 0;
    for (int i = 0; i < 1000; i++) {
        if (check[i] > 2) {
            flag = 1;
            break;
        }
    }

    if(flag) cout << "있음";
    else cout << "없음";
}
```