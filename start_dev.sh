#!/bin/bash

H=`hostname -f`
ONLYINITDB=$1

if [ -x `which erl` ]; then
        ERL=`which erl`
else
        ERL="/usr/local/bin/erl"
fi


EXEC="authbind --deep $ERL -name kakaweb@magda.home"

CMD="$EXEC -pa lib/*/ebin/ -pa site/ebin/ -boot start_sasl -config etc/app.config -config etc/webmachine.config -args_file etc/vm.args -simple_bridge_scratch_dir /tmp/"


$CMD -eval "[ ok = application:start(A, permanent) || A <- [nitrogen] ], sync:go()"
