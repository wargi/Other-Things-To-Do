# 공개 투표

## 1. 문제
- 공개 투표를 진행하여 국회의원을 뽑습니다.
- N명이 투표를 진행합니다.
- 가장 투표를 많이 받은 국회의원을 찾고, 당선된 국회의원에게 표를 선사한 사람들을 출력하는 프로그램을 작성하시오.
- 국회의원은 숫자로 되어있습니다.
- 만약 투표수가 같다면, 숫자가 빠른 국회의원이 당선됩니다.

## 2. 입력
- 첫 줄: 국회의원의 수와 시민의 수를 입력받습니다.
- 다음 줄 부터: 투표한 국회의원 번호와 투표한 시민의 이름을 입력받습니다.

## 3. 출력
- 당선된 국회의원에게 표를 선사한 사람들을 출력해주세요.

## 4. 예제 입력
```
5 12
0 sam
1 sammy
3 sole
2 coo
0 luke
1 haily
2 elly
3 hoo
2 kim
2 joon
4 john
4 loo
```

## 5. 예제 출력
```
coo elly kim joon
```

## 6. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

vector<string> arr[100];

int main() {
    int n, m, max = -1, maxIndex;
    cin >> n >> m;

    for(int i = 0; i < m; i++) {
        int idx;
        string s;

        cin >> idx >> s;

        arr[idx].push_back(s);
        int size = arr[idx].size();
        
        if (size > max) {
            max = arr[idx].size();
            maxIndex = idx;
        }
    }

    for(int i = 0; i < arr[maxIndex].size(); i++) cout << arr[maxIndex][i] << " ";

    return 0;
}
```
