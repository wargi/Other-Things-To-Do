# 데이트 스케줄

## 1. 문제
- 3명의 이름을 입력받고, 순서대로 데이트를 할 상대를 선택해야 합니다.
- 금 ~ 일요일 까지 총 3일간 3번의 데이트를 하는데, 가능한 경우의 수를 모두 출력해주세요.(같은 사람이 중복되어도 됩니다.)

## 2. 입력
- 3명의 이름을 입력받습니다.

## 3. 출력
- 금 ~ 일요일 까지 총 3일간 3번의 데이트를 하는데, 가능한 경우의 수를 모두 출력해주세요.

## 4. 예제 입력
```
bob jason tom
```

## 5. 예제 출력
```
bob bob bob
bob bob jason
bob bob tom
bob jason bob
bob jason jason
bob jason tom
bob tom bob
bob tom jason
bob tom tom
jason bob bob
jason bob jason
jason bob tom
jason jason bob
jason jason jason
jason jason tom
jason tom bob
jason tom jason
jason tom tom
tom bob bob
tom bob jason
tom bob tom
tom jason bob
tom jason jason
tom jason tom
tom tom bob
tom tom jason
tom tom tom
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

string vect[3];
string path[3];
void dfs(int level) {
    if (level == 3) {
        for (int i = 0; i < 3; i++) cout << path[i] << " ";
        cout << "\n";
        return;
    }

    for (int i = 0; i < 3; i++) {
        path[level] = vect[i];
        dfs(level + 1);
        path[level] = "";
    }
}

int main()
{
    for (int i = 0; i < 3; i++) cin >> vect[i];

    dfs(0);

    return 0;
}
```
