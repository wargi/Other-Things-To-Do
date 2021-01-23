# 이름 정렬 #

## 1. 문제

- 연락처에 정렬 기능을 만드려고 합니다. 아래의 정렬 우선순위를 보고 정렬 후에 출력하는 프로그램을 작성하시오.
- [정렬 우선 순위]

1. 길이 순으로 정렬(오름차순)
2. 사전 순으로 정렬(오름차순)

## 2. 입력
- 첫 줄: 연락처의 개 수를 입력 받습니다.
- 다음 줄부터: 이름들을 입력 받습니다.

## 3. 출력
- 정렬 후에 출력해주세요.

## 4. 예제 입력
```
5
aaleh
amily
acome
john
java
```

## 5. 예제 출력
```
java
john
aaleh
acome
amily
```

## 6. 코드

```c++
#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
using namespace std;

bool compare(string a, string b) {
    if (a.length() < b.length()) return true;
    if (a.length() > b.length()) return false;

    return a < b;
}

int main()
{
    int n;
    vector<string> arr;

    cin >> n;

    for (int i = 0; i < n; i++) {
        string s;
        cin >> s;

        arr.push_back(s);
    }

    sort(arr.begin(), arr.end(), compare);

    for (int i = 0; i < n; i++) cout << arr[i] << "\n";

    return 0;
}
```
