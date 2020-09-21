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

  defguard filtering(digit, action) when digit == 1 and action != ""

  @handshakes ["wink", "double blink", "close your eyes", "jump", ""]

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    array_of_digits = Integer.digits(code, 2) |> Enum.reverse()

    list_of_tuples = Enum.zip([array_of_digits, @handshakes])

    result = reverse?(list_of_tuples)

    result
    |> Enum.reduce([], fn {digit, action}, acc ->
      collect_actions(digit, action, acc)
    end)
  end

  defp reverse?(list_of_tuples) when length(list_of_tuples) == 5,
    do: list_of_tuples |> Enum.reverse()

  defp reverse?(list_of_tuples), do: list_of_tuples

  defp collect_actions(digit, action, acc) when filtering(digit, action), do: acc ++ [action]
  defp collect_actions(_, _, acc), do: acc
end
