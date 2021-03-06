# E-mail 구분하기

## 1. 문제
- 하나의 문자열에 여러 e-mail 주소가 저장되어 있습니다.
- 각 Email은 '|' bar를 구분기호로 나누어져 있습니다.

```
bbq@mcdonald.co.kr|jyp@sam.com|imac@donald.com
```

- 메일 주소는 [이름] @ [도메인이름] [최상위도메인] 형태로 구성되어 있습니다.
- 각 Email 주소에서 [이름] 과 [도메인이름]만 추출 해 주세요.
- 그리고 추출된 문자열을 정리하여 아래와 같은 Format으로 출력 해 주세요.
- **[#이름] 도메인이름**



## 2. 입력
- 문자열을 입력받습니다.

> **[세부사항]**
>
> 1. 잘못된 Email 형식은 입력받지 않습니다.
>
> 2. .co.kr .com 외 다양한 최상위도메인이 입력으로 주어질 수 있습니다.

## 3. 출력
- 추출된 문자열을 정리하여 **[#이름] 도메인이름** 식으로 출력 해 주세요.

## 4. 예제 입력
```
bbq@mcdonald.co.kr|jyp@sam.com|imac@donald.com
```

## 5. 예제 출력

```
[#bbq] mcdonald
[#jyp] sam
[#imac] donald
```

## 6. 코드

```c++
#include <iostream>
#include <vector>
#include <string>
using namespace std;

string s;
vector<string> v;
void branch(string str) {
	int start = 0;
	while (1) {
		int a = str.find('|', start);
		
		if (a == -1) {
			string res = s.substr(start, s.length() - start);
			v.push_back(res);
			return;
		}

		string res = s.substr(start, a - start);
		v.push_back(res);
		start = a + 1;
	}
}

string reName(string str) {
	int a = str.find('@', 0);
	int b = str.find('.', a);

	string title = str.substr(0, a);
	string subTitle = str.substr(a + 1, b - a - 1);

	return "[#" + title + "] " + subTitle;
}

int main()
{
	cin >> s;

	branch(s);

	for (int i = 0; i < v.size(); i++) {
		v[i] = reName(v[i]);
		cout << v[i] << "\n";
	}


	return 0;
}

```
