# 긴 문장 정렬

## 1. 문제

- 세 문장을 입력 받아 배열에 저장하고, 가장 긴 문장과 맨 앞에 입력받은 문장을 swap하고 출력해주세요.

## 2. 입력
- 세 문장을 입력 받아주세요.

## 3. 출력

- 가장 긴 문장과 맨 앞에 입력받은 문장을 swap하고 출력해주세요.

## 4. 예제 입력

```
WAR
ABCDEFG
GIP
```

## 5. 예제 출력
```
ABCDEFG
WAR
GIP
```

## 6. 코드

```c++
#define _CRT_SECURE_NO_WARNINGS

#include <iostream>
#include <cstring>

using namespace std;

int main()
{
    char str1[100];
    char str2[100];
    char str3[100];

    cin >> str1 >> str2 >> str3;

    int a = strlen(str1);
    int b = strlen(str2);
    int c = strlen(str3);

    if (b >= a && b >= c)
    {
        char temp[100] = "";
        strcpy(temp, str1);
        strcpy(str1, str2);
        strcpy(str2, temp);

    }
    else if (c >= a && c >= b)
    {
        char temp[100] = "";
        strcpy(temp, str1);
        strcpy(str1, str3);
        strcpy(str3, temp);
    }

    cout << str1 << "\n";
    cout << str2 << "\n";
    cout << str3;
} 
```
