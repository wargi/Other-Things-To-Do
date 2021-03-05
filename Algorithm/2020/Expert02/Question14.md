# 자동 계산기 #

## 1. 문제
- '+' 와 '-' 기호가 들어있는 수식을 입력받고, 자동으로 계산해주는 프로그램을 작성 해 주세요.

> **[힌트]**
> Parsing을 하기 위한 메서드가 불충분하다면, 필요한 함수를 직접 구현하는 것이 좋습니다.

## 2. 입력
- 수식을(문자열) 입력받습니다.

> **[세부조건]**
>
> 1. 괄호는 없습니다.
>
> 2. 첫 번째 수는 양수 또는 음수가 될 수 있습니다.
>
> 3. '+'와 '-'이외 문자는 입력되지 않습니다.
>
> 4. 띄어쓰기 없이 입력이 됩니다.
>
> 5. 문자열 길이 최대값 : 1000
>
> 6. 최종 결과는 음수가 될 수 있습니다.
>
> 7. 첫번째 수가 양수라면 '+' 기호가 생략됩니다.

## 3. 출력
- 수식의 결과를 출력해주세요.

## 4. 예제 입력
```
100+100-50+30
```

## 5. 예제 출력
```
180
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main()
{
	string s;
	vector<int> arr;
	cin >> s;

	int size = s.length();
	
	int start = 0, sum = 0;
	for (int i = 0; i < size; i++) {
		if (i != 0 && (s[i] == '+' || s[i] == '-')) {
			string res;

			if(s[start] == '+' || s[start] == '-') res = s.substr(start + 1, i - start - 1);
			else res = s.substr(start, i - start);

			int num = stoi(res);

			if (s[start] == '-') sum -= num;
			else sum += num;

			start = i;
		}
	}

	string res;

	if (s[start] == '+' || s[start] == '-') res = s.substr(start + 1, size - start - 1);
	else res = s.substr(start, size - start);

	int num = stoi(res);

	if (s[start] == '-') sum -= num;
	else sum += num;

	cout << sum;

	return 0;
}

```
