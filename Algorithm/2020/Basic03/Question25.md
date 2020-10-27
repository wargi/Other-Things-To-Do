# 부메랑

## 1. 문제

- n을 입력 받고, n부터 0을 출력하고 0부터 다시 n까지 출력해주세요.

## 2. 입력
- 숫자 n을 입력 받아주세요.

## 3. 출력

- n -> 0 -> n까지 출력해주세요.


## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
2 1 0 1 2
```

## 6. 예제 입력

```
5
```

## 7. 예제 출력

```
5 4 3 2 1 0 1 2 3 4 5
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

void countDown(int start, int end, bool flag) {
    if (start > end) return;
    if (start == 0) flag = false;
    
    cout << start << " ";
    if (flag) {
        countDown(--start, end, flag);
    }
    else {
        countDown(++start, end, flag);
    }
    
}

int main()
{
    int n;
    cin >> n;
    countDown(n, n, true);
}
```
