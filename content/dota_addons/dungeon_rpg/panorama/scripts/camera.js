"use strict";

// -------------------------------------------------------------------------//
//                              GET BASE STRENGTH                           //
// -------------------------------------------------------------------------//
Entities.GetSTR_Base = function(queryUnit)
{
    if (!Entities.IsRealHero(queryUnit))
    {
        return 0
    }

    for (let i=0; i <= Entities.GetNumBuffs( queryUnit ); i++)
    {
        let queryModifier = Entities.GetBuff(queryUnit, i);
        if (Buffs.GetName(queryUnit, queryModifier) == "modifier_str_base")
        {
            const value = Buffs.GetStackCount(queryUnit, queryModifier);
            return value
        }
    }

    return 0
}

// -------------------------------------------------------------------------//
//                              GET BONUS STRENGTH                          //
// -------------------------------------------------------------------------//

Entities.GetSTR_Bonus = function(queryUnit)
{
    if (!Entities.IsRealHero(queryUnit))
    {
        return 0
    }

    for (let i=0; i <= Entities.GetNumBuffs( queryUnit ); i++)
    {
        let queryModifier = Entities.GetBuff(queryUnit, i);
        if (Buffs.GetName(queryUnit, queryModifier) == "modifier_str_bonus")
        {
            const value = Buffs.GetStackCount(queryUnit, queryModifier);
            return value
        }
    }

    return 0
}

// -------------------------------------------------------------------------//
//                              GET BASE AGILITY                            //
// -------------------------------------------------------------------------//
Entities.GetAGI_Base = function(queryUnit)
{
    if (!Entities.IsRealHero(queryUnit))
    {
        return 0
    }

    for (let i=0; i <= Entities.GetNumBuffs( queryUnit ); i++)
    {
        let queryModifier = Entities.GetBuff(queryUnit, i);
        if (Buffs.GetName(queryUnit, queryModifier) == "modifier_agi_base")
        {
            const value = Buffs.GetStackCount(queryUnit, queryModifier);
            return value
        }
    }

    return 0
}

// -------------------------------------------------------------------------//
//                              GET BONUS AGILITY                           //
// -------------------------------------------------------------------------//

Entities.GetAGI_Bonus = function(queryUnit)
{
    if (!Entities.IsRealHero(queryUnit))
    {
        return 0
    }

    for (let i=0; i <= Entities.GetNumBuffs( queryUnit ); i++)
    {
        let queryModifier = Entities.GetBuff(queryUnit, i);
        if (Buffs.GetName(queryUnit, queryModifier) == "modifier_agi_bonus")
        {
            const value = Buffs.GetStackCount(queryUnit, queryModifier);
            return value
        }
    }

    return 0
}

// -------------------------------------------------------------------------//
//                              GET BASE INTELLECT                          //
// -------------------------------------------------------------------------//
Entities.GetINT_Base = function(queryUnit)
{
    if (!Entities.IsRealHero(queryUnit))
    {
        return 0
    }

    for (let i=0; i <= Entities.GetNumBuffs( queryUnit ); i++)
    {
        let queryModifier = Entities.GetBuff(queryUnit, i);
        if (Buffs.GetName(queryUnit, queryModifier) == "modifier_int_base")
        {
            const value = Buffs.GetStackCount(queryUnit, queryModifier);
            return value
        }
    }

    return 0
}

// -------------------------------------------------------------------------//
//                              GET BONUS INTELLECT                         //
// -------------------------------------------------------------------------//

Entities.GetINT_Bonus = function(queryUnit)
{
    if (!Entities.IsRealHero(queryUnit))
    {
        return 0
    }

    for (let i=0; i <= Entities.GetNumBuffs( queryUnit ); i++)
    {
        let queryModifier = Entities.GetBuff(queryUnit, i);
        if (Buffs.GetName(queryUnit, queryModifier) == "modifier_int_bonus")
        {
            const value = Buffs.GetStackCount(queryUnit, queryModifier);
            return value
        }
    }

    return 0
}


//Бинд кнопок управления
Game.CreateCustomKeyBind( "A", "+hero_move_back" )
Game.CreateCustomKeyBind( "D", "+hero_move_forward" )

let forwardMove = false
let backMove = false

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
    let interval = 0.03
    let move_step = 50

    let order = {
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        Position : [0, 0, 0],
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };

    forwardMove = true;

    (function IntervalTick()
    {
        if (!forwardMove) 
        {
            return;
        }

        $.Msg("MOVING")

        if (backMove)
        {
            $.Schedule(interval, IntervalTick);
            return
        }

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

    //if (forwardMove || backMove)
    //{
    //    return
    //}

    //let order = {
    //    OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_STOP,
    //    Position : [0, 0, 0],
    //    Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
    //    ShowEffects : false
    //};

    //Game.PrepareUnitOrders( order );
    forwardMove = false;
}

// Функция движения
function MoveBack_Start()
{
    let interval = 0.03
    let move_step = 50

    let order = {
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_MOVE_TO_POSITION,
        Position : [0, 0, 0],
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };

    backMove = true;

    (function IntervalTick()
    {
        if (!backMove) 
        {
            return;
        }

        $.Msg("MOVING")

        if (forwardMove)
        {
            $.Schedule(interval, IntervalTick);
            return
        }

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

    //if (forwardMove || backMove)
    //{
    //    return
    //}

    //let order = {
    //    OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_STOP,
    //    Position : [0, 0, 0],
    //    Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
    //    ShowEffects : false
    //};

    //Game.PrepareUnitOrders( order );
    backMove = false;
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
	GameUI.SetCameraDistance( 850 )
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
            let order = {
                AbilityIndex : Entities.GetAbilityByName( Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() ), 'ability_base_attack_sven' ),
                OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_CAST_NO_TARGET,
                Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
                ShowEffects : false
            };
            
            Game.PrepareUnitOrders( order );  
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
        // g_targetYaw += arg * 10;
        return CONSUME_EVENT;
    }

    if ( eventName === "doublepressed" )
    {
        return CONSUME_EVENT;
    }
    return CONTINUE_PROCESSING_EVENT;
} );
