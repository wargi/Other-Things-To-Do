# 문자 필터 서비스

## 1. 문제

- 문자 메세지에 보기 싫은 단어가 있으면, 모두 3개의 #으로 (###) 모자이크 처리하려고 합니다.
- 문자메세지 필터기능을 완성시켜주세요.
- 모자이크 처리 할 **5개의 위험 단어**들은 다음과 같습니다.

```
chicken
pizza
jockbal
bread
samhap
```

- **대소문자 구분 없이 위험 단어가 있으면 모자이크 처리 해 주세요.**

## 2. 입력

- 문장의 길이가 최대 50 글자인 한 문장을 입력 받습니다.

## 3. 출력

- 모자이크해야할 단어를 길이에 상관없이 "###" 로 바꿔 문장을 출력해주세요.

## 4. 입력 예제

```
HeyBread!DoYouWannaBuildAChicken
```

## 5. 출력 예제

```
Hey###!DoYouWannaBuildA###
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

string arr[5] = {
    "chicken",
    "pizza",
    "jockbal",
    "bread",
    "samhap"
};

int main()
{
    string s, ts;
    cin >> s;

    ts = s;

    for (int i = 0; i < s.length(); i++) {
        if (s[i] >= 'A' && s[i] <= 'Z') ts[i] = s[i] + 32;
    }

    for (int i = 0; i < s.length(); i++) {
        int flag = 0, idx = 0;
        for (int j = 0; j < 5; j++) {
            int size = s.length() - (i + arr[j].length());
            if (size < 0) continue;
            
            string t = ts.substr(i, arr[j].size());

            if (arr[j] == t) {
                s.replace(i, arr[j].size(), "###");
                ts.replace(i, arr[j].size(), "###");
            }
        }
    }

    cout << s;

    return 0;
}
```
