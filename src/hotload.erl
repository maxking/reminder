-module(hotload).
-export([server/1, upgrade/1]).

server(State) ->
	receive
		update ->
			NewState = ?MODULE:upgrade(state),
			?MODULE:server(NewState);
		SomeMessage ->
			server(State)
	end.

upgrade(OldState) ->
	%% transform and return the state here.
	OldState.
