defmodule Server.Application do
  #use Application

  def start(_type, _args) do
    build()
  end

  defp build() do
    IO.puts("starting server...")
    IO.puts(Node.self())
  end

  def server_loop() do
    IO.puts("")
    server_loop()
  end
  
  def receive_message({from, message}) do
    IO.puts("\n #{from}: #{message}")
  end

end
