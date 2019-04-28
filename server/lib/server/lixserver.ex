defmodule Server.LixServer do 
    use GenServer

    @moduledoc """
    Handles callbacks and the client API.
    """

    # Client API

    def start_link([]) do
        GenServer.start_link(__MODULE__, :ok, [])
    end

    def init(:ok) do
        hello()
        {:ok, %{}}
    end

    def hello do
        IO.puts "hello"
    end


    def get_message({name, message}) do
        GenServer.cast(:server, {name, message})
    end

    # Sends the message to all of the users connected
    def send_message({names, message}) do
    
    end


    # Server callbacks
    def handle_cast(:server, {name, message}) do
        
    end



end