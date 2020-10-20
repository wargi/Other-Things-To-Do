# 문장에 'A' 추가하기 #

## 1. 문제
- 문장과 인덱스를 입력받고 해당하는 인덱스에 'A'를 추가해주세요.

## 2. 입력
- 첫째 줄: 문장이 주어진다.
- 둘째 줄: 삽입할 인덱스 번호가 주어진다.

## 3. 출력
- 해당 인덱스 위치에 삽입한 문자열을 출력

## 4. 예제 입력
```
show
2
```

## 5. 예제 출력
```
shAow
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char someString[7];
    char temp;
    int n;
    cin >> someString >> n;

    int cnt = 0;

    for (int i = 0; i < 6; i++) {
        if (someString[i] == '\0') break;
        cnt++;
    }

    for (int i = n; i < cnt + 1; i++) {
        if (n == i) {
            temp = someString[i];
            someString[i] = 'A';
        }
        else {
            char x = temp;
            temp = someString[i];
            someString[i] = x;
        }
    }

    someString[cnt + 1] = '\0';

    cout << someString;
}
```
