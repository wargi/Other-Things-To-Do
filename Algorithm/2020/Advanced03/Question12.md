# 빈도 수 높은 카드 뽑기

## 1. 문제
- 알파벳이 적혀있는 카드 10장 중에 N장의 카드를 선정하고, 선정된 카드들 중에 가장 빈도수가 높은 카드를 출력하는 프로그램을 작성하시오.
- 선정 방식은 카드들 중에 알파벳 사전순으로 가장 뒤에 있는 카드로 선정합니다.

```
ex)
Z Z A Y Y Y K B T A (10장의 카드)

6장을 뽑는다고 하면,

Z Z Y Y Y T(선정된 카드)

이중 가장 빈도수가 높은 'Y'를 출력합니다.
```

## 2. 입력
- 첫 줄: 10장의 카드를 입력받습니다.
- 마지막 줄: 선정할 카드의 수(1 <= N <= 10)

## 3. 출력

- 가장 빈도수가 높은 카드를 출력해주세요.

## 4. 예제 입력

```
ZZAYYYKBTA
6
```

## 5. 예제 출력

```
Y
```

## 6. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int n, index = 0, check[100] = { 0 };
    string s;
    vector<char> result;
    cin >> s >> n;

    
    for (int i = 0; i < s.length(); i++) {
        int size = result.size();
        
        if (size == n && result[result.size() - 1] > s[i]) continue;
        if (size == n) result.pop_back();
        
        result.push_back(s[i]);
        size = result.size();

        for (int j = size - 1; j > 0; j--) {
            if (result[j - 1] < result[j]) swap(result[j - 1], result[j]);
            else break;
        }
    }

    int max = -1, idx = -1;
    for (int i = 0; i < n; i++) {
        check[result[i]]++;

        if (check[result[i]] > max) {
            max = check[result[i]];
            idx = i;
        }
    }

    cout << result[idx];


    return 0;
}

```
