# max와 min

## 1. 문제

- main에 변수 두 개(a, b)를 만들고, 변수 두개의 주소를 BBQ함수에 넘겨주세요.
- 그리고, BBQ함수에 5개의 숫자를 입력받고, max와 min을 찾아서 각 각 a와 b에 넣고 main에서 출력해주세요.

## 2. 입력

- 다섯 개의 숫자를 입력받습니다.

## 3. 출력

- max와 min을 출력합니다.

## 4. 입력 예시

```
2 4 9 1 5
```

## 5. 출력 예시

```
a=9
b=1
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

void BBQ(int* max, int* min) {
    int input[5];
    int tMax = -1, tMin = 999;
    for (int i = 0; i < 5; i++) {
        cin >> input[i];
        if (tMax < input[i]) tMax = input[i];
        if (tMin > input[i]) tMin = input[i];
    }

    *max = tMax;
    *min = tMin;
}

int main()
{
    int a, b;

    BBQ(&a, &b);

    cout << "a=" << a << "\n";
    cout << "b=" << b;
}
```
