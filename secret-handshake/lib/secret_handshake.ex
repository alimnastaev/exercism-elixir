defmodule SecretHandshake do
  use Bitwise

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
  @handshakes [{1, "wink"}, {2, "double blink"}, {4, "close your eyes"}, {8, "jump"}]

  def commands(code) do
    @handshakes
    |> Enum.reduce([], fn {bit, action}, acc ->
      collect_actions(action, bit, code, acc)
    end)
    |> reverse?(code)
  end

  defp collect_actions(_, bit, code, acc) when (bit &&& code) == 0, do: acc
  defp collect_actions(action, _, _, acc), do: acc ++ [action]

  defp reverse?(result, code) when (code &&& 16) == 0, do: result
  defp reverse?(result, _), do: result |> Enum.reverse()
end
