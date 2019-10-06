-- 목적: 루아 함수 call by value, call by reference 확인
-- call by value :  nil, booleans, numbers , strings
-- call by ref : table, function, thread, userdata

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


function adjustSimplePos(nScreenW, posX) 
    if nScreenW == 360 then 
        return posX
    end	
    
    local newPos = (nScreenW / 360) * posX
    -- 소수점은 버리자
    return math.floor(newPos)
end

-- 목적: 가로 360 을 기준으로 한 좌표를 현재 화면에 맞게 조정 
function adjustPos(nScreenW, posX) 
    if type(posX) == 'table' then
        local newPosX = {}
        for k,v in pairs(posX) do
            -- table.insert(newPosX, adjustSimplePos(nScreenW, posX[i]))
            newPosX[k] = adjustSimplePos(nScreenW, v)
        end
        return newPosX
    else
        return adjustSimplePos(nScreenW, posX)
    end
end

function adjustRect(nScreenW, x, y, width, height)
    local retRect = Rect(x, y, width, height)
    retRect.x = adjustSimplePos(nScreenW, x)
    retRect.width = adjustSimplePos(nScreenW, width)
end

local newPos = adjustPos(480, 14)
print(newPos)


local tempTable = {0, 160, 360}
print(dumpTable(tempTable))
local newTable = adjustPos(480, tempTable)
print(dumpTable(newTable))

newTable = adjustPos(240, {x = 15, width = 180})
print(dumpTable(newTable))