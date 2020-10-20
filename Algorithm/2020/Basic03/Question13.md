# 구조체 익혀보기 #

## 1. 문제
```
구조체를 하나 선언하고 내부의 멤버변수 x, y, z를 만들어 주세요.
그 후에, 두 개의 구조체 변수를 만들고 각 각 더한 값을 출력해주세요.
ex)
a.x + b.x = ?
a.y + b.y = ?
a.z + b.z = ?
```

## 2. 입력
- 첫 줄: 세 개의 숫자를 입력받습니다.
- 둘 째줄: 세 개의 숫자를 입력받습니다. 

## 3. 출력
- 더 한 결과 값을 출력해주세요.

## 4. 예제 입력
```
1 5 9
2 7 1
```

## 5. 예제 출력
```
3 12 10
```

## 6. 예제 입력

```
3 6 9
1 1 1
```

## 7. 예제 출력

```
4 7 10
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

struct Data {
    int x;
    int y;
    int z;
};

int main()
{
    Data a;
    Data b;

    cin >> a.x >> a.y >> a.z;
    cin >> b.x >> b.y >> b.z;

    cout << a.x + b.x << "\n";
    cout << a.y + b.y << "\n";
    cout << a.z + b.z;
}
```
