masteryButton = nil
masteryWindow = nil

function init()
  masteryButton = modules.client_topmenu.addRightGameToggleButton('masteryButton', tr('Character Mastery'), '/images/topbuttons/mastery', toggle)
  masteryButton:setOn(true)
  masteryWindow = g_ui.displayUI('mastery')
  g_keyboard.bindKeyDown('Ctrl+M', toggle)
  
  initialized = true
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