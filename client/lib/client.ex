defmodule Client do

    def client_IO({name}) do
        {IO.gets(">> ") |> String.trim(), name}
            |> handle_message()
        client_IO({name})
    end    

    defp handle_message({"/users", _name}) do
        IO.puts(Node.self)
        Enum.each Node.list, fn node ->
            IO.puts(node)
        end                
    end

    defp handle_message({"/leave", name}) do
        Enum.each Node.list, fn node ->
            Client.send(node, name, "#{name} has left the chat.")
        end
        System.halt(0)

    end

    defp handle_message({message, name}) do
        Enum.each Node.list, fn node ->
            send(node, name, message)
        end
    end

    def receive(from, message) do
        IO.puts("\n #{from}: #{message}")
    end

    def send(to, from, message) do
        spawn_task(__MODULE__, :receive, to, [from, message])
    end

    def spawn_task(module, fun, to, args) do
        {Client.TaskSupervisor, to}
        |> Task.Supervisor.async(module, fun, args)
        |> Task.await()
    end
end