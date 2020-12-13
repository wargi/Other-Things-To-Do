# 삼각관계 2

## 1. 문제

- 아래의 이미지는 삼각 관계를 나타낸 그래프 입니다.
- 그래프를 인접행렬로 작성하여, 행렬을 이용해서 5명 중에 가장 인기가 많은 사람을 출력해주세요.



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
