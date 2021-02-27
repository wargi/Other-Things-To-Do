# 가장 작은 부분 찾기

## 1. 문제

- 숫자 n을 입력받고 n개의 숫자들을 배열에 넣어주세요.
- 그 후에 배열의 연속된 네 칸의 합을 구했을때 가장 작은 합을 출력하는 프로그램을 작성해주세요. 

## 2. 입력

- 숫자 n을 입력받고 n개의 숫자들을 1차원 배열(1xn)에 넣어주세요. (4 <= n <= 100,000)

## 3. 출력

- 연속된 네 칸의 합을 구했을때 가장 작은 합을 출력해주세요.

## 4. 입력 예시

```
9
7 2 4 3 2 1 1 9 2
```

## 5. 출력 예시

```
7
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int v[100001], check[100000];
int sum = 0;

int main()
{
    int n;
    cin >> n;

    int min = 21e8;

    for (int i = 0; i < n; i++)
        cin >> v[i];

    for (int i = 0; i < n; i++) {
        if (i < 4) {
            sum += v[i];
        }
        else {
            sum -= v[i - 4];
            sum += v[i];
        }
        
        if (min > sum) min = sum;
    }

    cout << min;

    return 0;
}
```
