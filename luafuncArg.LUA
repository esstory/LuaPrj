
function dumpTable(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
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


print('-------------------------')
print('table 을 새로 만들어 리턴')
print('-------------------------')

-- table 을 만들어 리턴해 보자 
function testfunc()
    local var = {}
    var.x = 100
    var.y = 200
    var.z = {}
    var.z.a = 'aaa'
    
    return var
end


local tempTable = testfunc()
local tablevalue = dumpTable(tempTable)
print(tablevalue)

print('-------------------------')
print('nil, boolean, number, string 은 call by value 로 처리된다.')
print('-------------------------')


function stringTest(arg)
    arg = 'newabc'
    print('arg:'..arg)
end

local sTest = "abc"
print('sTest:'..sTest)
stringTest(sTest)

print('문자열은 call by value 라 변하지 않는다')
print('sTest:'..sTest)

print('-------------------------')
print('함수 인자로 테이블을 넘기면 call by ref 라 넘긴 변수를 수정하면 같이 변경된다')
print('-------------------------')

-- 
-- Tables, functions, threads, and (full) userdata values are objects: variables do not actually contain these values, only references to them. Assignment, parameter passing, and function returns always manipulate references to such values; these operations do not imply any kind of copy.
function tableTest(arg)
    print('인자 type:'..type(arg))
    if arg == nil then
        arg = {}
    end
    
    arg.x = 'new X'
    print('arg.x:'..arg.x)
end

local tempTable2 = {}
tempTable2.x = 'X'
print('tempTable2.x:'..tempTable2.x)
tableTest(tempTable2)
print('테이블을 함수 인자로 넘기면 call by ref 로 작동한다.')
print('tempTable2.x:'..tempTable2.x)


print('-------------------------')
print('테이블 내에 변수로 nil, table 을 넣고 각각 함수 인자로 넘겨도 같은 rule 로 작동한다.')
print('-------------------------')

-- 테이블 안에 테이블
dim1 = {}
dim2 = nil

dims = {x = dim1, y = dim2}
print('dims.x:'..dumpTable(dims.x))
print(dims.y)

tableTest(dims.x)
tableTest(dims.y)

print('dims.x:'..dumpTable(dims.x))
print('dim1:'..dumpTable(dim1))
print(dims.y)



