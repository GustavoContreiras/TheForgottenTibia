masteryButton = nil
masteryWindow = nil

function init()

  connect(LocalPlayer, {
    onLevelChange = onLevelChange,
    onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onSoulChange = onSoulChange,
    onFreeCapacityChange = onFreeCapacityChange,
    onTotalCapacityChange = onTotalCapacityChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onMagicLevelChange = onMagicLevelChange,
    onBaseMagicLevelChange = onBaseMagicLevelChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange
  })
  
  connect(g_game, {
    onGameStart = refresh,
  })
  
  masteryButton = modules.client_topmenu.addRightGameToggleButton('masteryButton', tr('Character Mastery'), '/images/topbuttons/mastery', toggle)
  masteryButton:setOn(true)
  masteryWindow = g_ui.displayUI('mastery')
  
  initialized = true
  
  --refresh()
end

function terminate()
  initialized = false
  masteryWindow:destroy()
  masteryButton = nil
  masteryWindow = nil
end

function show()
end

function hide()
end

function toggle()
  if masteryButton:isOn() then
    masteryWindow:close()
    masteryButton:setOn(false)
  else
    masteryWindow:open()
    masteryButton:setOn(true)
  end
end

function refresh()
  local player = g_game.getLocalPlayer()
  if not player then return end

  local availablePoints = masteryWindow:getChildById('availablePointsValueLabel')
  availablePoints:setText(player)

end

function setSkillValue(localPlayer, id, value)
  local skill = masteryWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setText(value)
end


function onBaseMagicLevelChange(localPlayer, baseMagicLevel)
  setSkillBase('magiclevel', localPlayer:getMagicLevel(), baseMagicLevel)
end


function onBaseSkillChange(localPlayer, id, baseLevel)
    setSkillBase('vitality', localPlayer:getSkillLevel(id), baseLevel)

  setSkillValue(localPlayer, 'attackspeed', ((localPlayer:getSkillBaseLevel(4) - 8)/4 + 100) .. "%")
end











