defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^\p{L}\d-]+/u, trim: true)
    |> Enum.reduce(%{}, fn word, map -> Map.update(map, word, 1, &(&1 + 1)) end)
  end
end
