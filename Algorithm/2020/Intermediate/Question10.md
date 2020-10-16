# 글자 세기 #

## 1. 문제
- 한 문장을 읽고, 중복을 제거한 알파벳이 각 각 처음 입력받은 문장에 몇개 있는지 출력하세요.

## 2. 입력
- 문자 하나를 입력받는다.

## 3. 출력
- 중복을 제거한 알파벳이 각 각 처음 입력받은 문장에 몇개 있는지 출력하세요.

## 4. 예제 입력
```
HELLOSWIFT
```

## 5. 예제 출력
```
H:1
E:1
L:2
O:1
S:1
W:1
I:1
F:1
T:1
```

## 6. 예제 입력

```
BYE2020
```

## 7. 예제 출력

```
B:1
Y:1
E:1
2:2
0:2
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char ch[11];
    cin >> ch;

    int n = strlen(ch);
    int check[100] = { 0 };

    for (int i = 0; i < n; i++)
        check[ch[i]]++;

    for (int i = 0; i < 100; i++) {
        if (check[i] > 0) {
            cout << char(i) << ":" << check[i] << "\n";
        }
    }

}
```
