# 재귀를 이용한 Binary Search #

## 1. 문제
- 아래의 배열을 하드코딩 해주세요.

```
4 4 5 7 8 10 20 22 23 24
```

- 숫자 한 개를 입력받고, 배열 안에 존재하는 숫자인지 찾는 프로그램을 재귀호출을 이용하여 작성하시오.

- 존재한다면 'O', 없다면 'X'를 출력해주세요.

## 2. 입력
- 찾는 숫자를 입력받아주세요.

## 3. 출력
- 존재한다면 'O', 없다면 'X'를 출력해주세요.

## 4. 예제 입력
```
20
```

## 5. 예제 출력
```
O
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int target;
int vect[10] = { 4, 4, 5, 7, 8, 10, 20, 22, 23, 24 };

void bs(int s, int e) {
    int mid = (s + e) / 2;
    if (vect[mid] == target) {
        cout << "O";
        return;
    }

    if (s >= e) {
        cout << "X";
        return;
    }

    if (vect[mid] < target) bs(mid + 1, e);
    else bs(s, mid - 1);
}

int main()
{
    cin >> target;
    bs(0, 9);

    return 0;
}
```
