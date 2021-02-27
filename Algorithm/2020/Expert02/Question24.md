# "HITSWARGI"

## 1. 문제

- n을 입력받고 n개의 문자열을 1차원 배열에 입력받습니다. 
- 이제, n개의 문자열 중 2개만 조합하여 새로운 문자열을 만들려고 합니다.
- 처음 선택한 문자열은 반드시 두 번째 선택한 문자열보다 더 왼쪽에 있어야 합니다.
- 2개의 문자열을 선택하여 "HITSWARGI" 이라는 문장을 만들 수 있는 경우가 총 몇 가지인지 출력하는 프로그램을 작성해주세요.

```
1. 만약, 7개의 문장을 입력받았다면
HITS HI HITSW WARGI SWA RGI ARGI

2. 만들 수 있는 경우의 수는
0번 index + 3번 index = HITSWARGI
2번 index + 6번 index = HITSWARGI
답은 '2'입니다.
```

## 2. 입력

- n을 입력받고 n개의 문자열을 1차원 배열에 입력받습니다. 

## 3. 출력

- 2개의 문자열을 선택하여 "HITSWARGI" 이라는 문장을 만들 수 있는 경우가 총 몇 가지인지 출력해주세요.


## 4. 예제 입력
```
HITS HI HITSW WARGI SWA RGI ARGI
```

## 5. 예제 출력
```
2
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
     string s[1000];
     int n;
     cin >> n;

     for (int i = 0; i < n; i++) {
         cin >> s[i];
     }

     int cnt = 0;
     for (int i = 0; i < n - 1; i++) {
         for (int j = i + 1; j < n; j++) {
             if (s[i] < s[j] && s[i] + s[j] == "HITSMUSIC") cnt++;
         }
     }

     cout << cnt;

    return 0;
}
```
