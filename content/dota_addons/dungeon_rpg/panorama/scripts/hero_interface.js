// function SetAttributes() {
//     let heroEntIndex = Players.GetPlayerHeroEntityIndex(Players.GetLocalPlayer());
//     $(`#Hero_AttributeContainer_1`).text = `Str - ${Entities.GetSTR_Base(heroEntIndex)} + ${Entities.GetSTR_Bonus(heroEntIndex)}`;
//     $(`#Hero_AttributeContainer_2`).text = `Agi - ${Entities.GetAGI_Base(heroEntIndex)} + ${Entities.GetAGI_Bonus(heroEntIndex)}`;
//     $(`#Hero_AttributeContainer_3`).text = `Int - ${Entities.GetINT_Base(heroEntIndex)} + ${Entities.GetINT_Bonus(heroEntIndex)}`;
//     $.Schedule(0.1, SetAttributes);
// }
// SetAttributes();