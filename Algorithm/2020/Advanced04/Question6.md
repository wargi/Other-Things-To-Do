# 책 찾기

## 1. 문제
- 사전 순으로 정렬된, 책들 중에 손님들이 원하는 책을 빠르게 찾아 대여 해주려고 합니다.
- N개의 책 이름을 1차원 배열에 입력 받고, 사전순으로 오름차순으로 정렬해주세요. (대문자 < 소문자)
- Binary Search로 책을 찾을려고 합니다. 한번 비교할때마다 1초씩 소요됩니다.
- 찾을 책과 찾는 시간을 입력받고, 입력 받은 시간안에 책을 찾을 수 있다면 "pass", 없다면 "fail"을 출력하는 프로그램을 작성하시오.

```
[Exam]
input)
6 // 책의 권 수
Rabbit Moon Opening Alien Power Ai // 입력받는 책 들
3 // 찾을 권 수
Opening 5 // Opening이라는 책을 5초안에 찾을 수 있는지
Alien 1 // Alien이라는 책을 1초안에 찾을 수 있는지
Ai 3 // Ai이라는 책을 3초안에 찾을 수 있는지

[정렬 전]
Rabbit Moon Opening Alien Power Ai

[정렬 후]
Ai Alien Moon Opening Power Rabbit

output)
pass
fail
pass
```

## 2. 입력
- 첫 줄: 책의 권 수를 입력받습니다.
- 둘 째줄: 책들을 입력받습니다.
- 셋 째줄: 찾을 권 수를 입력받습니다.
- 다음 줄부터: 찾을 책 이름과 제한 시간을 입력받습니다.

## 3. 출력
- 책을 찾을 수 있다면 "pass", 없다면 "fail"을 출력해주세요.

## 4. 예제 입력
```
6
Rabbit Moon Opening Alien Power Ai
3
Opening 5
Alien 1
Ai 3
```

## 5. 예제 출력
```
pass
fail
pass
```

## 6. 코드
```c++
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

int n, m;
vector<string> arr;

struct Question {
    string s;
    int time;
};

void bs(string target, int limit) {
    int s = 0, e = n - 1, cnt = 0;

    while (1) {
        cnt++;
        int mid = (s + e) / 2;

        if (cnt > limit) {
            cout << "fail\n";
            return;
        }

        if (arr[mid] == target) {
            cout << "pass\n";
            return;
        }

        if (arr[mid] < target) s = mid + 1;
        else e = mid - 1;
    }
}

int main()
{   
    vector<Question> q;
    cin >> n;

    for (int i = 0; i < n; i++) {
        string t;
        cin >> t;

        arr.push_back(t);
    }

    sort(arr.begin(), arr.end());

    cin >> m;

    for (int i = 0; i < m; i++) {
        string s;
        int time;

        cin >> s >> time;

        q.push_back({ s, time });
    }

    for (int i = 0; i < m; i++) {
        bs(q[i].s, q[i].time);
    }

    return 0;
}
```
