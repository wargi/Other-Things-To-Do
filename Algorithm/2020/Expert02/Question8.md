# 가장 큰 2진수 찾기 #

## 1. 문제

- 0과 1로 된 2진수 3개를 입력받습니다.
- 3개의 2진수 중에 가장 큰 2진수를 출력하는 프로그램을 작성하시오.
- 단, 10진수로 변환하지 않고 비교하여 판별해주세요.

## 2. 입력
- 2진수 3개를 입력 받는다.

## 3. 출력
- 3개의 2진수 중에 가장 큰 2진수를 출력해주세요.

## 4. 예제 입력
```
1100
1011
10001
```

## 5. 예제 출력
```
10001
```

## 6. 예제 입력

```
11011
1110110
1010011
```

## 7. 예제 출력

```
1110110
```

## 8. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

string getCompare(string x, string y) {
    int xl = x.size();
    int yl = y.size();
    string result;

    if (xl > yl) {
        result = x;
    }
    else if (xl < yl) {
        result = y;
    }
    else {
        for (int i = 0; i < xl; i++) {
            if (x[i] == y[i]) continue;
            if (x[i] > y[i]) result = x;
            else result = y;
            break;
        }
    }

    return result;
}

int main()
{
    string a, b, c, r;

    cin >> a >> b >> c;

    r = getCompare(a, b);
    r = getCompare(r, c);
    
    cout << r;

    return 0;
}
```
