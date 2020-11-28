# 짝 맞추기 #

## 1. 문제
- B와 F로만 구성된 문장을 입력 받고, 짝인지 판별하는 프로그램을 작성하시오.

- 규칙1. B는 시작을 뜻하고, F는 끝을 뜻합니다.

- 규칙2. B와 F의 개수는 같아야합니다.

- 짝이 맞다면, "짝이맞음", 안 맞다면 "짝이안맞음"을 출력해주세요.

  ```
  ex)
  BFBFBF -> 짝이 맞음
  FBBF -> 짝이 안 맞음(B보다 F가 먼저 시작함)
  BBBFBFFFF -> 짝이 맞음
  BBFBF -> 짝이 안 맞음(F가 하나 부족)
  ```

## 2. 입력
- B와 F로만 구성된 문장을 입력 받아 주세요. (최대 10글자)

## 3. 출력
- 짝인지 판별하고 출력해주세요.

## 4. 예제 입력
```
BFBF
```

## 5. 예제 출력
```
짝이맞음
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
	char ch[1000];
	cin >> ch;
	
	int n = strlen(ch);
	int flag = 0;

	for (int i = 0; i < n; i++) {
		if (flag < 0) break;
		if ('B' == ch[i]) flag++;
		else flag--;
	}

	if (!flag) cout << "짝이맞음";
	else cout << "짝이안맞음";
}
```
