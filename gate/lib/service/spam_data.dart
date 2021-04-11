/// Тексты сообщений для эмуляции работы сервиса
class SpamData {
  static const list = [
    'Программирование сегодня — это гонка разработчиков программ, стремящихся писать программы с большей и лучшей идиотоустойчивостью, и вселенной, которая пытается создать больше отборных идиотов. Пока вселенная побеждает. Rick Cook',
    'Низкоуровневый язык — это когда требуется внимание к вещам, которые никак не связаны с программами на этом языке. Alan J. Perlis',
    'Программирование на С похоже на быстрые танцы на только что отполированном полу людей с острыми бритвами в руках. Waldi Ravens',
    'Не волнуйтесь, если что-то не работает. Если бы всё работало, вас бы уволили. Mosher’s Law of Software Engineering',
    'Для меня долгое время было загадкой, как что-то очень дорогое и технологичное может быть столь бесполезным. И вскоре я осознал, что компьютер — это глупая машина, обладающая способностями выполнять невероятно умные вещи, тогда как программисты — это умные люди, у которых талант делать невероятные глупости. Короче, они нашли друг друга. Bill Bryson',
    'В хорошем дизайне добавление чего-то стоит дешевле, чем сама эта вещь. Thomas C. Gale',
    'В теории, теория и практика неразделимы. На практике это не так. Yoggi Berra',
    'Perl — это тот язык, который одинаково выглядит как до, так и после RSA шифрования. Keith Bostic',
    'Я изобрел понятие «объектно-ориентированный», и могу заявить, что не имел в виду C++. Alan Kay',
    'Иногда лучше остаться спать дома в понедельник, чем провести всю неделю в отладке написанного в понедельник кода. Christopher Thompson',
    'Измерять продуктивность программиста подсчетом строк кода — это так же, как оценивать постройку самолета по его весу. Bill Gates',
    'Отладка кода вдвое сложнее, чем его написание. Так что если вы пишете код настолько умно, насколько можете, то вы по определению недостаточно сообразительны, чтобы его отлаживать. Brian W. Kernighan',
    'Многие из вас знакомы с достоинствами программиста. Их всего три, и разумеется это: лень, нетерпеливость и гордыня. Larry Wall',
    'Большинство программ на сегодняшний день подобны египетским пирамидам из миллиона кирпичиков друг на друге и без конструктивной целостности — они просто построены грубой силой и тысячами рабов. Alan Kay',
    'Большинство хороших программистов делают свою работу не потому, что ожидают оплаты или признания, а потому что получают удовольствие от программирования. Linus Torvalds',
    'Всегда пишите код так, будто сопровождать его будет склонный к насилию психопат, который знает, где вы живете. Martin Golding',
    'Программы должны писаться для людей, которые будут их читать, а машины, которые будут эти программы исполнять — второстепенны. Harold Abelson',
    'Люди, которые думают, что ненавидят компьютеры, на самом деле ненавидят плохих программистов. Larry Niven',
    'Если вы дадите человеку программу, то займете его на один день. Если вы научите человека программировать, то займете его на всю жизнь. Waseem Latif',
    'Язык, который не меняет вашего представления о программировании, недостоин изучения. Alan J. Perlis',
    'Мы наблюдаем общество, которое все больше зависит от машин, но при этом использует их все неэффективнее. Douglas Rushkoff',
    'Иногда лучшие программы создаются на бумажке. Запрограммировать их — второстепенная вещь. Max Kanat Alexander',
    'Отладка кода — это как охота. Охота на баги. Amit Kalantri',
    'Любой дурак сможет написать код, который поймет машина. Хорошие программисты пишут код, который сможет понять человек. Martin Fowler',
    'Программирование — это разбиение чего-то большого и невозможного на что-то маленькое и вполне реальное. Jazzwant',
    'Программисты — не математики, как бы нам этого не хотелось. Richard P. Gabriel',
    'Программирование — это сложно. Основные правила, на которых все строится, очень просты, но по мере разработки программа сама начинает вводить свои правила и законы. Таким образом, программист строит лабиринт, в котором сам же может и потеряться. Marijn Haverbeke',
    'Функции, которые производят значения, легче комбинировать новыми способами, чем те, которые производят сайд-эффекты. Marijn Haverbeke',
    'Простота — залог надежности. Edsger W. Dijkstra',
    'Если вы хотите, чтобы код было легко и быстро писать — делайте его удобным для чтения. Robert C. Martin',
    'Если вы хорошо отлаживаете программы, значит, вы провели много времени, делая это. Я не хочу уметь хорошо отлаживать программы. Michael C. Feathers',
    'Работает? Не трогай. Любой программист',
    'При помощи C вы легко можете выстрелить себе в ногу. При помощи C++ это сделать сложнее, но если это произойдёт, вам оторвёт всю ногу целиком. Bjarne Stroustrup',
    'Последние нововведения в C++ были созданы, чтобы исправить предыдущие нововведения. David Jameson',
    'Java — это C++, из которого убрали все пистолеты, ножи и дубинки. James Gosling',
    'Если бы в Java действительно работала сборка мусора, большинство программ бы удаляли сами себя при первом же запуске. Robert Sewell',
    'Есть всего два типа языков программирования: те, на которые люди всё время ругаются, и те, которые никто не использует. Bjarne Stroustrup',
    'Плохое имя метода сродни предвыборным обещаниям политиков. Вроде о чем-то оно говорит, но если задуматься — непонятно о чем. C. MacConnell',
    'Неработающая программа обычно приносит меньше вреда, чем работающая плохо. Dave Thomas',
    'Насколько проще было бы писать программы, если бы не заказчики. R. S. Martin',
    'Молодые специалисты не умеют работать, а опытные специалисты умеют не работать. Alexander Golov',
    'Почаще задавайте себе вопрос «Что мне скрыть?» и вы удивитесь, сколько проблем проектирования растает на ваших глазах. C. MacConnell',
    'Преждевременная оптимизация — корень всех зол. Donald Knuth',
    'Чтобы написать чистый код, мы сначала пишем грязный код, а затем рефакторим его. Robert Martin',
    'Помимо математических способностей, жизненно важным качеством программиста является исключительно хорошее владение родным языком. Edsger W. Dijkstra',
    'Для каждой сложной задачи существует решение, которое является быстрым, простым и неправильным. H. L. Mencken',
    'Механизмы управления доступом в С++ обеспечивают защиту от несчастного случая, но не от мошенников. Bjarne Stroustrup',
    'Думаю, искусство программировать немногим сложнее других человеческих навыков. Программирование делает вас лучше точно так же, как вам помогают развиваться изучение иностранного языка, математики или чтение книг. Jack Dorsey',
    'Аналогично тому, как написание картины является искусством для души, так и написание программы является искусством для разума. Volnik',
    'Тестирование не позволяет обнаружить такие ошибки, как создание не того приложения. Steve McConnell',
    'Некоторые люди во время решения некой проблемы думают: «Почему бы мне не использовать регулярные выражения?». После этого у них уже две проблемы… Jamie Zawinski',
    'Я не умею делать скриншоты, потому что я обычно работаю на компьютере в текстовом режиме. Richard Stallman',
    'Ходить по воде и разрабатывать программы, следуя спецификации, очень просто… если они заморожены. Edward V Berard',
    'Я думаю, что Microsoft назвал технологию .NET для того, чтобы она не показывалась в списках директорий Unix. Oktal',
    'Учитывая текущее плачевное состояние наших программ, можно сказать, что программирование определенно всё ещё черная магия, и пока мы не можем называть его технической дисциплиной. Bill Clinton',
    'Намного легче портировать шелл, чем скрипт на шелле. Larry Wall',
    'Изучение программирования имеет такое же отношение к проектированию интерактивных систем, как обучение слепой печати к написанию стихов. Ted Nelson',
    'Сначала учите науку программирования и всю теорию. Далее выработайте свой программистский стиль. Затем забудьте всё и просто программируйте. George Carrette',
    'Трудность работы с программистом заключается в том, что вы не можете понять, что он делает, до тех пор, пока не стало слишком поздно. Seymour Cray',
    'Меня два раза спрашивали [члены Парламента]: «Скажите на милость, мистер Бэббидж, что случится, если вы введёте в машину неверные цифры? Cможем ли мы получить правильный ответ?» Я не могу себе даже представить, какая путаница в голове может привести к подобному вопросу. Charles Babbage',
    'С имеет мощь ассемблера и удобство… ассемблера. Dennis Ritchie',
    'UNIX невероятно прост, но нужно быть гением, чтобы понять эту простоту. Dennis Ritchie',
    'Нельзя доверять коду, который вы не написали полностью сами. Ken Thompson',
    'Ограничение возможностей языка с целью предотвращения программистских ошибок в лучшем случае опасно. Bjarne Stroustrup',
    'Если вы считаете, что С++ труден, попытайтесь выучить английский. Bjarne Stroustrup',
    'Что бы нового мы ни создавали, мы должны дать людям возможность переходить от старых инструментов и идей к новым. Bjarne Stroustrup',
    'Небольшие программы случайно компилируются и выполняются правильно при первой же попытке. Но если это происходит с любой не тривиальной программой, то это очень и очень подозрительно. Bjarne Stroustrup',
    'Модульность — фундаментальный аспект всех успешно работающих крупных систем. Bjarne Stroustrup',
    'Доказательство с помощью аналогий — это обман. Bjarne Stroustrup',
    'Программа, которая не тестировалась, не является рабочей. Bjarne Stroustrup',
    'Программирование — это не наука, а ремесло. Richard Stallman',
    'Люди думают, что безопасность — это существительное, что-то, что можно купить. На самом же деле безопасность — это абстрактное понятие, как счастье. James Gosling',
    'Если бы меня попросили выбрать какой-нибудь современный язык на замену Java, я бы выбрал Scala. James Gosling',
    'Проблема С++ в том, что необходимо узнать всё о нём перед тем, как начать писать на нём все что угодно. Larry Wall',
    'Дизайн языка программирования — это как прогулка по парку. Парку Юрского Периода. Larry Wall',
    'Думаю, это будет новой фичей. Только не говорите никому, что она возникла случайно. Larry Wall',
    'Тяжело улучшать код, который до этого уже улучшали много раз. Larry Wall',
    'Лень — главное достоинство программиста. Larry Wall',
    'Чтобы понять алгоритм, нужно его увидеть. Donald Knuth',
    'У меня предчувствие, что неизвестные цепочки ДНК расшифруются в копирайты и патенты. Donald Knuth',
    'Если вы наслаждаетесь используемыми инструментами, то работа будет выполнена успешно. Donald Knuth',
    'Помните, что обычно есть решение проще и быстрее того, что первым приходит вам в голову. Donald Knuth',
    'Если оптимизировать всё, что можно, то вы будете вечно несчастным. Donald Knuth',
    'Алгоритм Евклида — дед всех алгоритмов, потому что это старейший нетривиальный алгоритм, доживший до наших дней. Donald Knuth',
    'Легче изобрести будущее, чем предсказать его. Alan Kay',
    'Программированию обычно учат на примерах. Niklaus Wirth',
    'Программы становятся медленнее быстрее, чем «железо» становится быстрее. Niklaus Wirth',
    'Я называю это моей ошибкой на миллиард. Изобретение нулевого указателя (null — прим. ред.) в 1965. Tony Hoare',
    'Некоторые проблемы лучше не решать, а избегать. Tony Hoare',
    'Одно аккуратное измерение стоит тысячи мнений экспертов. Grace Hopper',
    'У людей аллергия на перемены. Grace Hopper',
    'Мы не можем перекладывать свои ошибки на используемые технологии. Tim Berners-Lee',
    'Лень — естественное состояние программиста, после которого он рождает хороший алгоритм. Народное творчество',
    'Магия перестаёт существовать после того, как вы понимаете, как она работает. Tim Berners-Lee',
    'Способ использования интеллекта важнее, чем его уровень. C. MacConnell',
    'Компьютер позволяет нам совершать ошибки гораздо быстрее, чем любые другие изобретения человечества, за исключением, пожалуй, текилы и оружия. Mitch Radcliffe',
    '640 Кб должно хватить для любых задач. Bill Gates',
    'Основная проблема программистов состоит в том, что их ошибки невозможно предугадать. Seymour Cray',
    'Два самых известных продукта, созданных в Университете Беркли — это UNIX и LSD. Это не может быть просто совпадением. Jeremy S. Anderson'
  ];
}