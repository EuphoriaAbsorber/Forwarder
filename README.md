![image](https://user-images.githubusercontent.com/60546290/145097606-c22ed7a6-0cbc-4779-9c38-074c60b1e8f8.png)
# Команда FORWARDER пишет приложение AnyWay 

## Идея
Здесь ты поймешь, куда отправишься.

Пользователю предлагается пройти не очень большой опрос, состоящий из вопросов с ответами да/нет/далее, по результатам которого будет предложена оптимальная поездка.
В любой момент можно досрочно завершить или пропустить вопросы, но в таком случае будет предложено большее количество вариантов.
Каждый вопрос будет привязан к определенному фильтру(тернарному/бинарному), следовательно можно быстро поменять конфигурацию. 
Будет разделение на зарубежные поездки и на переезды внутри родной страны.
В детальной информации по стране/городу будет приведены данные о погоде, ситуации с covid-19, надобность визы, последние новости, возможно еще достопримечательности и экскурсии, заказ билетов или прямая пересылка на сайт авиокомпании(любой)... 
Будут храниться избранные поездки, может быть фильтры(чтобы не настраивать заново).


## Возможно успеем (неважная часть)
В планах интегрировать карты(чтобы стало удобнее смотреть ближайшие к городу достопримечательности).
Возможно добавим просмотр открытых камер для живого анализа пользователя.
Система отзывов и добавления городов/мест.
Важная информацияя будет храниться в облаке. 

## Стек технологий Flutter приложения

- Hive/Drift - будет зависеть от типа данный (для отказоустойчивости предпочтем SQL)
- Block/Redux/GetX/Provider - в процессе выбора
- Dio/http - для работы с сетью
- Firebase/MongoDB - в процессе выбора
- может будут еще либы...

## Какие API мы будем использовать

- [Flight Data](https://rapidapi.com/Travelpayouts/api/flight-data/details)
- [Covid-19](https://datalens.yandex/7o7is1q6ikh23)
- [OpenWebCam](https://rapidapi.com/webcams.travel/api/webcams-travel)
- [Tour Data](https://www.multitour.ru/api_documentation/#geo_city)
- [Covid News](https://rapidapi.com/SmartableAI/api/coronavirus-smartable/)

## Дизайн
![image](https://user-images.githubusercontent.com/60546290/145102342-4bb5f53a-b804-48e0-ab7f-68dcce5b9fa2.png)
Можно посмотреть первые наброски в Figma [AnyWay design](https://www.figma.com/file/8qtjtMEJGiMcpRPFBUmOlV/Flutter-Intensive?node-id=0%3A1)
