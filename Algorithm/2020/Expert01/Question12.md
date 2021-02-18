# 약재 조합

## 1. 문제
- 뒷산에서 수 많은 한약 재료들을 배열에 담아왔습니다.
- 한약 재료 세가지를 조합하여 한약을 만드려고 합니다.
- 이곳에 쓰인 알파벳(재료)들을 선정해서 **세 자리로 구성된** 새로운 조합(한약)을 만들어보려고 합니다.
- 사전 순으로, 중복없이 만들어지는 모든 조합을 출력 해 주세요.

## 2. 입력
- 최대 20자리의 대문자로 구성된 문자열을 입력받아주세요.

## 3. 출력
- 세 자리로 구성된 한약을 사전 순으로 출력 해주세요.
- 중복없이 한약을 만들어야 합니다. 

## 4. 예제 입력
```
ZFAABABBAB
```

## 5. 예제 출력
```
AAA
AAB
AAF
AAZ
ABB
ABF
ABZ
AFF
AFZ
AZZ
BBB
BBF
BBZ
BFF
BFZ
BZZ
FFF
FFZ
FZZ
ZZZ
```

## 6. 코드
```c++
#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;

char path[4];
char vect[21];
int visit[21];
int sizeT;

void run(int now, int level)
{
    if (level == 3) {
        cout << path << "\n";
        return;
    }

    for (int i = now; i < sizeT; i++) {
        visit[i] = 1;
        path[level] = vect[i];
        run(i, level + 1);
        path[level] = 0;
    }

}

void init() {
    int used[1000] = { 0 };
    char map[21];

    cin >> map;
    sizeT = strlen(map);

    sort(map, map + sizeT);

    int idx = 0;
    for (int i = 0; i < sizeT; i++) {
        if (used[map[i]]) continue;
        used[map[i]]++;
        vect[idx++] = map[i];
    }

    sizeT = idx;
}

int main()
{
    init();

    run(0, 0);

    return 0;
}
```
