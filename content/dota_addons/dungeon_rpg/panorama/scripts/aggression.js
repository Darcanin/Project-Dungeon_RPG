let aBars = {};

// Create bar
function OnNewBar(data) {
    let Bar = CreateAggressionBar(data.name, data.procent);
    Bar.idtag = data.id;
    aBars[data.id] = Bar;
}


// OnCreated
function CreateAggressionBar(name, procent) {
    let bar = $.CreatePanel('Panel', $('#spaceBar'), '');
    bar.BLoadLayoutSnippet("PlayerAggress"); 
    bar.FindChildTraverse('Progress').style.width = `${procent}%`; 
    // bar.FindChildTraverse('TitleBar').text = name; 
    return bar;
}


// OnChenged
function SetBarChange(bar, procent) {
    let Progress = bar.FindChildTraverse('Progress');

    if (procent >= 100) {
        
    } else {
        Progress.style.width = `${procent}%`; 
    }
}

let a =  $.GetContextPanel("ProgressContainer");

function fas() {
    $.Schedule(2, function () {
        SetBarChange(a, 5);
        $.Schedule(2, function () {
            SetBarChange(a, 95);
            fas();
        });
    });
}
// fas();


// Quest Update
function OnBarProgressUpdate(data) {
    $.Msg("yeas");
    for (let x in aBars) {
        $.Msg(`lol = ${aBars[x].idtag}`);
        if (aBars[x].idtag == data.id) {
            SetBarChange(aBars[x], data.procent);
            break;
        }
        
    }
}


GameEvents.Subscribe( "Create_aggress_bar", OnNewBar); 
GameEvents.Subscribe( "Update_aggress_bar", OnBarProgressUpdate);
//GameEvents.Subscribe( "Remove_aggress_bar", OnBarRemove);


