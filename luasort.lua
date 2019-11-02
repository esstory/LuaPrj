-- lua sort

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

print('--------------------------------------------------------------------')
print('단순 문자 배열 정렬하기')
print('--------------------------------------------------------------------')
local listTable = {"국어", "영어", "수학", 'bbb', 'ccc', 'aaa'}
print(dumpTable(listTable))
table.sort(listTable)
print(dumpTable(listTable))

print('--------------------------------------------------------------------')
print('key=value 테이블 정렬하기')
print('--------------------------------------------------------------------')
local dicTable = {
    {['국적'] = '한국', ['name'] = '영희'},
    {['국적'] ='미국', ['name'] = '철수'},
    {['국적'] = '호주', ['name'] = '가희'},
}

print('소팅전')
print(dumpTable(dicTable))
table.sort(dicTable, function(a,b) return a.name < b.name end)
print('소팅후(이름')
print(dumpTable(dicTable))


table.sort(dicTable, function(a,b) return a['국적'] < b['국적'] end)
print('소팅후(국적')
print(dumpTable(dicTable))
