defmodule Client do

    def client_IO({name}) do
        message = IO.gets(">> ")

        

        Enum.each Node.list, fn node ->
            send_message(node, name, message)
        end

        client_IO({name})
    end    


    #defp send_message({name, message}) do
    #    Enum.each Node.list, fn node ->
    #        send_to_node(node, {name, message})
    #    end
    #end
#
    #defp send_to_node(node, {name, message}) do
    #    pid = Node.spawn_link(node, fn -> IO.puts("hello luke") end)
    #    #Node.spawn_link(node, Client.Application, :receive_message, [{name, message}] ) 
    #end

    def receive_message(from, message) do
        IO.puts("\n #{from}: #{message}")
    end

    def send_message(to, from, message) do
        spawn_task(__MODULE__, :receive_message, to, [from, message])
    end


    def spawn_task(module, fun, to, args) do
        to
        |> remote_supervisor()
        |> Task.Supervisor.async(module, fun, args)
        |> Task.await()
    end

    defp remote_supervisor(to) do
        {Client.TaskSupervisor, to}
    end


end