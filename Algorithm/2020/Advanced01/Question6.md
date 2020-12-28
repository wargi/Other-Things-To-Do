# 같은 알파벳 집어내기

## 1. 문제
- 한 문장을 입력 받고, 같은 알파벳인 문자들을 찾아서 정렬하여 출력하는 프로그램을 작성하시오.

```
ex)
input: HELLOSWIFT
output: L
```

## 2. 입력
- 한 문장을 입력 받는다. (문장 <= 10)

## 3. 출력
- 같은 알파벳인 문자들을 찾아서 정렬하여 출력해주세요.

## 4. 예제 입력
```
ASSERTTYYA
```

## 5. 예제 출력
```
ASTY
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    string s;
    cin >> s;

    int check[26] = { 0 };

    for (int i = 0; i < s.size(); i++) check[s[i] - 65]++;

    for (int i = 0; i < 26; i++) {
        if (check[i] > 1) cout << char('A' + i);
    }

    return 0;
}
```
