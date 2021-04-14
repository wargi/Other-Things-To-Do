# 1로 만들기

## 1. 문제

- 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.
  1. X가 3으로 나누어 떨어지면, 3으로 나눈다.
  2. X가 2로 나누어 떨어지면, 2로 나눈다.
  3. 1을 뺀다.
- 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

## 2. 입력
- 첫째 줄에 1보다 크거나 같고, 106보다 작거나 같은 정수 N이 주어진다.

## 3. 출력

- 첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.


## 4. 예제 입력
```
2
```

## 5. 예제출력

```
1
```

## 6. 예제 입력

```
10
```

## 7. 예제출력

```
3
```

## 8. 코드

```c++
#include <string>
#include <iostream>

using namespace std;

int n;
int mv = 21e8;
void run(int n, int cnt) {
    if (mv < cnt) return;
    if (n == 1) {
        mv = min(mv, cnt);
        return;
    }

    if (n % 3 == 0) run(n / 3, cnt + 1);
    if (n % 2 == 0) run(n / 2, cnt + 1);
    run(n - 1, cnt + 1);
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> n;

    run(n, 0);

    cout << mv;

    return 0;
}
```



### #출처

- [백준 온라인 저지](https://www.acmicpc.net/problem/1463)
