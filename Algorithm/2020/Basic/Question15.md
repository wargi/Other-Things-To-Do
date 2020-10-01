# 두 개의 문자 찾기 #

## 1. 문제
- ```
  //두 문장을 하드 코딩 해주세요 !
  HELLO,
  SWIFT!
  ```

- 두 문자를 입력 받고, 위의 문장에 입력받은 문자가 있다면 존재, 없다면 없음을 출력해주세요.

## 2. 입력
- 첫째 줄: 두 개의 문자를 입력받는다.

## 3. 출력
- 첫째 줄에는 첫번째 문자가 있는지를 출력하고, 마찬가지로 두 번째 줄에도 두 번째 문자가 있는지를 출력하시오.

## 4. 예제 입력
```
P W
```

## 5. 예제 출력
```
P : 없음
W : 존재
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

char arr[2][7] = {
    "HELLO,",
    "SWIFT!"
};

bool isExist(char n) {
    bool check = false;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 6; j++) {
            if (arr[i][j] == n) {
                check = true;
                break;
            }
        }
    }

    return check;
}


int main()
{
    char n, m;
    cin >> n >> m;

    if (isExist(n)) printf("%c : 존재\n",n);
    else printf("%c : 없음", n);

    if (isExist(m)) printf("%c : 존재", m);
    else printf("%c : 없음", m);
}
```
