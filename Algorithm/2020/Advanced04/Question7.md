# 문장 사이의 문장찾기 #

## 1. 문제
- 검사할 문장 하나를 입력받고, 여러가지 문장들을 입력 받은 후 해당 문장에 검사할 문장이 포함 되어있는지 판별하는 프로그램을 작성해주세요.

## 2. 입력 

- 첫 줄: 문장 사이에 들어있는 문장을 입력받습니다.
- 둘째 줄: 몇개의 문장을 받을지 입력받습니다.
- 다음 줄부터: 문장들을 입력 받습니다.

## 3. 출력

- 입력받은 문장사이에 검사할 문장이 포함되어 있으면 "O", 없다면 "X"를 출력해주세요.

## 4. 입력 예시

```
Apple
5
Swift
AcadeByApple
Hello,iOS
DesignByApple
hi,Apple
```

## 5. 출력 예시

```
X
O
X
O
O
```

## 6. 코드

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main()
{
    int n;
    string s;
    vector<string> t;
    cin >> s >> n;

    for (int i = 0; i < n; i++) {
        string temp;
        cin >> temp;

        t.push_back(temp);
    }

    for (int i = 0; i < n; i++) {
        int flag = 0;
        for (int j = 0; j <= t[i].length() - s.length(); j++) {
            string sub = t[i].substr(j, s.size());
            if (sub == s) {
                flag = 1;
                break;
            }
        }
        if (flag) cout << "O\n";
        else cout << "X\n";
    }
}
```
