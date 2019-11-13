-- lua math 라이브러리 
-- http://lua-users.org/wiki/MathLibraryTutorial

-- print 의 결과는 --> 로 표시
local function dumpTable(o)
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


-- math.ceil , math.floor
local number1 = 1.3
print(number1)


local function testNumber(dValue)
    -- math.floor - x 보다 작은 최대 정수를 리턴
    local nNum1 = math.floor( dValue )
    print(dValue, '보다 작은 최대 정수', nNum1)
    
    -- math.ceil(x) x 보다 큰 최소 정수를 리턴
    local nNum2 = math.ceil( dValue )
    print(dValue, '보다 큰 최소 정수', nNum2)
    --> 1.3	보다 큰 최소 정수	2
end


testNumber(1.3)
--> 1.3	보다 작은 최대 정수	1
--> 1.3	보다 큰 최소 정수	2
    
testNumber(1.6)
--> 1.6	보다 작은 최대 정수	1
--> 1.6	보다 큰 최소 정수	2

-- 절대값
print(math.abs(-100))
--> 100
-- 480 / 360 의 나머지 
print(math.fmod(480, 360))
--> 120

-- 2의 3승 
print(math.pow(2, 3))
--> 8.0

