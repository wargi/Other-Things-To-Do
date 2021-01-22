# 라인 정렬 #

## 1. 문제
- 0 ~ 9사이의 숫자들을 한 줄에 여러 개를 입력받습니다.(총 5줄)
- 마지막줄(6번째 줄) 정렬할 Line 2개를 입력받습니다.
- 정렬은 오름차순으로 (작은 수 -> 큰 수) 정렬합니다.
- 각 라인의 맨 앞에 위치한 숫자를 출력해주세요.

```
예시)
input)
160 // 0번 Line
57 // 1번 Line
0322 // 2번 Line
92 // 3번 Line
48 // 4번 Line
0 3 // 정렬해야할 라인

[정렬 후 라인 결과]
016
57
0322
29
48

[맨 앞 숫자들 출력]
output: 05024
```

## 2. 입력
- 0 ~ 9사이의 숫자들을 한 줄에 여러 개를 입력받습니다.(총 5줄)
- 마지막줄(6번째 줄) 정렬할 Line 2개를 입력받습니다.

## 3. 출력
- 각 라인의 맨 앞에 위치한 숫자를 출력해주세요.

## 4. 예제 입력
```
160
57
0322
92
48
0 3
```

## 5. 예제 출력
```
0 5 0 2 4
```

## 6. 코드

```c++
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;

int main()
{
    string s[5];

    for (int i = 0; i < 5; i++) cin >> s[i];

    int n, m;
    cin >> n >> m;

    sort(s[n].begin(), s[n].end());
    sort(s[m].begin(), s[m].end());

    for (int i = 0; i < 5; i++) cout << s[i][0] << " ";

    return 0;
}
```
