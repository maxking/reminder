##To-Do in Erlang

This is a concurrent reminder application. You can set a reminder and event
server starts a process which when dies after given timeout sends out message
which is then delegated to the subscribed clients.

Compile the code by
    `erl -make`

Usage:
```erlang
	 1> evserv:start().
 	 <0.34.0>
 	 2> evserv:subscribe(self()).
 	 {ok,#Ref<0.0.0.31>}
	 3> evserv:add_event("Hey there", "test", FutureDateTime).
 	 ok
 	 4> evserv:listen(5).
 	 []
 	 5> evserv:cancel("Hey there").
 	 ok
 	 6> evserv:add_event("Hey there2", "test", NextMinuteDateTime).
 	 ok
 	 7> evserv:listen(2000).
 	 [{done,"Hey there2","test"}]
```