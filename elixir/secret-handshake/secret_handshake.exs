defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  
  def reverse?(enum) do
    val = Enum.reverse(enum) |> Enum.take(1)
    if val == ["reverse"] do
      Enum.reverse(enum) |> Enum.drop(1)
    else
      enum
    end
  end
  
  def commands(code) do
    actions = ["wink", "double blink", "close your eyes", "jump", "reverse"]
    
    handshake =
      code
        |> Integer.to_string(2)
        |> String.reverse
        |> String.splitter("", trim: true)
        |> Enum.take(5)
        |> Enum.zip(actions)
        |> Enum.filter(fn entry -> elem(entry, 0) == "1" end)
        |> Enum.map(fn entry -> elem(entry, 1) end)
        |> reverse?
  end
end

SecretHandshake.commands(405)
