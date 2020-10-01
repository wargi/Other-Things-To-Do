# 알파뱃의 총 개수 찾기

## 1. 문제

```
아래의 1차원 배열(1x6)을 하드코딩 해주세요.
B T K I G Z
```

- 1차원 배열(1x4)을 만들고 네 개의 문자를 입력받아주세요. 
- 입력받은 문자 중에 위의 하드코딩한 배열에 총 몇 개의 문자가 존재하는지 출력해주세요.

## 2. 입력
- 첫 줄에 네 개의 문자를 입력받아주세요. 

## 3. 출력

- 입력받은 문자 중에 위의 하드코딩한 배열에 총 몇 개의 문자가 존재하는지 출력해주세요.


## 4. 예제 입력
```
A B Y Z
```

## 5. 예제 출력
```
2
```

## 6. 예제 입력

```
K I N G
```

## 7. 예제 출력

```
3
```

## 8. 코드

```c++
#include <iostream>
using namespace std;


int main()
{
    char vect[7] = { "BTKIGZ" };
    char target[5];
    int cnt = 0;

    cin >> target[0];
    cin >> target[1];
    cin >> target[2];
    cin >> target[3];

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 6; j++) {
            if (target[i] == vect[j]) {
                cnt++;
                break;
            }
        }
    }

    cout << cnt;
}
```
