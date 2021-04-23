Game.CreateCustomKeyBind( "SPACE", "+custom_bind_whitespace" )


abilityName1 = 'ability_base_leap';
// abilityName2 = 'ability_base_attack_sven';


Game.AddCommand( "+custom_bind_whitespace", function() {CustomBindWhitespace(abilityName1)}, "", 0 );
// Game.AddCommand( "-custom_bind_whitespace", function() {MoveForward_Stop()}, "", 0 );

// Game.AddCommand( "+custom_bind_attack", function() {CustomBindWhitespace(abilityName2)}, "", 0 );
// Game.AddCommand( "-custom_bind_attack", function() {MoveBack_Stop()}, "", 0 );


function CustomBindWhitespace(abilityName) {
    let order = {
        AbilityIndex : Entities.GetAbilityByName( Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() ), abilityName ),
        OrderType : dotaunitorder_t.DOTA_UNIT_ORDER_CAST_NO_TARGET,
        Queue : OrderQueueBehavior_t.DOTA_ORDER_QUEUE_NEVER,
        ShowEffects : false
    };
    
    Game.PrepareUnitOrders( order );    
}
