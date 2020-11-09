# 문장에서 인덱스 찾기 #

## 1. 문제
- 대문자로 구성된 문장을 입력받아주세요.
- 그 중, 사전순으로 가장 뒤에 나오는 인덱스와 가장 앞에 나오는 인덱스를 찾아 출력해주세요.

## 2. 입력
- 첫째 줄: 대문자로 구성된 문장을 입력받습니다.

## 3. 출력
- 첫째 줄: 사전순으로 제일 큰 알파벳의 인덱스를 출력한다.
- 둘째 줄: 사전순으로 제일 작은 알파벳의 인덱스를 출력한다.

## 4. 예제 입력
```
PARKSW
```

## 5. 예제 출력
```
5
1
```

## 6. 예제 입력

```
SWIFT
```

## 7. 예제 출력

```
1
3
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char someAlpha[11];
    int cnt = 0;
    int maxIndex = 0, minIndex = 0;

    cin >> someAlpha;

    for (int i = 0; i < 11; i++) {
        if (someAlpha[i] == '\0') break;
        cnt++;
    }
    
    char max = someAlpha[0], min = someAlpha[0];
    for (int i = 1; i < cnt; i++) {
        if (max < someAlpha[i]) {
            max = someAlpha[i];
            maxIndex = i;
        }

        if (min > someAlpha[i]) {
            min = someAlpha[i];
            minIndex = i;
        }
    }

    cout << maxIndex << "\n" << minIndex;
}
```
