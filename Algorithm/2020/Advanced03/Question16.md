# 알파벳 뒤집기

## 1. 문제
- A ~ S까지 알파벳이 적혀있는 아래의 2차원 배열(3x6)을 하드코딩 해주세요.

```
A B C E F G
H I J K L M
N O P Q R S
```

- 알파벳을 입력받으면, 2차원 배열에 해당 알파벳의 자기 자신과 상하좌우의 알파벳들이 뒤집히면서 '#'으로 바뀝니다.
- 만약 '#'인 곳을 다시 뒤집으면 원래 있던 알파벳으로 원상복구가 됩니다.
- 문자열을 입력받고, 최종 변경결과를 출력하는 프로그램을 작성하시오.

```
ex)
input: BE

[처음 뒤집기 결과(해당 알파벳: B)]
# # # E F G
H # J K L M
N O P Q R S

[마지막 뒤집기 결과(해당 알파벳: E)]
# # C # # G
H # J # L M
N O P Q R S

output)
# # C # # G
H # J # L M
N O P Q R S
```

## 2. 입력
- 문자열을 입력받습니다.

## 3. 출력
- 최종 변경결과를 출력해주세요.

## 4. 예제 입력

```
BE
```

## 4. 예제 출력
```
##C##G
H#J#LM
NOPQRS
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

char map[3][7] = {
    "ABCEFG",
    "HIJKLM",
    "NOPQRS"
};

int check[3][6] = { 0, };

int dat[5][2] = {
    -1, 0,
    1, 0,
    0, 0,
    0, -1,
    0, 1
};

void setFlip(int y, int x) {

    for (int i = 0; i < 5; i++) {
        int dy = y + dat[i][0];
        int dx = x + dat[i][1];

        if (dy >= 0 && dy < 3 && dx >= 0 && dx < 6) check[dy][dx]++;
    }
}

int main()
{
    string s;
    cin >> s;

    for (int x = 0; x < s.length(); x++) {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 6; j++) {
                if (s[x] == map[i][j]) setFlip(i, j);
            }
        }
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 6; j++) {
            if (check[i][j] % 2 == 0) cout << map[i][j];
            else cout << "#";
        }
        cout << "\n";
    }

    return 0;
}
```
