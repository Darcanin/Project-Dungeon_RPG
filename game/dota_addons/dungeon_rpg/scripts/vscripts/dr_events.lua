-- Events functions --

function DungeonRPG:OnConnectFull(event)
	print("DungeonRPG: Player Full Connected")
	PrintTable(event)
end

function DungeonRPG:OnDisconnect(event)
	print("DungeonRPG: Player Disconnected")
	PrintTable(event)
end

function DungeonRPG:PlayerConnect(event)
	print("DungeonRPG: Player Connected")
	PrintTable(event)
end

function DungeonRPG:OnPlayerReconnect(event)
	print("DungeonRPG: Player Reconnected")
	PrintTable(event)
end

function DungeonRPG:OnPlayerSelectedCustomTeam(event)
	print("DungeonRPG: Player Selected Custom Team")
	PrintTable(event)
end

function DungeonRPG:OnPlayerLevelUp(event)
	print("DungeonRPG: Player Level Up")
	PrintTable(event)

	local hHero = EntIndexToHScript(event.hero_entindex)
	local PlayerID = event.player_id
	local hPlayer = hHero:GetPlayerOwner()
	local level = event.level
end

function DungeonRPG:OnAbilityChannelFinished(event)
	print("DungeonRPG: Channel Ability Finished")
	PrintTable(event)
end

function DungeonRPG:OnPlayerLearnedAbility(event)
	print("DungeonRPG: Player Learn Ability")
	PrintTable(event)
end

function DungeonRPG:OnAbilityUsed(event)
	print("DungeonRPG: Ability Used")
	PrintTable(event)
end

function DungeonRPG:OnAbilityCastBegins(event)
	print("DungeonRPG: Ability Cast Begins")
	PrintTable(event)
end

function DungeonRPG:OnItemPurchased(event)
	print("DungeonRPG: Item Purchased")
end

function DungeonRPG:OnItemPickedUp(event)
	print("DungeonRPG: Item Pick Up")
	PrintTable(event)
	local hHero = EntIndexToHScript(event.HeroEntityIndex)
	local hItem = EntIndexToHScript(event.ItemEntityIndex)
end

function DungeonRPG:OnItemCombined(event)
	print("DungeonRPG: Item Combined")
	PrintTable(event)
end

function DungeonRPG:OnEntityKilled(event)
	print("DungeonRPG: Entity Killed")
	PrintTable(event)
	local killedUnit = EntIndexToHScript(event.entindex_killed)
	local killerUnit = EntIndexToHScript(event.entindex_attacker)
end

function DungeonRPG:OnLastHit(event)
	print("DungeonRPG: Last Hit")
	PrintTable(event)
end

function DungeonRPG:OnEntityHurt(event)
	print("DungeonRPG: Entity Hurt")
	PrintTable(event)
	local attackedUnit = EntIndexToHScript(event.entindex_killed)
end

function DungeonRPG:OnTreeCut(event)
	print("DungeonRPG: Tree Cuted")
	PrintTable(event)
end

function DungeonRPG:OnTeamKillCredit(event)
	print("DungeonRPG: Team Kill Credit")
	PrintTable(event)
end

function DungeonRPG:OnTowerKill(event)
	print("DungeonRPG: Tower Killed")
	PrintTable(event)
end

function DungeonRPG:OnNPCGoalReached(event)
	print("DungeonRPG: NPC Goal Reached")
	PrintTable(event)
end

function DungeonRPG:OnIllusionsCreated(event)
	print("DungeonRPG: Illusion Created")
	PrintTable(event)
end

function DungeonRPG:OnPlayerPickHero(event)
	print("DungeonRPG: Player Pick Hero")
	PrintTable(event)
end

function DungeonRPG:OnNPCSpawned(event)
	print("DungeonRPG: NPC Spawned")
	PrintTable(event)
	local npc = EntIndexToHScript(event.entindex)

  	if npc:IsRealHero() and npc.bFirstSpawned == nil then
    	npc.bFirstSpawned = true
    	DungeonRPG:OnHeroInGame(npc)
  	end
end

function DungeonRPG:OnPlayerTakeTowerDamage(event)
	print("DungeonRPG: Player Take Tower Damage")
	PrintTable(event)
end

function DungeonRPG:OnRuneActivated(event)
	print("DungeonRPG: Rune Activated")
	PrintTable(event)
end

function DungeonRPG:OnNonPlayerUsedAbility(event)
	print("DungeonRPG: Non Player Use Ability")
	PrintTable(event)
end

function DungeonRPG:OnPlayerChat(event)
	print("DungeonRPG: Player Use Chat")
	PrintTable(event)
	local hHero = PlayerResource:GetSelectedHeroEntity(event.playerid)
	local text = event.text

	if string.match(text, "str_base") then
		local stat = tonumber(string.sub(text, 10))
		hHero:AddSTR_Base(stat)
	end

	if string.match(text, "str_bonus") then
		local stat = tonumber(string.sub(text, 11))
		hHero:AddSTR_BonusValue(stat, 10.0)
	end

	if string.match(text, "str_percent") then
		local stat = tonumber(string.sub(text, 13))
		hHero:AddSTR_BonusPercent(stat, 10.0)
	end

	if string.match(text, "agi_base") then
		local stat = tonumber(string.sub(text, 10))
		hHero:AddAGI_Base(stat)
	end

	if string.match(text, "agi_bonus") then
		local stat = tonumber(string.sub(text, 11))
		hHero:AddAGI_BonusValue(stat, 10.0)
	end

	if string.match(text, "agi_percent") then
		local stat = tonumber(string.sub(text, 13))
		hHero:AddAGI_BonusPercent(stat, 10.0)
	end

	if string.match(text, "int_base") then
		local stat = tonumber(string.sub(text, 10))
		hHero:AddINT_Base(stat)
	end

	if string.match(text, "int_bonus") then
		local stat = tonumber(string.sub(text, 11))
		hHero:AddINT_BonusValue(stat, 10.0)
	end

	if string.match(text, "int_percent") then
		local stat = tonumber(string.sub(text, 13))
		hHero:AddINT_BonusPercent(stat, 10.0)
	end

	if text == "leap" then
		hHero:Dash(500, true)
	end
end

function DungeonRPG:OnPlayerChangedName(event)
	print("DungeonRPG: Player Change Name")
	PrintTable(event)
end

function DungeonRPG:OnGameRulesStateChange()
	print("DungeonRPG: Game State Changed")
	local newState = GameRules:State_Get()
	if newState == DOTA_GAMERULES_STATE_STRATEGY_TIME then
		print("GameState: Strategy Time")
	elseif newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
		print("GameState: Hero Selection")
		Timers:CreateTimer(function()
			if PlayerResource:HasSelectedHero(0) then
				local heroName = PlayerResource:GetSelectedHeroName(0)
				print(heroName)
				return nil
			end
			return 0.2
		end)
	elseif newState == DOTA_GAMERULES_STATE_PRE_GAME then
		print("GameState: Pre Game")
		CustomGameEventManager:Send_ServerToAllClients("Create_aggress_bar", {name = 'name', procent = 5, id = 5})
	elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print("GameState: Game In Progress")
		FoundEntity()
		DungeonRPG:SetCamera()
        CustomGameEventManager:Send_ServerToAllClients("Quests_CreateconfigQuest", {name = "Убейте 10 кобольдов!", desc = "Найдите и убейте коболдов!", max = 10, id = 1})
        CustomGameEventManager:Send_ServerToAllClients("Create_aggress_bar", {name = 'name', procent = 5, id = 1})
        CustomGameEventManager:Send_ServerToAllClients("Create_aggress_bar", {name = 'name', procent = 5, id = 2})
        CustomGameEventManager:Send_ServerToAllClients("Create_aggress_bar", {name = 'name', procent = 5, id = 3})
	end
end