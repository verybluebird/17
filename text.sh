iptables -F #удаляет все правила в цепочке, если цепочка не указана – удалятся все правила таблицы filter
iptables -A INPUT -i wlo1 -p tcp --dport 22 -j ACCEPT
#-A -  	добавить правило к цепочке (в самое начало)
# INPUT - цепочка, применяются к пакетам, которые предназначаются для самого хоста или для локального процесса, запущенного на данном хосте. 
То есть не являются транзитными;
# -i wlo1 - обрабатывает только входящие пакеты, прилетающие на сетевой интерфейс {имя интерфейса}
# -p tcp - явно указали протокол TCP. 
# --dport 22 - указали адресованные какому порту пакеты мы хотим фильтровать. 
# ACCEPT - разрешить прохождение пакета;
iptables -A INPUT -i eth0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# -m включает дополнительные модули, явно задающимися данным ключем. 
# conntrack - позволяет ядру отслеживать все логические сетевые соединения или потоки и тем самым идентифицировать все пакеты, которые составляют каждый поток,
чтобы их можно было последовательно обрабатывать вместе.
# --ctstate состояние пакета
#ESTABLISHED — Все пакеты принадлежащие установленному соединению (Например, GET ответ web-сервера)

#RELATED — Пакеты, не принадлежащие установленному соединению (то есть те пакеты, которые являются частью новых соединений, 
которые было инициированы уже установленным ESTABLISHED соединением), но связанные с ним
# -j 	--jump {действие} 	применяет одно из действий accept, drop, reject и другие
iptables -A INPUT -i eth0 -j DROP
