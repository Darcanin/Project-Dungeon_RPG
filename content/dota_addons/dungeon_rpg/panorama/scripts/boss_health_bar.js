// let ma = Players.GetPlayerHeroEntityIndex( Players.GetLocalPlayer() );

GameEvents.Subscribe( "found_boss_id", SetActiveBoss);

(function () {
    // BossHealthBarUpdater()

})();

function SetActiveBoss(entity) {
    GameUI.CustomUIConfig().BossEntity = entity
    BossHealthBarUpdater()
}

function BossHealthBarUpdater() {
    let BossEntity = GameUI.CustomUIConfig().BossEntity,
        BossMaxHealth = Entities.GetMaxHealth(BossEntity['id']),
        BosscurrentHealth = Entities.GetHealth(BossEntity['id'])

    $('#HealthBar').min = 0
    $('#HealthBar').max = BossMaxHealth
    $('#HealthBar').value = BosscurrentHealth
    
    $.Schedule(0.1, BossHealthBarUpdater);
}