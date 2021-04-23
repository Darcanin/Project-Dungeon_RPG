
START_GAME_AUTOMATICALLY = true         -- Авто Старт игры после выбора героя
UNIVERSAL_SHOP_MODE = true              -- Универсальный магазин

GOLD_PER_TICK = 0                       -- How much gold should players get per tick?
GOLD_TICK_TIME = 0                      -- How long should we wait in seconds between gold ticks?

ENABLE_HERO_RESPAWN = true              -- Респавн Героев
HERO_RESPAWN_TIME = 60                  -- Время респавна
STARTING_GOLD = 10000                   -- Стартовое количество денег
HERO_START_LEVEL = 1                    -- Стартовый уровень героя

ALLOW_SAME_HERO_SELECTION = true        -- Должны ли мы позволить людям выбирать одного и того же героя друг с другом

HERO_SELECTION_TIME = 30.0              -- Время выбора героя
HERO_STRATEGY_TIME = 30                  -- Время после выбора героя
HERO_SHOWCASE_TIME = 0                  -- Время на старте игры

GAMESETUP_lOCK = false
GAMESETUP_TIME = 15
PRE_GAME_TIME = 10.0                    -- Время до старта после выбора Всеми игроками героев
POST_GAME_TIME = 30.0                   -- Как долго после окончания игры будет таблица
TREE_REGROW_TIME = 90.0                 -- Респавн деревьев

RECOMMENDED_BUILDS_DISABLED = false     -- Рекомендации сборок вещей

MINIMAP_ICON_SIZE = 1                   -- Иконка героя на миникарте
MINIMAP_CREEP_ICON_SIZE = 1             -- Иконка крипа
MINIMAP_RUNE_ICON_SIZE = 1              -- Иконка руны

RUNE_SPAWN_TIME = 120                   -- Время респавна рун
CUSTOM_BUYBACK_COST_ENABLED = true      -- Свои настройки Байбека
CUSTOM_BUYBACK_COST = 250
CUSTOM_BUYBACK_COOLDOWN_ENABLED = false -- Свои настройки КД Байбека
CUSTOM_BUYBACK_COOLDOWN = 900           -- Время своих настроек
BUYBACK_ENABLED = false                 -- Можно ли Байбекнуться

DISABLE_FOG_OF_WAR_ENTIRELY = true      -- Туман войны (убрать)
USE_UNSEEN_FOG_OF_WAR = false           -- Должны ли мы сделать невидимые и затуманенные участки карты полностью черными до тех пор, пока они не будут обнаружены каждой командой?
                                        -- Примечание: для работы USE_UNSEEN_FOG_OF_WAR значение DISABLE_FOG_OF_WAR_ENTIRELY должно быть ложным
USE_STANDARD_DOTA_BOT_THINKING = false  -- Должны ли у нас боты вести себя так же, как в Dota? (Для этого требуется 3 полосы, нормальные предметы и т. Д.)
USE_STANDARD_HERO_GOLD_BOUNTY = false   -- Должны ли мы отдавать золото за убийства героев так же, как в Dota, или разрешать изменять эти значения?

ENABLE_TOWER_BACKDOOR_PROTECTION = false-- Должны ли мы включить бэкдор для наших башен
REMOVE_ILLUSIONS_ON_DEATH = false       -- Должны ли мы снять все иллюзии, если главный герой умрет?
DISABLE_GOLD_SOUNDS = false             -- Должны ли мы отключить звук золота, когда игроки получают золото?
USE_CUSTOM_TOP_BAR_VALUES = true
TOP_BAR_VISIBLE = true

USE_CUSTOM_HERO_LEVELS = true           -- Свои настройки уровня героев
MAX_LEVEL = 100
USE_CUSTOM_XP_VALUES = true             -- Своя таблица ХР

XP_PER_LEVEL_TABLE = {}
XP_PER_LEVEL_TABLE[0] = 0
for i=1,99 do
  XP_PER_LEVEL_TABLE[i] = XP_PER_LEVEL_TABLE[i-1]+i * 20
end