-- Please see enus.lua for reference.

QuestHelper_Translations.ruRU =
 {
  -- Displayed by locale chooser.
  LOCALE_NAME = "Русский",
  
  -- Messages used when starting.
  LOCALE_ERROR = "Локализация ваших сохранённых данных не соответствует локализации вашего клиента WoW.",
  ZONE_LAYOUT_ERROR = "Боюсь, при загрузке вы потеряете все свои сохранённые данные Пожалуйста, дождитесь выхода патча для обновления информации по новым зонам.",
  DOWNGRADE_ERROR = "Ваши сохранённые данные не подходят для этой версии QuestHelper. Используйте новую версию, или удалите старые данные.",
  HOME_NOT_KNOWN = "Местоположение вашего дома неизвестно. Когда будет возможность, пожалуйста, поговорите с хозяином таверны и обновите информацию о вашем доме.",
  PRIVATE_SERVER = "QuestHelper не поддерживает частные серверы.",
  PLEASE_RESTART = "При запуске QuestHelper произошла ошибка. Пожалуйста, выйдите из игры полностью и попробуйте еще раз.",
  NOT_UNZIPPED_CORRECTLY = "QuestHelper был установлен некорректно. Рекомендуется использовать либо Curse Client, либо программу 7zip для инсталляции. Убедитесь, что поддиректории распаковываются верно.",
  PLEASE_DONATE = "%h(QuestHelper выживает благодаря вашим пожертвованиям!) Мы будем благодарны за Все, что вы сможете пожертвовать - даже несколько долларов в месяц позволит быть уверенным, что я продолжу обновлять и работать над этим аддоном. Наберите %h(/qh donate) для подробной информации.",
  HOW_TO_CONFIGURE = "QuestHelper пока не имеет работающей страницы опций, но может быть настроен при введении %h(/qh settings). Помощь доступна при наборе %h(/qh help).",
  TIME_TO_UPDATE = "Возможно, доступна %h(новая версия QuestHelper). Новые версии содержат улучшения и исправления ошибок. Пожалуйста, обновите вашу версию!",
  
  -- Route related text.
  ROUTES_CHANGED = "Маршруты полётов для вашего персонажа обновлены.",
  HOME_CHANGED = "Ваш дом сменился.",
  TALK_TO_FLIGHT_MASTER = "Пожалуйста, поговорите с мастером полётов.",
  TALK_TO_FLIGHT_MASTER_COMPLETE = "Спасибо.",
  WILL_RESET_PATH = "Сброс информации по маршрутам.",
  UPDATING_ROUTE = "Обновляются маршруты.",
  
  -- Special tracker text
  QH_LOADING = "QuestHelper загружается (%1%%)...",
  QUESTS_HIDDEN_1 = "Задания могут быть скрыты",
  QUESTS_HIDDEN_2 = "(\"/qh hidden\" для просмотра списка)",
  
  -- Locale switcher.
  LOCALE_LIST_BEGIN = "Доступные локализации:",
  LOCALE_CHANGED = "Локализация изменена на: %h1",
  LOCALE_UNKNOWN = "Локализация %h1 неизвестна.",
  
  -- Words used for objectives.
  SLAY_VERB = "Убить",
  ACQUIRE_VERB = "Получить",
  
  OBJECTIVE_REASON = "%1 %h2 для квеста %h3.", -- %1 is a verb, %2 is a noun (item or monster)
  OBJECTIVE_REASON_FALLBACK = "%h1 для квеста %h2.",
  OBJECTIVE_REASON_TURNIN = "Цель квеста %h1.",
  OBJECTIVE_PURCHASE = "Приобрести от %h1.",
  OBJECTIVE_TALK = "Поговорить с %h1.",
  OBJECTIVE_SLAY = "Убить %h1.",
  OBJECTIVE_LOOT = "Собрать %h1.",
  
  ZONE_BORDER = "%1/%2 граница",
  
  -- Stuff used in objective menus.
  PRIORITY = "Приоритет",
  PRIORITY1 = "Самый высокий",
  PRIORITY2 = "Высокий",
  PRIORITY3 = "Обычный",
  PRIORITY4 = "Низкий",
  PRIORITY5 = "Самый низкий",
  SHARING = "Разделение задания",
  SHARING_ENABLE = "Разделять задание",
  SHARING_DISABLE = "Не разделять задание",
  IGNORE = "Игнорировать",
  
  IGNORED_PRIORITY_TITLE = "Выбранный приоритет будет проигнорирован.",
  IGNORED_PRIORITY_FIX = "Применить такой же приоритет к связанным заданиям.",
  IGNORED_PRIORITY_IGNORE = "Я выставлю приоритеты самостоятельно.",
  
  -- Custom objectives.
  RESULTS_TITLE = "Результаты поиска",
  NO_RESULTS = "Ничего нету!",
  CREATED_OBJ = "Создано: %1",
  REMOVED_OBJ = "Утрачено: %1",
  USER_OBJ = "Задание пользователя: %h1",
  UNKNOWN_OBJ = "Я не знаю куда тебе надо идти для этого задания.",
  INACCESSIBLE_OBJ = "QuestHelper не смог найти подходящей области для %h1. В список заданий добавлено недоступное для указания место. Если вы обнаружите подходящее место для выполнения этого задания, пришлите нам данные об этом! (%h(/qh submit))",
  
  SEARCHING_STATE = "Идёт поиск: %1",
  SEARCHING_LOCAL = "Локаль %1",
  SEARCHING_STATIC = "Статичный %1",
  SEARCHING_ITEMS = "Предметы",
  SEARCHING_NPCS = "NPCs",
  SEARCHING_ZONES = "Зоны",
  SEARCHING_DONE = "Готово!",
  
  -- Shared objectives.
  PEER_TURNIN = "Подождите пока %h1 сдаст %h2.",
  PEER_LOCATION = "Помогите %h1 добраться до места в области %h2.",
  PEER_ITEM = "Помочь %1 получить %h2.",
  PEER_OTHER = "Посодействуйте %1 с %h2.",
  
  PEER_NEWER = "%h1 использует протокол новой версии. Наверное, время обновиться.",
  PEER_OLDER = "%h1 использует протокол старой версии.",
  
  UNKNOWN_MESSAGE = "Неизвестный тип сообщения '%1' от '%2'.",
  
  -- Hidden objectives.
  HIDDEN_TITLE = "Скрытые цели",
  HIDDEN_NONE = "У вас нет скрытых целей.",
  DEPENDS_ON_SINGLE = "Зависит от '%1'.",
  DEPENDS_ON_COUNT = "Зависит от %1 скрытых целей.",
  FILTERED_LEVEL = "Скрыто в соответствии с фильтром уровня.",
  FILTERED_ZONE = "Скрыто в соответствии с фильтром по зоне.",
  FILTERED_COMPLETE = "Скрыто по причине завершённости задания.",
  FILTERED_BLOCKED = "Скрыто из-за незавершенной предыдущей цели задания.",
  FILTERED_UNWATCHED = "Скрыто, так как не помечено отслеживающимся в журнале заданий.",
  FILTERED_USER = "Вы запросили скрыть эту цель.",
  FILTERED_UNKNOWN = "Неизвестно как закончить.",
  
  HIDDEN_SHOW = "Показать.",
  DISABLE_FILTER = "Отключить фильтр: %1",
  FILTER_DONE = "готово",
  FILTER_ZONE = "зона",
  FILTER_LEVEL = "уровень",
  FILTER_BLOCKED = "заблокировано",
  
  -- Nagging. (This is incomplete, only translating strings for the non-verbose version of the nag command that appears at startup.)
  NAG_MULTIPLE_NEW = "У вас есть %h(новая информация) о %h1 и %h(обновленная информация) о %h2.",
  NAG_SINGLE_NEW = "У вас есть %h(новая информация) о %h1.",
  NAG_ADDITIONAL = "У вас есть %h(дополнительная информация) о %h1.",
  NAG_POLLUTED = "Ваша база данных испорчена информацией с тестового или частного сервера, и будет очищена при запуске.",
  
  NAG_NOT_NEW = "У вас нет информации, которой не было бы в статичной базе.",
  NAG_NEW = "Если вы раздадите свою информацию другим, им это сильно пригодится.",
  NAG_INSTRUCTIONS = "Наберите %h(/qh submit) для получения инструкций об отправке данных.",
  
  NAG_SINGLE_FP = "мастере полетов",
  NAG_SINGLE_QUEST = "задании",
  NAG_SINGLE_ROUTE = "пути полёта",
  NAG_SINGLE_ITEM_OBJ = "Добыча Предмета",
  NAG_SINGLE_OBJECT_OBJ = "Объект Задания",
  NAG_SINGLE_MONSTER_OBJ = "Убийство Монстра",
  NAG_SINGLE_EVENT_OBJ = "Место события",
  NAG_SINGLE_REPUTATION_OBJ = "Репутация",
  NAG_SINGLE_PLAYER_OBJ = "Цель Игрока",
  
  NAG_MULTIPLE_FP = "%1 мастерах полетов",
  NAG_MULTIPLE_QUEST = "%1 заданиях",
  NAG_MULTIPLE_ROUTE = "%1 путях полёта",
  NAG_MULTIPLE_ITEM_OBJ = "%1 Добывание предметов",
  NAG_MULTIPLE_OBJECT_OBJ = "%1 подзаданиях",
  NAG_MULTIPLE_MONSTER_OBJ = "%1 Убийство мобов",
  NAG_MULTIPLE_EVENT_OBJ = "%1 Объекты событий",
  NAG_MULTIPLE_REPUTATION_OBJ = "%1 заданиях на репутацию",
  NAG_MULTIPLE_PLAYER_OBJ = "%1 целях игроков",
  
  -- Stuff used by dodads.
  PEER_PROGRESS = "%1's прогресс:",
  TRAVEL_ESTIMATE = "Время прибытия:",
  TRAVEL_ESTIMATE_VALUE = "%t1",
  WAYPOINT_REASON = "Посетите %h1 по дороге к:",

  -- QuestHelper Map Button
  QH_BUTTON_TEXT = "QuestHelper",
  QH_BUTTON_TOOLTIP1 = "Левый клик: %1 информацию по маршрутам.",
  QH_BUTTON_TOOLTIP2 = "Правый клик: показать меню настроек.",
  QH_BUTTON_SHOW = "показать",
  QH_BUTTON_HIDE = "скрыть",

  MENU_CLOSE = "Закрыть меню",
  MENU_SETTINGS = "Настройки",
  MENU_ENABLE = "Включить",
  MENU_DISABLE = "Отключить",
  MENU_OBJECTIVE_TIPS = "%1 подсказку цели",
  MENU_TRACKER_OPTIONS = "Отслеживание заданий",
  MENU_QUEST_TRACKER = "%1 отслеживание заданий",
  MENU_TRACKER_LEVEL = "%1 отображение уровней заданий",
  MENU_TRACKER_QCOLOUR = "%1 окраску заданий по сложности",
  MENU_TRACKER_OCOLOUR = "%1 индикацию прогресса цветом",
  MENU_TRACKER_SCALE = "Масштаб списка заданий",
  MENU_TRACKER_RESET = "Сбросить позицию",
  MENU_FLIGHT_TIMER = "%1 таймер полёта",
  MENU_ANT_TRAILS = "%1 оптимальный путь",
  MENU_WAYPOINT_ARROW = "%1 направляющую стрелку",
  MENU_MAP_BUTTON = "%1 кнопку на карте",
  MENU_ZONE_FILTER = "%1 фильтр по зоне",
  MENU_DONE_FILTER = "%1 фильтр завершённых",
  MENU_BLOCKED_FILTER = "%1 фильтр заблокированых",
  MENU_WATCHED_FILTER = "%1 фильтр отслеживаемых",
  MENU_LEVEL_FILTER = "%1 фильтр уровней",
  MENU_LEVEL_OFFSET = "Ограничение заданий по уровню",
  MENU_ICON_SCALE = "Размер иконки",
  MENU_FILTERS = "Фильтры",
  MENU_PERFORMANCE = "Уровень производительности",
  MENU_LOCALE = "Локализация",
  MENU_PARTY = "Группа",
  MENU_PARTY_SHARE = "%1 обмен целями",
  MENU_PARTY_SOLO = "%1 игнорирование группы",
  MENU_HELP = "Помошь",
  MENU_HELP_SLASH = "Клавиатурные команды",
  MENU_HELP_CHANGES = "История изменений",
  MENU_HELP_SUBMIT = "Отправка данных",
  
  -- Added to tooltips of items/npcs that are watched by QuestHelper but don't have any progress information.
  -- Otherwise, the PEER_PROGRESS text is added to the tooltip instead.
  TOOLTIP_WATCHED = "Отслеживается QuestHelper",
  TOOLTIP_QUEST = "Для квеста %h1.",
  TOOLTIP_PURCHASE = "Приобрести %h1.",
  TOOLTIP_SLAY = "Убить для %h1.",
  TOOLTIP_LOOT = "Собрать добычу для %h1."
 }

