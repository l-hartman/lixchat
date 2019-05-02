defmodule Client.Application do
    use Application

    def start(_type, _args) do
        children = [
            {Task.Supervisor, name: Client.TaskSupervisor}
        ]

        opts = [strategy: :one_for_one, name: Client.Supervisor]

        Supervisor.start_link(children, opts)

        get_user_info() 
            |> connect_nodes()
            |> Client.client_IO()
    end
  
    defp get_user_info() do
        name = IO.gets("What's your name? ")
            |> String.trim()
        server_name = IO.gets("Connect to: ")
            |> String.trim()        
        cookie = IO.gets("What is that servers cookie? ")
            |> String.trim()
            |> String.to_atom()
        {name, server_name, cookie}
    end

    defp connect_nodes({name, server_name, cookie}) do
        Node.set_cookie(Node.self, cookie)
        cond do 
            not String.equivalent?(server_name, "none") ->
                IO.puts("\n     attempting connection to #{server_name}.")
                String.to_atom(server_name)
                    |> Node.connect()
                IO.puts("\n     successful connection. Happy messaging!")
                greet_nodes(name)
            true -> "no server to connect to... wait for others."
        end
        {name}
    end

    defp greet_nodes(name) do
        Enum.each Node.list, fn node ->
            Client.send(node, name, "#{name} has joined the chat. Say hi!")
        end
    end
  end
  