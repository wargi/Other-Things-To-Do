# 문자의 수

## 1. 문제
- 4x4 2차원 배열이 주어질 때 문자 2개를 입력받아 각각 입력받은 문자가 몇 개인지 출력하는 프로그램을 작성하시오.

## 2. 입력
- 4x4 행렬의 정보가 16 개의 문자로 주어진다.
- 그 후, 문자 2개를 입력받는다.
- 각 문자는 A 에서 Z 사이 이다.

## 3. 출력
- 입력받은 문자들의 개 수를 출력한다.

## 4. 예제 입력
```
ABKT
KFCF
BBQQ
TPZF
B F
```

## 5. 예제 출력
```
6
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

char arr[4][5];

int getCount(char n) {
    int cnt = 0;

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) if (arr[i][j] == n) cnt++;
    }

    return cnt;
}

int main()
{
  	for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        cin >> arr[i][j];
      }
    }
  
    char n, m;
    cin >> n >> m;

    cout << getCount(n) + getCount(m);
}
```
