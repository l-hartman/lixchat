defmodule Client do
  @moduledoc """
  Documentation for Client.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Client.hello()
      :world

  """
  def start(name, server) do
    IO.puts "#{name} says hello"
  end

  defp connect do 

  end
end
