# 1

## 1. 문제
- 2와 5로 나누어 떨어지지 않는 정수 n(1 ≤ n ≤ 10000)가 주어졌을 때, 1로만 이루어진 n의 배수를 찾는 프로그램을 작성하시오.

## 2. 입력
- 입력은 여러 개의 테스트 케이스로 이루어져 있다.
- 각 테스트 케이스는 한 줄로 이루어져 있고, n이 주어진다.

## 3. 출력

- 1로 이루어진 n의 배수 중 가장 작은 수의 자리수를 출력한다.

## 4. 예제 입력
```
3
7
9901
```

## 5. 예제 출력
```
3
6
12
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int n;
int vect[1000] = { 0 };

int main()
{
    cout.tie(NULL);
    cin.tie(NULL);

    int n;
    while (cin >> n) {
        int num = 0;

        for (int i = 1;; i++) {
            num = num * 10 + 1;

            num %= n;

            if (num == 0) {
                cout << i << "\n";
                break;
            }
        }
    }
    

    return 0;
}
```



### #출처

- [백준 온라인 저지](https://www.acmicpc.net/problem/4375)
