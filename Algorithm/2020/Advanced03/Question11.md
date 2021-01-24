# 회원 관리

## 1. 문제
- 회원 관리를 위해 기존 시스템의 회원들의 아이디를 변경할려고 합니다. 아래의 규칙에 어긋난 회원 아이디가 있다면 변경해주세요.
- [규칙]

1. 모두 대문자
2. 첫 글자 대문자 나머지 소문자

- 변경이 끝난 뒤에 정렬하여 출력하는 프로그램을 작성해주세요.

```
[변경 규칙]
첫 글자 대문자이고, 나머지 소문자 // 변경하지 않습니다.
소문자로만 이루어진 회원들 // 첫 글자 대문자, 나머지 소문자로 아이디로 변경합니다.
그 밖에 대소문자가 섞여있는 회원들 // 모두 대문자로 아이디를 변경합니다.
```

## 2. 입력
- 첫 줄: 회원 명 수 n이 주어진다.
- 다음줄부터 n개의 아이디들이 입력된다.

## 3. 출력
- 변경이 끝난 뒤에 정렬하여 출력하세요.

## 4. 예제 입력
```
5
redeye
apple
Steve
Berry
eUnBo
```

## 5. 예제 출력
```
Apple
Berry
EUNBO
Redeye
Steve
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

vector<string> s;

string check(string a) {
    int first = 0, size = a.length();
    int low = 0, up = 0;

    for(int i = 0; i < size; i++) {
        if(i == 0 && a[i] >= 'A' && a[i] <= 'Z') first = 1;
        else 
        {
            if(a[i] >= 'A' && a[i] <= 'Z') up++;
            else low++;
        }
    }

    if(first && low && !up) return a;
    if(!first && low && !up) {
        a[0] -= 32;
        return a;
    }

    for(int i = 0; i < size; i++) {
        if(a[i] > 96) a[i] -= 32;
    }

    return a;
}

int main() {
    int n;
    cin >> n;
    
    for(int i = 0; i < n; i++) {
        string t;
        cin >> t;

        t = check(t);
        
        s.push_back(t);
    }

    sort(s.begin(), s.end());

    for(int i = 0; i < n; i++) cout << s[i] << "\n";

    return 0;
}
```
