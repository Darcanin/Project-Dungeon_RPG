
-- require block
require("/lib/timers")
require("dr_utility")
require("dr_system")
require("dr_events")
--

function DungeonRPG:InitGameMode()

	-- Basic Game Rules --
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 0 )
	GameRules:LockCustomGameSetupTeamAssignment(GAMESETUP_lOCK)
    GameRules:SetCustomGameSetupAutoLaunchDelay(GAMESETUP_TIME)
    GameRules:SetHeroRespawnEnabled(ENABLE_HERO_RESPAWN)
    GameRules:SetUseUniversalShopMode(UNIVERSAL_SHOP_MODE)
    GameRules:SetHeroSelectionTime(HERO_SELECTION_TIME)
    GameRules:SetStrategyTime(HERO_STRATEGY_TIME) 
    GameRules:SetShowcaseTime(HERO_SHOWCASE_TIME)
    GameRules:SetPreGameTime(PRE_GAME_TIME)
    GameRules:SetPostGameTime(POST_GAME_TIME)
    GameRules:SetTreeRegrowTime(TREE_REGROW_TIME)
    GameRules:SetUseCustomHeroXPValues(USE_CUSTOM_XP_VALUES)
    GameRules:SetStartingGold(STARTING_GOLD)

    GameRules:GetGameModeEntity():SetCameraZRange( 0, 2700 )

	GameRules:GetGameModeEntity():SetRecommendedItemsDisabled(RECOMMENDED_BUILDS_DISABLED)
	GameRules:GetGameModeEntity():SetCustomBuybackCostEnabled(CUSTOM_BUYBACK_COST_ENABLED)
	GameRules:GetGameModeEntity():SetCustomBuybackCooldownEnabled(CUSTOM_BUYBACK_COOLDOWN_ENABLED)
	GameRules:GetGameModeEntity():SetBuybackEnabled(BUYBACK_ENABLED)
	GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride(USE_CUSTOM_TOP_BAR_VALUES)
	GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible(TOP_BAR_VISIBLE)
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels(USE_CUSTOM_HERO_LEVELS)
	GameRules:GetGameModeEntity():SetCustomHeroMaxLevel(MAX_LEVEL)
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel(XP_PER_LEVEL_TABLE)
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled(ENABLE_TOWER_BACKDOOR_PROTECTION)
	GameRules:GetGameModeEntity():SetFogOfWarDisabled(DISABLE_FOG_OF_WAR_ENTIRELY)
	GameRules:GetGameModeEntity():SetUnseenFogOfWarEnabled(USE_UNSEEN_FOG_OF_WAR)
	GameRules:GetGameModeEntity():SetGoldSoundDisabled(DISABLE_GOLD_SOUNDS)
	GameRules:GetGameModeEntity():SetRemoveIllusionsOnDeath(REMOVE_ILLUSIONS_ON_DEATH)
    GameRules:GetGameModeEntity():SetSendToStashEnabled( false )
    GameRules:GetGameModeEntity():SetHudCombatEventsDisabled( true )


	GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_DAMAGE, 0)
    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 0)
    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP_REGEN, 0)

    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_DAMAGE, 0)
    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ATTACK_SPEED, 0)
    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0.0000)

    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_DAMAGE, 0)
    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA, 0)
    GameRules:GetGameModeEntity():SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA_REGEN, 0)

    --

	-- Listeners
	ListenToGameEvent('dota_player_gained_level', Dynamic_Wrap(DungeonRPG, 'OnPlayerLevelUp'), self)
  	ListenToGameEvent('dota_ability_channel_finished', Dynamic_Wrap(DungeonRPG, 'OnAbilityChannelFinished'), self)
  	ListenToGameEvent('dota_player_learned_ability', Dynamic_Wrap(DungeonRPG, 'OnPlayerLearnedAbility'), self)
  	ListenToGameEvent('entity_killed', Dynamic_Wrap(DungeonRPG, 'OnEntityKilled'), self)
  	ListenToGameEvent('player_connect_full', Dynamic_Wrap(DungeonRPG, 'OnConnectFull'), self)
  	ListenToGameEvent('player_disconnect', Dynamic_Wrap(DungeonRPG, 'OnDisconnect'), self)
  	ListenToGameEvent('dota_item_purchased', Dynamic_Wrap(DungeonRPG, 'OnItemPurchased'), self)
  	ListenToGameEvent('dota_item_picked_up', Dynamic_Wrap(DungeonRPG, 'OnItemPickedUp'), self)
  	ListenToGameEvent('last_hit', Dynamic_Wrap(DungeonRPG, 'OnLastHit'), self)
  	ListenToGameEvent('dota_non_player_used_ability', Dynamic_Wrap(DungeonRPG, 'OnNonPlayerUsedAbility'), self)
  	ListenToGameEvent('player_changename', Dynamic_Wrap(DungeonRPG, 'OnPlayerChangedName'), self)
  	ListenToGameEvent('dota_rune_activated_server', Dynamic_Wrap(DungeonRPG, 'OnRuneActivated'), self)
  	ListenToGameEvent('dota_player_take_tower_damage', Dynamic_Wrap(DungeonRPG, 'OnPlayerTakeTowerDamage'), self)
  	ListenToGameEvent('tree_cut', Dynamic_Wrap(DungeonRPG, 'OnTreeCut'), self)
  	ListenToGameEvent('entity_hurt', Dynamic_Wrap(DungeonRPG, 'OnEntityHurt'), self)
  	ListenToGameEvent('player_connect', Dynamic_Wrap(DungeonRPG, 'PlayerConnect'), self)
  	ListenToGameEvent('dota_player_used_ability', Dynamic_Wrap(DungeonRPG, 'OnAbilityUsed'), self)
  	ListenToGameEvent('game_rules_state_change', Dynamic_Wrap(DungeonRPG, 'OnGameRulesStateChange'), self)
  	ListenToGameEvent('npc_spawned', Dynamic_Wrap(DungeonRPG, 'OnNPCSpawned'), self)
  	ListenToGameEvent('dota_player_pick_hero', Dynamic_Wrap(DungeonRPG, 'OnPlayerPickHero'), self)
  	ListenToGameEvent('dota_team_kill_credit', Dynamic_Wrap(DungeonRPG, 'OnTeamKillCredit'), self)
  	ListenToGameEvent("player_reconnected", Dynamic_Wrap(DungeonRPG, 'OnPlayerReconnect'), self)
  	ListenToGameEvent("dota_player_killed", Dynamic_Wrap(DungeonRPG, 'OnPlayerKilled'), self)
  	ListenToGameEvent("dota_illusions_created", Dynamic_Wrap(DungeonRPG, 'OnIllusionsCreated'), self)
  	ListenToGameEvent("dota_item_combined", Dynamic_Wrap(DungeonRPG, 'OnItemCombined'), self)
  	ListenToGameEvent("dota_player_begin_cast", Dynamic_Wrap(DungeonRPG, 'OnAbilityCastBegins'), self)
  	ListenToGameEvent("dota_tower_kill", Dynamic_Wrap(DungeonRPG, 'OnTowerKill'), self)
  	ListenToGameEvent("dota_player_selected_custom_team", Dynamic_Wrap(DungeonRPG, 'OnPlayerSelectedCustomTeam'), self)
  	ListenToGameEvent("dota_npc_goal_reached", Dynamic_Wrap(DungeonRPG, 'OnNPCGoalReached'), self)

  	ListenToGameEvent("player_chat", Dynamic_Wrap(DungeonRPG, 'OnPlayerChat'), self)

	-- Custom Events --
	--CustomGameEventManager:RegisterListener("item_slot_changed_client", Dynamic_Wrap(InventoryMD, 'OnItemSlotChanged'))
	--

	-- Filters --
	--GameRules:GetGameModeEntity():SetHealingFilter( Dynamic_Wrap( DungeonRPG, "HealingFilter" ), self )
	--GameRules:GetGameModeEntity():SetDamageFilter( Dynamic_Wrap( DungeonRPG, "DamageFilter" ), self )
	--GameRules:GetGameModeEntity():SetItemAddedToInventoryFilter( Dynamic_Wrap( DungeonRPG, "ItemAddedToInventoryFilter" ), self )
	--GameRules:GetGameModeEntity():SetModifierGainedFilter( Dynamic_Wrap( DungeonRPG, "ModifierGainedFilter" ), self )
	--


	-- Convars --
	--Convars:RegisterCommand( "+hero_forward_move", MovementForward(), "", 0 )
  --Convars:RegisterCommand( "-hero_forward_move", MovementStop(), "", 0 )

  --Convars:RegisterCommand( "+hero_back_move", MovementBack(), "", 0 )
  --Convars:RegisterCommand( "-hero_back_move", MovementStop(), "", 0 )
	--


	-- Lua Modifiers
	LinkLuaModifier( "modifier_base_hero", "modifiers/modifier_base_hero.lua", LUA_MODIFIER_MOTION_NONE )
	--LinkLuaModifier( "modifier_monolith_caster", "modifiers/npc/modifier_monolith_caster.lua", LUA_MODIFIER_MOTION_NONE )
	--LinkLuaModifier( "modifier_dummy", "modifiers/npc/modifier_dummy.lua", LUA_MODIFIER_MOTION_NONE )
	--
	
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 5 )
end


function DungeonRPG:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

function DungeonRPG:OnHeroInGame(hHero)
	if not hHero or not hHero.bFirstSpawned then
		return
	end

	hHero.bFirstSpawned = false
  hHero:AddNewModifier(hHero, nil, "modifier_base_hero", {duration=-1})
  hHero:ApplyCustomStats()
  local ability = hHero:GetAbilityByIndex(0)
  ability:SetLevel(1)
	--CustomNetTables:SetTableValue("hero_resources", tostring(hHero:entindex()), hHero.resources)
	--CustomNetTables:GetTableValue("hero_abilities", tostring(hHero:entindex()))
end

function DungeonRPG:SetCamera()
    -- Устанавливает фиксированую камеру для всех игроков
    CustomGameEventManager:Send_ServerToAllClients("SetCamera", {name = zalup, desc = 1})
    print("SetCamera")
    for i=0,2 do
        if (PlayerResource:IsValidPlayer(i)) then
            local myhero = PlayerResource:GetPlayer(i):GetAssignedHero()
            PlayerResource:SetCameraTarget(i, myhero)
        end
    end
end