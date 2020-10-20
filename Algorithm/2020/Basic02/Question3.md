# 비밀번호 맞추기 #

## 1. 문제
- 숫자로 된 1차원 배열(1x4)에 비밀번호 '1665'가 저장되어 있습니다.
- 1차원 배열(1x4)를 입력받고 비밀번호가 일치하면 "pass", 아니라면 "fail"을 출력해주세요.

## 2. 입력
- 첫째 줄: 1차원 배열(1x4)를 입력받는다.

## 3. 출력
- 비밀번호가 일치하면 "pass", 아니라면 "fail"을 출력해주세요.

## 4. 예제 입력
```
1 6 6 5
```

## 5. 예제 출력
```
pass
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int pass[4] = { 1, 6, 6, 5 };

int isSame(int n[4]) {
    for (int i = 0; i < 4; i++) {
        if (pass[i] != n[i]) return 0;
    }

    return 1;
}

int main()
{
    int input[4];
    for (int i = 0; i < 4; i++) cin >> input[i];

    if (isSame(input) == 1) cout << "pass";
    else cout << "fail";
}
```
