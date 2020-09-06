defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  def count(sentence) do
    sentence
    |> String.replace(~r/[:,.!&@$%^&_]/, " ")
    |> String.downcase()
    |> String.split()
    # |> Enum.reduce(%{}, fn word, map -> Map.update(map, word, 1, &(&1 + 1)) end)
    |> Enum.reduce(%{}, fn word, map -> Map.update(map, word, 1, fn value -> value + 1 end) end)
  end
end
