# Score 맞추기

## 1. 문제
```
* 1 ~ 50 사이의 숫자 중 하나의 Score 맞추는 게임을 할려고 합니다.

Exam)
1. Score: 47이라고 가정하겠습니다.

2. 게임을 하는 인원을 입력받습니다. (인원당 Score를 한 번만 외칠수 있습니다.)

2. 처음 사람이 30을 외쳤다면, "UP"이라고 대답합니다.(30 < 47)

3. 두번째 사람이 48을 외쳤다면, "DOWN"이라고 대답합니다.(48 > 47)

5. 마지막 41을 외쳤다면, "UP"이라고 대답합니다.(41 < 47)

6. 이렇게 결국 정답을 못맞췄다면 Score가 있을 범위를 출력합니다.

7. 42 ~ 47

* 위 처럼 진행하는 게임입니다.

[출력 규칙]
- 만약 논리적인 오류가 있는 이력이 발견되면 "ERROR" 라고 출력하세요.
- 만약 정답이 1 개로 좁혀졌다면 정답의 숫자만 출력 해 주세요.

exam input 2)
3
10 UP
35 DOWN
7 DOWN

exam output 2: ERROR

exam input 3)
4
20 UP
23 DOWN
21 UP

exam output 3: 22
```

## 2. 입력
- 첫 줄: 인원 수를 입력받습니다.
- 다음 줄부터: 예상 Score와 Up & Down이 입력됩니다.
- 예상 스코어에 정답을 외치는 경우는 없습니다.

## 3. 출력
-  위의 예제처럼 실행한 후 최종 결과를 출력해주세요.

## 4. 예제 입력
```
4
20 UP
23 DOWN
21 UP
```

## 5. 예제 출력
```
22
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    int n, start = 1, end = 1;
    cin >> n;

    int flag = 0;
    for (int i = 0; i < n; i++) {
        int num;
        string s;
        cin >> num >> s;

        if (s == "UP") start = num + 1;
        else end = num - 1;
        if (start == end) break;
    }

    if (start > end) cout << "ERROR";
    else if (start == end) cout << start;
    else cout << start << " ~ " << end;

    return 0;
}
```
