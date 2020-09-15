defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  def translate(phrase) do
    ending = "ay"
    # to cover a whole phrase
    words = String.split(phrase, " ")

    Enum.map(words, fn word ->
      cond do
        word =~ ~r/^[aeiuo]/ ->
          word <> ending

        word =~ ~r/^[xy][^aeiuo]/ ->
          [_, middle, tail] = splitted(word, ~r/[xy][^aeiou]/)

          middle <> tail <> ending

        word =~ ~r/squ/ ->
          [_, middle, tail] = splitted(word, ~r/squ/)

          tail <> middle <> ending

        word =~ ~r/qu/ ->
          [_, middle, tail] = splitted(word, ~r/qu/)

          tail <> middle <> ending

        true ->
          [head, middle, tail] = splitted(word, ~r/[aeiuo]/)

          middle <> tail <> head <> ending
      end
    end)
    |> Enum.join(" ")
  end

  defp splitted(word, regex) do
    String.split(word, regex, parts: 2, include_captures: true)
  end
end
