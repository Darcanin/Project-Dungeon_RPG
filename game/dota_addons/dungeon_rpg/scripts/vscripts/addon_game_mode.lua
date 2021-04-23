if DungeonRPG == nil then
	DungeonRPG = class({})
	_G.DungeonRPG = DungeonRPG
end

--require("precache_list")
require("dr_settings")
require("dr_game")

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end


function Activate()
	GameRules.DR = DungeonRPG()
	GameRules.DR:InitGameMode()
end