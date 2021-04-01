# 소수 찾기

## 1. 문제

- 주어진 수 N개 중에서 소수가 몇 개인지 찾아서 출력하는 프로그램을 작성하시오.


## 2. 입력
- 첫 줄에 수의 개수 N이 주어진다. N은 100이하이다. 다음으로 N개의 수가 주어지는데 수는 1,000 이하의 자연수이다.

## 3. 출력

- 주어진 수들 중 소수의 개수를 출력한다.


## 4. 예제 입력
```
4
1 3 5 7
```

## 5. 예제 출력
```
3
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int n;
long int vect[1000] = { 0 };
long int v[1000] = { 0 };

bool isPrime(int n) {
    if (n < 2) {
        return false;
    }

    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }

    return true;
}

int main()
{
    cout.tie(NULL);
    cin.tie(NULL);

    int n;
    int cnt = 0;

    cin >> n;

    for (int i = 0; i < n; i++) {
        int t;
        cin >> t;

        if (isPrime(t)) cnt++;
    }

    cout << cnt;

    return 0;
}
  
```
