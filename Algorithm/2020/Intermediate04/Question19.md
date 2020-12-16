# 이진트리 만들기

## 1. 문제
- 숫자 한 개를 입력받고, 해당 숫자까지의 레벨(높이)을 가진 이진 트리를 만들어주세요.

## 2. 입력
- 숫자 한 개를 입력받습니다.

## 3. 출력
- 재귀함수가 시작될 때의 레벨을 출력해주세요.

## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
012332331233233
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

void run(int level, int end) {
    cout << level;
    if (level == end) return;
    for (int i = 0; i < 2; i++) {
        run(level + 1, end);
    }
}

int main()
{
    int level;
    cin >> level;
    run(0, level);
}
```
