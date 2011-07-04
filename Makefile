all: get-deps compile

compile:
	./rebar compile

fast:
	./rebar compile skip_deps=true

get-deps:
	./rebar get-deps

update-deps:
	./rebar get-deps

clean:
	./rebar clean

doc: docs

docs:
	./rebar doc
