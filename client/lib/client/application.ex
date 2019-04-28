defmodule Client.Application do
    use Application

    def start(_type, _args) do
        {name, server_name, cookie} = get_user_info() 
            |> connect()
    end
  
    defp get_user_info() do
        name = IO.gets("What's your name? ")
            |> String.trim()
        server_name = IO.gets("Connect to: ")
            |> String.trim()
            |> String.to_atom()
        cookie = IO.gets("What is that servers cookie? ")
            |> String.trim()
            |> String.to_atom()

        {name, server_name, cookie}
    end

    defp connect({name, server_name, cookie}) do
        IO.puts("attempting connection to: #{server_name}")
        Node.set_cookie(Node.self, :"asdf\n")
        Node.connect(server_name)
    end
  
  end
  