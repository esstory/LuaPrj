-- 목적: 루아 테이블 공부하기 
-- print 의 결과는 --> 로 표시
function dumpTable(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            -- key 가 숫자가 아닌 경우 "key" 
            if type(k) ~= 'number' then 
                k = '"'..k..'"' 
            end
            s = s .. '['..k..'] = ' .. dumpTable(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end


local listTable = {}

print('--------------------------------------------------------------------')
print('테이블을 배열/list처럼 사용하기')
print('--------------------------------------------------------------------')


-- 리스트 성격으로 초기화  
listTable = {"철수", "영희", "바둑이"}

print(dumpTable(listTable))
--> { [1] = 철수,[2] = 영희,[3] = 바둑이,} 

-- 숫자 배열 1,2,3 으로 접근 가능
print(listTable[1])
--> 철수

-- 리스트 순회 : 테이블은 1부터 시작 #table 은 테이블 항목 개수 리턴
for i = 1, #listTable do
    print(listTable[i])
end
-->
-- 철수
-- 영희
-- 바둑이


-- 리스트 순회 - key, value 는 pairs(table) 로 구한다.
for k, v in pairs(listTable) do 
    print(k, v)
end
-->
-- 1	철수
-- 2	영희
-- 3	바둑이

-- 리스트 마지막에 추가 
table.insert(listTable, '야옹이')
print(dumpTable(listTable))
--> { [1] = 철수,[2] = 영희,[3] = 바둑이,[4] = 야옹이,} 

-- 리스트 중간에 추가 - 바둑이 자리에 개구리 추가 
table.insert(listTable, 3, '개구리')
print(dumpTable(listTable))
--> { [1] = 철수,[2] = 영희,[3] = 개구리,[4] = 바둑이,[5] = 야옹이,} 

-- 개구리 제거
table.remove( listTable, 3)
print(dumpTable(listTable))
--> { [1] = 철수,[2] = 영희,[3] = 바둑이,[4] = 야옹이,} 



-- 리스트 안에 리스트 
listTable = {}
listTable = {
    {'한국', 'KOREA'},
    {'미국', 'AMERICA'}
}
print(dumpTable(listTable))
--> { [1] = { [1] = 한국,[2] = KOREA,} ,[2] = { [1] = 미국,[2] = AMERICA,} ,} 
-- 새 항목 추가 
table.insert(listTable, {'중국', 'CHINA'})
print(dumpTable(listTable))
--> { [1] = { [1] = 한국,[2] = KOREA,} ,[2] = { [1] = 미국,[2] = AMERICA,} ,[3] = { [1] = 중국,[2] = CHINA,} ,} 

-- 리스트 안에 리스트에 접근
print(listTable[3][2])
--> CHINA

print('--------------------------------------------------------------------')
print('테이블을 MAP 처럼 사용하기')
print('--------------------------------------------------------------------')
-- 테이블 초기화 1: 기본 ['key'] = value
local dicTable = {
    ['KOREA'] = '한국',
    ['AMERICA'] ='미국'
}
print(dumpTable(dicTable))
--> { ["AMERICA"] = 미국,["KOREA"] = 한국,} 

-- 테이블 초기화 2: key = value
local dicTable = {
    KOREA = '한국',
    AMERICA ='미국'
}
print(dumpTable(dicTable))
--> { ["AMERICA"] = 미국,["KOREA"] = 한국,} 

-- 새로운 key/value 추가 방법 table['key'] = value 또는 
-- table.key = value , 단 key 는 영어 알파벳만 가능
dicTable.CHINA = '중국'
dicTable['AUSTRALIA'] = '호주'
print(dumpTable(dicTable))
--> { ["CHINA"] = 중국,["AUSTRALIA"] = 호주,["AMERICA"] = 미국,["KOREA"] = 한국,} 
print(dicTable['CHINA'], dicTable.CHINA)
--> 중국	중국


-- key 존재 여부 체크
if dicTable['GERMANY'] == nil then
    print('key GERMANY not exist')
end
--> key GERMANY not exist

-- key 제거
dicTable.CHINA = nil
print(dumpTable(dicTable))
--> { ["AUSTRALIA"] = 호주,["AMERICA"] = 미국,["KOREA"] = 한국,} 

print('--------------------------------------------------------------------')
print('테이블을 구조체처럼 사용하기')
print('--------------------------------------------------------------------')
local studentTable = {}
studentTable.name = '철수'
studentTable.age = 18
studentTable.grade = {['영어'] = 90, ['수학'] = 80, ['국어']=100}
print(dumpTable(studentTable))
--> { ["age"] = 18,["name"] = 철수,["grade"] = { ["수학"] = 80,["국어"] = 100,["영어"] = 90,} ,} 


print('--------------------------------------------------------------------')
print('테이블을 클래스처럼 써 보자 ')
print('--------------------------------------------------------------------')
function studentTable:new(name, age)
    local instance = { 
        m_name = name,
        m_age = age, 
        m_grade = {['영어'] = 0, ['수학'] = 0, ['국어']=0} 
    }
    
    setmetatable(instance, self)
    self.__index = self
    
    return instance
end

objStudentA = studentTable:new('철수', 18)
objStudentB = studentTable:new('영희', 17)

print(dumpTable(objStudentA))
--> { ["m_name"] = 철수,["m_age"] = 18,["m_grade"] = { ["수학"] = 0,["국어"] = 0,["영어"] = 0,} ,} 
print(dumpTable(objStudentB))
--> { ["m_name"] = 영희,["m_age"] = 17,["m_grade"] = { ["수학"] = 0,["국어"] = 0,["영어"] = 0,} ,} 


