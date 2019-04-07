# Lixchat
- as of now this is mostly from here: https://www.jungledisk.com/blog/2018/03/19/tutorial-a-simple-http-server-in-elixir/
## Current usage
GET request: 
```
curl -v "http://localhost:8085/hello"
```

POST
```
curl -v -H 'Content-Type: application/json' "http://localhost:8085/post" -d '{"message": "hello world" }'
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `lixchat` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lixchat, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/lixchat](https://hexdocs.pm/lixchat).

