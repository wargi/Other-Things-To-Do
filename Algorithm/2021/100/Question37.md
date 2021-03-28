# 부분수열의 합

## 1. 문제

- N개의 정수로 이루어진 수열이 있을 때, 크기가 양수인 부분수열 중에서 그 수열의 원소를 다 더한 값이 S가 되는 경우의 수를 구하는 프로그램을 작성하시오.


## 2. 입력
- 첫째 줄에 정수의 개수를 나타내는 N과 정수 S가 주어진다. (1 ≤ N ≤ 20, |S| ≤ 1,000,000)
- 둘째 줄에 N개의 정수가 빈 칸을 사이에 두고 주어진다.
- 주어지는 정수의 절댓값은 100,000을 넘지 않는다.

## 3. 출력

- 첫째 줄에 합이 S가 되는 부분수열의 개수를 출력한다.


## 4. 예제 입력
```
5 0
-7 -3 -2 5 8
```

## 5. 예제 출력
```
1
```

## 6. 코드

```c++
#include <string>
#include <iostream>

using namespace std;

int n, m;
int map[22] = { 0 };
int vect[22] = { 0 };
int visited[22] = { 0 };
int cnt = 0;

void run(int now, int level, int sum) {
    if (level > 0 && sum == m) {
        cnt++;
    }
    if (level == n) return;

    for (int i = now; i < n; i++) {
        if (visited[i]) continue;
        visited[i] = 1;
        vect[level] = map[i];
        run(i + 1, level + 1, sum + map[i]);
        vect[level] = 0;
        visited[i] = 0;
    }
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> n >> m;

    for (int i = 0; i < n; i++) cin >> map[i];

    run(0, 0, 0);

    cout << cnt;

    return 0;
}
```
