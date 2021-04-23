"use strict";

//Бинд кнопок управления
Game.CreateCustomKeyBind( "A", "+hero_move_back" )
Game.CreateCustomKeyBind( "D", "+hero_move_forward" )

let buttonPressed = false

function SetMoveBinds()
{
    // добавляем новую консольную команду для движения
    Game.AddCommand( "+hero_move_forward", function() {MoveForward_Start()}, "", 0 );
    Game.AddCommand( "-hero_move_forward", function() {MoveForward_Stop()}, "", 0 );

    Game.AddCommand( "+hero_move_back", function() {MoveBack_Start()}, "", 0 );
    Game.AddCommand( "-hero_move_back", function() {MoveBack_Stop()}, "", 0 );
}

// Функция движения
function MoveForward_Start()
{
    let interval = 1/30
    let move_step = 50

    let order = {
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        Position : [0, 0, 0],
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };

    buttonPressed = true;

    (function IntervalTick()
    {
        if (!buttonPressed) 
        {
            return;
        }

        $.Msg("MOVING")

        let hero = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        let pos = Entities.GetAbsOrigin(hero)
        pos[0] = pos[0] + move_step

        order.Position = pos;
        Game.PrepareUnitOrders( order );

        $.Schedule(interval, IntervalTick);
    })()
}

// Функция остоновки движения
function MoveForward_Stop()
{
    $.Msg("STOP MOVING")

    let order = {
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_STOP,
        Position : [0, 0, 0],
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };

    Game.PrepareUnitOrders( order );
    buttonPressed = false;
}

// Функция движения
function MoveBack_Start()
{
    let interval = 1/30
    let move_step = 50

    let order = {
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        Position : [0, 0, 0],
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };

    buttonPressed = true;

    (function IntervalTick()
    {
        if (!buttonPressed) 
        {
            return;
        }

        $.Msg("MOVING")

        let hero = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
        let pos = Entities.GetAbsOrigin(hero)
        pos[0] = pos[0] - move_step

        order.Position = pos;
        Game.PrepareUnitOrders( order );

        $.Schedule(interval, IntervalTick);
    })()
}

// Функция остоновки движения
function MoveBack_Stop()
{
    $.Msg("STOP MOVING")

    let order = {
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_STOP,
        Position : [0, 0, 0],
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };

    Game.PrepareUnitOrders( order );
    buttonPressed = false;
}

(function () {
    GameEvents.Subscribe( "dota_player_update_selected_unit", SetMoveBinds );
})();

//Камера
GameEvents.Subscribe( "SetCamera", SetCamera); 
function SetCamera(data) {
	GameUI.SetCameraPitchMin(10)
	GameUI.SetCameraPitchMax(10)
	GameUI.SetCameraYaw(-10)
	GameUI.SetCameraDistance( 1050 )
    GameUI.SetCameraLookAtPositionHeightOffset(250)
}
SetCamera(123);

// Фильтр ЛКМ , ПКМ
GameUI.SetMouseCallback( function( eventName, arg ) {
    var nMouseButton = arg
    var CONSUME_EVENT = true;
    var CONTINUE_PROCESSING_EVENT = false;
    if ( GameUI.GetClickBehaviors() !== CLICK_BEHAVIORS.DOTA_CLICK_BEHAVIOR_NONE )
        return CONTINUE_PROCESSING_EVENT;

    if ( eventName === "pressed" )
    {
        // ЛКМ
        if ( arg === 0 )
        {
            return CONSUME_EVENT;
        }

        // ПКМ
        if ( arg === 1 )
        {
            return CONSUME_EVENT;
        }
    }

    if ( eventName === "wheeled" )
    {
        g_targetYaw += arg * 10;
        return CONSUME_EVENT;
    }

    if ( eventName === "doublepressed" )
    {
        return CONSUME_EVENT;
    }
    return CONTINUE_PROCESSING_EVENT;
} );

// Отключение UI дефолтного
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ACTION_PANEL, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ACTION_MINIMAP, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_SHOP, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_QUICK_STATS, false );
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_TIMEOFDAY, false );      
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_FLYOUT_SCOREBOARD, false );       
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_PANEL, false );       
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_ITEMS, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_QUICKBUY, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_COURIER, false );      
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_PROTECT, false );      
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_GOLD, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_SHOP_SUGGESTEDITEMS, false );      
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_TEAMS, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_GAME_NAME, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_HERO_SELECTION_CLOCK, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_MENU_BUTTONS, false );     
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_ENDGAME, false );       
GameUI.SetDefaultUIEnabled( DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_BAR_BACKGROUND, false );     
GameUI.CustomUIConfig().team_colors = {}
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_GOODGUYS] = "#3dd296;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_BADGUYS ] = "#F3C909;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_1] = "#c54da8;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_2] = "#FF6C00;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_3] = "#3455FF;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_4] = "#65d413;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_5] = "#815336;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_6] = "#1bc0d8;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_7] = "#c7e40d;";
GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_8] = "#8c2af4;";