defmodule RomanNumerals do
  @integer_to_roman [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number, acc \\ "") do
    case @integer_to_roman |> Enum.find(fn {integer, _} -> integer <= number end) do
      {integer, roman_string} -> numeral(number - integer, acc <> roman_string)
      _ -> acc
    end
  end
end
