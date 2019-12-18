'''
String 조작하기

1. 글자 합체

2. 글자 삽입(수술)

3. 글자 자르기

'''

# 1. 글자 합체

name = "happy" + " " + "hacking"

print(name)

# 2. 글자 삽입

first = "tony"
age = 20

text = "안녕하세요. 제 이름은 {}입니다. 나이는 {}입니다." .format(first, age)
print(text)

test_name = text[:15]
print(test_name)

text_age = text[15:]
print(text_age)

text_split = text.split()
print(text_split)