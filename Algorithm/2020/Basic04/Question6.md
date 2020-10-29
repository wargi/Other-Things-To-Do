# n부터 0까지

## 1. 문제
- 숫자 n을 입력받고, n이 0이 될때까지 2로 나누는 재귀를 만들고, 0이 되면 출력해주세요.

```
ex)
input: 16
output: 1 2 4 8 16
```

## 2. 입력
- 숫자 n을 입력받습니다.

## 3. 출력
- n이 0이 될때까지 2로 나누는 재귀를 만들고, 0이 되면 위의 예제처럼 출력해주세요.

## 4. 예제 입력
```
23
```

## 5. 예제 출력
```
1 2 5 11
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int returnAve(int n) {
    if (n == 0) return 0;
    returnAve(n / 2);
    cout << n << " ";
}

int main()
{
    int n;
    cin >> n;

    returnAve(n);
}
```
