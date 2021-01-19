# 사전 정리하기 #

## 1. 문제
- n을 입력받고, n개의 문자열들을 입력받습니다.
- 입력 받은 문자열들을 아래의 규칙으로 정렬하고 정렬결과를 출력하는 프로그램을 작성하시오.

```
1. 길이 순(오름차순)
2. 길이가 같다면 알파벳의 사전순(오름차순)
```

## 2. 입력

-  n을 입력받고, n개의 문자열들을 입력받습니다.

## 3. 출력
- 입력 받은 문자열들을 위의 규칙으로 정렬하고 정렬결과를 출력해주세요.

## 4. 예제 입력
```
7
ABC
B
TTL
SWIFT
CODING
2021
HELLOWARGI
```

## 5. 출력

```
B
ABC
TTL
2021
SWIFT
CODING
HELLOWARGI
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    int n;
    string s[20];

    cin >> n;

    for (int i = 0; i < n; i++) cin >> s[i];

    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (s[i].size() < s[j].size()) continue;
            if (s[i].size() == s[j].size() && s[i] < s[j]) continue;

            string temp = s[i];
            s[i] = s[j];
            s[j] = temp;
        }
    }

    for (int i = 0; i < n; i++) cout << s[i] << "\n";

    return 0;
}
```