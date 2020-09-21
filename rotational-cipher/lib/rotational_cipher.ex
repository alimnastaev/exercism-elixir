defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  defguard downcase(char) when char in ?a..?z
  defguard uppercase(char) when char in ?A..?Z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(fn char -> trans(char, shift) end)
    |> to_string()
  end

  defp trans(char, shift) when downcase(char), do: shifted_index(char, shift, ?a)
  defp trans(char, shift) when uppercase(char), do: shifted_index(char, shift, ?A)
  defp trans(char, _shift), do: char

  defp shifted_index(char, shift, first_letter), do: first_letter + rem(char - first_letter + shift, 26)
end
