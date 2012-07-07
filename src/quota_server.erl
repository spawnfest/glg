-module(quota_server).
-behavior(gen_server).
-export([
        start_link/1,

        % gen server callbacks
        code_change/3,
        handle_call/3,
        handle_cast/2,
        handle_info/2,
        init/1,
        terminate/2
    ]).

-record(state, {
    limit = [],
    used = [],
    suspended = false
}).

name(Name) when is_atom(Name) ->
    list_to_atom(atom_to_list(?MODULE) ++ "." ++ atom_to_list(Name)).

start_link(Name) ->
    Limit = 100, %FIXME
    start_link(Name, Limit).
start_link(Name, Limit) ->
    gen_server:start_link({local, name(Name)}, ?MODULE, Limit, []).



%%%%%%%%%%%%%%%% gen server callbacks %%%%%%%%%%%%%
init(Limit) ->
    {ok, #state{limit = Limit, used = 0}}.

handle_call(_Request, _From, State) -> {noreply, State}.
code_change(_OldVsn, State, _Extra) -> {ok, State}.
terminate(_Reason, _State) -> ok.
handle_cast(_Request, State) -> {noreply, State}.
handle_info(_Request, State) -> {noreply, State}.

