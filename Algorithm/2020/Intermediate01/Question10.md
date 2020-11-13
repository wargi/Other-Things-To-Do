# 청소 스케줄 만들기 #

## 1. 문제
- n명의 친구를 입력받고, 4일치의 청소스케줄을 만들려고 합니다.
- 한 명의 친구가 매일 청소를 할 수도 있고, 여러 친구가 할 수도 있습니다.
- 모든 가능한 경우의 수를 출력해주세요.

## 2. 입력
- n을 입력받는다.(1 <= n)

## 3. 출력
- 모든 가능한 경우의 수를 출력해주세요.

## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
1111
1112
1121
1122
1211
1212
1221
1222
2111
2112
2121
2122
2211
2212
2221
2222
```

## 6. 예제 입력

```
1
```

## 7. 예제 출력

```
1111
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

char map[5];
void cleaner(int start, int end, int branch) {
    if (start == end) {
        cout << map << "\n";
        return;
    }

    for (int i = 1; i <= branch; i++) {
        map[start] = '0' + i;
        cleaner(start + 1, end, branch);
    }
}

int main()
{
    int n;
    cin >> n;
    cleaner(0, 4, n);
}
```
