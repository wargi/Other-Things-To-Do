# 배열에서 숫자 찾기

## 1. 문제

```
아래의 2차원 배열(3x3)을 하드코딩 해주세요.
3 5 9
4 2 1
5 1 5
```



- 숫자 세 개를 각 각 입력받아주세요.
- 세 개의 입력받은 숫자가 위의 2차원 배열에 존재하는지 출력해주세요.

## 2. 입력
- 첫 번째 줄: 숫자 세 개를 각 각 입력받아주세요.

## 3. 출력

- 입력받은 숫자가 배열에 존재하는지를 출력해주세요.


## 4. 예제 입력
```
1 2 7
```

## 5. 예제 출력
```
1:존재
2:존재
7:미발견
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int arr[3][3] = {
    3, 5, 9,
    4, 2, 1,
    5, 1, 5
};

void isExist(int n) {
    bool flag = false;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (arr[i][j] == n) flag = true;
        }
    }

    if (flag) cout << n << ":존재";
    else cout << n << ":미발견";
}

int main()
{
    int n, m, o;

    cin >> n >> m >> o;

    isExist(n);
    cout << "\n";
    
    isExist(m);
    cout << "\n";
    
    isExist(o);
    cout << "\n";
}
```
