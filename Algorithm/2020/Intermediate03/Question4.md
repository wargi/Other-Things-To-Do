# 에이스 뽑기 #

## 1. 문제
```
1. 아래의 2차원 배열들을(A,B,C) 하드코딩 해주세요.
A(3x3)    B(2x4)      C(2x3)     
2 6 3     6 4 2 4     9 2 3
7 1 1     1 1 5 8     4 2 1
3 4 2 

2. Ace라는 비어있는 2차원 배열(3x3)을 만들고,
	 아래의 조건처럼 채워주세요.
   (0,0) ~ (0,2) -> A배열의 Max값 3개
   (1,0) ~ (1,2) -> B배열의 Min값 3개
   (2,0) ~ (2,2) -> C배열의 Min값 2개, Max값 1개

3. Ace배열의 모든 곳을 채우고 최종 상태를 출력해주세요.
```

## 2. 출력
- 배열의 모든 곳을 조건에 맞게 채우고 최종 상태를 출력해주세요.

## 3. 예제 출력
```
7 6 4
1 1 2
1 2 9
```

## 4. 코드
```c++
#include <iostream>
using namespace std;

int mapA[3][3] = {
    2, 6, 3,
    7, 1, 1,
    3, 4, 2
};

int mapB[2][4] = {
    6, 4, 2, 4,
    1, 1, 5, 8
};

int mapC[2][3] = {
    9, 2, 3,
    4, 2, 1
};

int getMax(int y, int x, char ch) {
    int max = -1, dy, dx;

    for (int i = 0; i < y; i++) {
        for (int j = 0; j < x; j++) {
            int x;
            if ('A' == ch) x = mapA[i][j];
            else if ('B' == ch) x = mapB[i][j];
            else x = mapC[i][j];

            if (x > max && x <= 100) {
                max = x;
                dy = i;
                dx = j;
            }
        }
    }

    if ('A' == ch) mapA[dy][dx] = -1;
    else if ('B' == ch) mapB[dy][dx] = -1;
    else x = mapC[dy][dx] = -1;

    return max;
}

int getMin(int y, int x, char ch) {
    int min = 999999, dy, dx;

    for (int i = 0; i < y; i++) {
        for (int j = 0; j < x; j++) {
            int x;
            if ('A' == ch) x = mapA[i][j];
            else if ('B' == ch) x = mapB[i][j];
            else x = mapC[i][j];

            if (x < min && x > -1) {
                min = x;
                dy = i;
                dx = j;
            }
        }
    }

    if ('A' == ch) mapA[dy][dx] = 99999;
    else if ('B' == ch) mapB[dy][dx] = 99999;
    else x = mapC[dy][dx] = 99999;

    return min;
}

int main()
{
    int map[3][3];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            int x;
            if (i == 0 || (i == 2 && j == 2)) x = getMax(3, 3, 'A' + i);
            else if (i == 1) x = getMin(2, 4, 'B');
            else x = getMin(2, 3, 'C');
            map[i][j] = x;
        }
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cout << map[i][j] << " ";
        }
        cout << "\n";
    }
}
```
