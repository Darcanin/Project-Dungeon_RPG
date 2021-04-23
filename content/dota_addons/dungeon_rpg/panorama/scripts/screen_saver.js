// function gu_anim(a,b,c){
//     a.AddClass(b)
//     $.Schedule(c, function() {
//         a.RemoveClass(b)
//         a.visible = false
//     })
// }
// (function() {
//     hud_mine()
// })
// ();

// function hud_mine(){
//     $.Schedule(3, function() {
//         gu_anim($("#Main_HUD"),"q",10)
// })
// }
// $("#Main_HUD").visible = true    




(function() {
    $.Schedule(15, function () {
        $('#Main_HUD').GetParent().style.opacity = 0;
    });
})
();