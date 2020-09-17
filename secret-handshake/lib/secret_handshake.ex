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

  @handshakes ["wink", "double blink", "close your eyes", "jump", ""]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    array_of_digits = Integer.digits(code, 2) |> Enum.reverse()

    list_of_tuples =
      Enum.zip([array_of_digits, @handshakes])

    result =
      if length(list_of_tuples) == 5 do
        list_of_tuples |> Enum.reverse()
      else
        list_of_tuples
      end

    result
    |> Enum.reduce([], fn {digit, action}, acc ->
      if digit == 1 and action != "" do
        acc ++ [action]
      else
        acc
      end
    end)
  end
end
