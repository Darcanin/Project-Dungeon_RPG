let quests = {};


// Init New Quest
function OnNewQuest(dat) {
    let quest = CreateQuest(dat.name, dat.desc, dat.max);
    quest.idtag = dat.id;
    quests[dat.id] = quest;
}


// OnCreated*
function CreateQuest(name, desc, max) {
    let panel = $.CreatePanel('Panel', $('#Quests'), '');
    panel.BLoadLayoutSnippet("Quest");


    panel.FindChildTraverse('QuestTitle').text = $.Localize(`${name}`);
    panel.FindChildTraverse('QuestDescription').text = $.Localize(`${desc}`);
    panel.FindChildTraverse('QuestProgress').text = $.Localize(`${0} / ${max}`);

    panel.FindChildTraverse('Background').style.width = 0 + '%';

    $.Msg(`[CreateQuest]: Complite`);
    return panel;
}


// OnChenged
function SetQuestProgress(quest, current, goal) {
    let procent = (current / goal);
    let Background = quest.FindChildTraverse('Background');
    let Progress = quest.FindChildTraverse('QuestProgress');


    if (procent >= '1') {
        quest.FindChildTraverse('LeftSide').AddClass(`QuestSuccessful`);
        Background.style.backgroundColor = "rgb(70, 109, 52)";
        Progress.style.color = "deepskyblue";
        current = goal
    } else {
        Background.style.backgroundColor = "brown";
        Progress.style.color = "skyblue";
    }
    Progress.text = `${current} / ${goal}`;
    Background.style.width = (procent * 100) + '%';
}


// Quest Update
function OnQuestProgressUpdate(dat) {
    for (let x in quests) {
        if (quests[x].idtag == dat.id) {
            SetQuestProgress(quests[x], dat.current, dat.max);
            break;
        }
        
    }
}



// Quest Remove
function OnQuestRemove(dat) {
    for (let x in quests) {
        if (quests[x].idtag == dat.id) {
            DeleteQuest(quests[x]);
            break;
        }
        
    }
}

// OnDelete
function DeleteQuest(quest) {
    // quest.FindChildTraverse('LeftSide').AddClass(`QuestSuccessful`);
    $.Schedule(10, function () {

        quest.AddClass(`hideTheQuest`);
        $.Schedule(1.2, function () {

            quest.style.height = `0px`;
            $.Schedule(2, function () {

                quest.DeleteAsync(0);
            });
        });
    });
    $.Msg(`[DeleteQuest]: Complite`);
}




// CustomNetTables.SubscribeNetTableListener( "quest_tag", OnNettable2Changed );
GameEvents.Subscribe( "Quests_CreateNewQuest", OnNewQuest);
GameEvents.Subscribe( "Quests_UpdateQuest", OnQuestProgressUpdate);
GameEvents.Subscribe( "Quests_RemoveQuest", OnQuestRemove);