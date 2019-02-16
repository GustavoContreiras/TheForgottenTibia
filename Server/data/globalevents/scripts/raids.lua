local raids = {
    ['Monday'] = {
        ['21:00'] = {raidName = 'Orcs'}
    },
    ['Tuesday'] = {
        ['21:00'] = {raidName = 'Amazons'}
    },
    ['Wednesday'] = {
        ['21:00'] = {raidName = 'Cyclops'}
    },
    ['Thursday'] = {
        ['21:00'] = {raidName = 'Undeads'}
    },
    ['Friday'] = {
        ['21:00'] = {raidName = 'Lizards'}
    },
    ['Saturday'] = {
        ['15:00'] = {raidName = 'Barbarians'}
    },
    ['Sunday'] = {
        ['21:00'] = {raidName = 'Dragons'}
    }
}

local function getRealDate()
    local month = tonumber(os.date("%m", os.time()))
    local day = tonumber(os.date("%d", os.time()))
 
    if month < 10 then
        month = '0' .. month
    end
    if day < 10 then
        day = '0' .. day
    end
    return day .. '/' .. month
end

local function getRealTime()
    local hours = tonumber(os.date("%H", os.time()))
    local minutes = tonumber(os.date("%M", os.time()))
 
    if hours < 10 then
        hours = '0' .. hours
    end
    if minutes < 10 then
        minutes = '0' .. minutes
    end
    return hours .. ':' .. minutes
end
 
function onThink(interval, lastExecution, thinkInterval)
    local day, date = os.date('%A'), getRealDate()
 
    local raidDays = {}
    if raids[day] then
        raidDays[#raidDays + 1] = raids[day]
   end
    if raids[date] then
        raidDays[#raidDays + 1] = raids[date]
   end
 
    if #raidDays == 0 then
       return true
    end
 
    for i = 1, #raidDays do
       local settings = raidDays[i][getRealTime()]
        if settings and not settings.alreadyExecuted then
            Game.startRaid(settings.raidName)
            settings.alreadyExecuted = true
        end
    end
 
    return true
end