%%% vim: set ts=4 sts=4 sw=4 expandtab:
-module(gtl_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    gtl_sup:start_link().

stop(_State) ->
    ok.
