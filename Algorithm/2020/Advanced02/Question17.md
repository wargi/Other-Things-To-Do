# 가장 작은 수 출력

## 1. 문제
- 처음 입력 받을 숫자들의 개수 n을 입력받습니다.
- 그 후에, n개의 숫자들을 이용하여 가장 작은 세자리 수를 만들어주는 프로그램을 작성하시오.

## 2. 입력
- 첫 줄에 입력 받을 숫자들의 개수 n을 입력받고,
- 다음 줄에 n개의 숫자들을 입력받습니다.

## 3. 출력
- n개의 숫자들을 이용하여 가장 작은 세자리 수를 만들어 출력해주세요.

## 4. 예제 입력
```
5
0 0 0 0 5
```

## 5. 예제 출력
```
093476
```

## 6. 예제 입력

```
4
9 1 3 0
```

## 7. 예제 출력

```
103
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int n, m = 9999;
int check[1000] = { 0 };
int* vect;

void dfs(int level, int sum) {
    if (level == 3) {
        if (sum >= 100 && sum <= 999 && sum < m) m = sum;
        
        return;
    }

    for (int i = 0; i < n; i++) {
        if (!check[i]) {
            check[i] = 1;
            dfs(level + 1, sum * 10 + vect[i]);
            check[i] = 0;
        }
    }
}

int main()
{
    cin >> n;
    vect = new int[n];

    for (int i = 0; i < n; i++) cin >> vect[i];

    dfs(0, 0);

    cout << m;

    return 0;
}
```
