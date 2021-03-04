# 카운팅 정렬과정 출력하기

## 1. 문제
- O(n + k) 속도를 보이는 Counting Sort를 구현하고자 합니다.
- n개의 숫자를 입력받고, 그 과정을 출력 해 주세요.
- Counting Sort 과정 1 : DAT 처리
- Counting Sort 과정 2 : 누적합 구하기 ( **[0] ~ [9] index 까지 총 10개 누적값만 출력 해 주세요.** )
- Counting Sort 과정 3 : 정렬하기 ( **정렬 결과를 출력 해 주세요.** )
- 정렬하는 과정에서 만들어지는 누적값과 정렬값을 출력 해 주세요.

> **[세부 조건]**
>
> 1. 정렬할 숫자의 최소 값 : 1
> 2. 정렬할 숫자의 최대 값 : 20
> 3. 1 <= n <= 10

## 2. 입력
- 첫 줄: 정렬할 숫자의 개 수를 입력받습니다.
- 다음 줄: 정렬할 숫자들을 입력 받습니다.

## 3. 출력
- 정렬하는 과정에서 만들어지는 누적값과 정렬값을 출력 해 주세요.

## 4. 예제 입력
```
5
5 2 2 1 2
```

## 5. 예제 출력
```
0144455555
12225
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int n;
int map[21] = { 0 };
int dat[21] = { 0 };
int acc[21] = { 0 };

void init()
{
    cin >> n;

    for (int i = 0; i < n; i++) {
        cin >> map[i];
        dat[map[i]]++;
    }
}

int main()
{
    init();

    for (int i = 0; i < 10; i++) {
        if (i == 0) acc[i] = dat[0];
        else acc[i] = acc[i - 1] + dat[i];
        cout << acc[i];
    }

    cout << "\n";

    for (int i = 0; i < n; i++) {
        dat[acc[map[i]]--] = map[i];
    }

    for (int i = 1; i <= n; i++) {
        cout << dat[i];
    }

    return 0;
}

```
