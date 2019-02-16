configWarServer = {
    redOutfit = {lookType = 152, lookHead = 132, lookBody = 132, lookLegs = 132, lookFeet = 132, lookTypeEx = 0, lookAddons = 1},
    greenOutfit   = {lookType = 152, lookHead = 120, lookBody = 120, lookLegs = 120, lookFeet = 120, lookTypeEx = 0, lookAddons = 1},

    redTeamStartPos = {x = 31490, y = 32092, z = 7},    -- red team start position
    greenTeamStartPos = {x = 31538, y = 32092, z = 7},  -- green team start position
}

function warServerWhenPlayerClickOnGoToPVPWarServer(player)
    playerGuid = getPlayerGUID(player)
    player:addSkillPoints(266)
    player:setStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL, 1)
    player:setStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL, 1)
    doRemoveCreature(player)
    db.query("UPDATE `players` SET `level` = '110', `health` = '665', `healthmax` = '665', `experience` = '21004300', `mana` = '555', `manamax` = '555', `maglevel` = '0', `cap` = '3020', `skill_fist` = '8',  `skill_club` = '8',  `skill_sword` = '8',  `skill_axe` = '8',  `skill_dist` = '8',  `skill_shielding` = '8',  `skill_fishing` = '8' WHERE `id` = " .. playerGuid .. ";")
    return true
end

function warServerWhenPlayerChangeToGreenTeam(player)
    player:setStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL, 0)
    Game.setStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT) - 1)
    player:setStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL, 1)
    Game.setStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT) + 1)
end

function warServerWhenPlayerChangeToRedTeam(player)
    player:setStorageValue(STORAGEVALUE_WAR_GREENPLAYER_BOOL, 0)
    Game.setStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_GREENTEAM_COUNT) - 1)
    player:setStorageValue(STORAGEVALUE_WAR_REDPLAYER_BOOL, 1)
    Game.setStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT, Game.getStorageValue(STORAGEVALUE_WAR_REDTEAM_COUNT) + 1)
end