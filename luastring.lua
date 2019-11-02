-- 목적: 루아 문자열 예제

local sEng = 'abc'
local sKor = '가나다'

print('\n\n--------------------------------------------------------------------')
print('문자열 길이 - strin.len')
print('--------------------------------------------------------------------')
local nLen1  = string.len(sEng)
local nLen2  = string.len(sKor)
print('문자열 길이', nLen1, nLen2)
--  [Outpt] 문자열 길이	3	9

local sText = '   *# They said: "Of course." and you said "Thank you" #*   '
print('원문:', sText)
-- [Outpt] 원문:    *# They said: "Of course." and you said "Thank you" #*

print('\n\n--------------------------------------------------------------------')
print('문자열 Trim - 공백제거')
print('--------------------------------------------------------------------')
local sText2 = string.gsub(sText, '%s', '')
-- %s는 공백문자를 의미 
print('공백제거:', sText2)
-- [Outpt] 공백제거: #Theysaid:"Ofcourse."andyousaid"Thankyou"#*
-- 루아는 trim Left, trimRight 같은 함수가 없어서 모든 공백을 제거해 버린다. 


print('\n\n--------------------------------------------------------------------')
print('특정 문자열 위치 찾기')
print('--------------------------------------------------------------------')
local nStart, nEnd = string.find(sText, 'They')
print('"They" 단어 시작 및 끝 위치:', nStart, nEnd)
-- [Outpt] "They" 단어 시작 및 끝 위치:	7	10
if string.find(sText, 'They') ~= nil then 
    print('They 문자열 있음')
end
if string.find(sText, 'young') == nil then 
    print('young 문자열 없음')
end
nStart, nEnd = string.find(sText, 'She')
print('"She" 문자 찾기 [Outpt]', nStart, nEnd)
-- find 로 못찾을 경우에는 nil 을 리턴한다.
-- [Outpt] "She" 문자 찾기 [Outpt]	nil	nil


print('\n\n--------------------------------------------------------------------')
print('특정위치 문자열 가져오기')
print('--------------------------------------------------------------------')
local sSubText = string.sub(sText, 7, 10)
print('7~10 위치 문자 가져오기:',sSubText)
-- [Outpt] 7~10 위치 문자 가져오기:	They



print('\n\n--------------------------------------------------------------------')
print('sText 내의 특정 단어를 변경 해서 sText2 에 저장')
print('--------------------------------------------------------------------')
sText2 = string.gsub(sText, 'They', 'He')
print('They --> He 로 변경:',sText2)
-- [Outpt] They --> He 로 변경:	   *# He said: "Of course." and you said "Thank you" #*   

print('\n\n--------------------------------------------------------------------')
print('소문자 만들기')
print('--------------------------------------------------------------------')
sText2 = string.lower( sText)
print('소문자 만들기:', sText2)
-- [Outpt] 소문자 만들기:	   *# they said: "of course." and you said "thank you" #*   
 
print('\n\n--------------------------------------------------------------------')
print('문자열 포맷- c 와 유사 ')
print('--------------------------------------------------------------------')
local Pie = 3.14159
sText2 = string.format('%.2f', Pie)
print('Pie =', sText2)
-- [Outpt] Pie = 3.14
 
print('\n\n--------------------------------------------------------------------')
print('문자열을 공백으로 split 하기')
print('--------------------------------------------------------------------')
for value in string.gmatch(sText, "%S+") do 
    print(value)
end

 
print('\n\n--------------------------------------------------------------------')
print('문자/숫자 전환 ')
print('--------------------------------------------------------------------')
local sText4 = "3.14"
local fData = tonumber(sText4)
fData = fData + 0.1
print('문자열 3.14 숫자로 바꾸기:', fData, type(fData))
-- [Outpt] 문자열 3.14 숫자로 바꾸기:	3.24	number


sText4 = "1024"
local nData = tonumber(sText4)
print('문자열 1024 숫자로 바꾸기:', nData, type(nData))
-- [Outpt] 문자열 1024 숫자로 바꾸기:	1024	number

sText5 = tostring(fData)
print(sText5, type(sText5))
-- [Outpt] 3.24	string

sText5 = tostring(nData)
print(sText5, type(sText5))
-- [Outpt] 1024	string
