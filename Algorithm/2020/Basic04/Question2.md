# 2단 점프

## 1. 문제
- 한 개의 숫자를 입력받고, 입력받은 숫자를 2씩 증가하는 재귀함수를 만들어 주세요.
- 3번째 재귀함수에 들어오면 다시 리턴하며 값을 출력해주세요.

## 2. 입력
- 한 개의 숫자를 입력받는다.

## 3. 출력
- 3번째 재귀함수에 들어오면 다시 리턴하며 값을 출력해주세요.

## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
8 6 4 2
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

void abc(int start, int end) {
    if (end == 4) return;
    abc(start + 2, end + 1);
    cout << start << " ";
}

int main()
{
    int n;
    cin >> n;
    abc(n, 0);
}
```
