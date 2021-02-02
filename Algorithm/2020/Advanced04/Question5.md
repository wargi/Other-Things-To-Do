# 기름 잔량 확인하기 #

## 1. 문제

- 기름의 잔량을 알려주는 프로그램을 만들려고 합니다.
- Binary Search를 이용하여 잔량을 출력하는 프로그램을 작성하시오.
- '#'은 남은 기름, '_'은 비어있는 기름

## 2. 입력
- 기름의 상태 문자열을 입력받습니다. (10글자)

## 3. 출력
- 잔량을 출력해주세요.

## 4. 예제 입력
```
###_______
```

## 5. 예제 출력
```
30%
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

char vect[11];

void find() {
    int start = 1, end = 8;

    while (1) {
        int mid = (start + end) / 2;

        if (vect[mid] == '#' && vect[mid + 1] == '_') {
            cout << mid + 1 << "0%";
            return;
        }

        if (vect[mid] == '#') start = mid + 1;
        else end = mid - 1;
    }
}

void bs() {
    if (vect[0] == '_') cout << "0%";
    else if (vect[9] == '#') cout << "100%";
    else find();
}

int main()
{
    cin >> vect;
    bs();

    return 0;
}
```
