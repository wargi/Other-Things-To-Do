# 문장 정렬하기

## 1. 문제
- 길이가 다른 문장 네 개를 입력받습니다.

- 문장들을 오름차순으로 정렬해서 출력해주세요.



## 2. 입력
- 길이가 다른 문장 네 개를 입력받습니다.

## 3. 출력
- 문장들을 오름차순으로 정렬해서 출력해주세요.

## 4. 예제 입력
```
abc
defg
hi
jklmn
```

## 5. 예제 출력
```
hi
abc
defg
jklmn
```

## 6. 코드
```c++
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char ch[4][11];
    char result[4][11];

    for (int i = 0; i < 4; i++) cin >> ch[i];

    for (int i = 0; i < 3; i++) {
        for (int j = i + 1; j < 4; j++) {
            if (strlen(ch[i]) > strlen(ch[j]))
            {
                char temp[11];
                strcpy(temp, ch[i]);
                strcpy(ch[i], ch[j]);
                strcpy(ch[j], temp);
            }
            else if (strlen(ch[i]) == strlen(ch[j]))
            {
                if (strcmp(ch[i], ch[j]) == 1)
                {
                    char temp[11];
                    strcpy(temp, ch[i]);
                    strcpy(ch[i], ch[j]);
                    strcpy(ch[j], temp);
                }
            }
        }
    }

    for (int i = 0; i < 4; i++) {
        cout << ch[i] << "\n";
    }
}
```
