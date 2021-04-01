# 소수 구하기

## 1. 문제

- M이상 N이하의 소수를 모두 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄에 자연수 M과 N이 빈 칸을 사이에 두고 주어진다. (1 ≤ M ≤ N ≤ 1,000,000) 
- M이상 N이하의 소수가 하나 이상 있는 입력만 주어진다.

## 3. 출력

- 한 줄에 하나씩, 증가하는 순서대로 소수를 출력한다.


## 4. 예제 입력
```
3 16
```

## 5. 예제 출력
```
3
5
7
11
13
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int n;
bool check[1000001] = { true, true, };

int main()
{
    cout.tie(NULL);
    cin.tie(NULL);

    int n, m;

    cin >> n >> m;

    for (int i = 2; i <= m; i++) {
        if (check[i]) continue;

        for (int j = i * 2; j <= m; j += i) {
            check[j] = true;
        }
    }

    for (int i = n; i <= m; i++) {
        if (!check[i]) cout << i << "\n";
    }

    return 0;
}
  
```
