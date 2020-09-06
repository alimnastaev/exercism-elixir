defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @nucleotides %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  def to_rna(dna) do
    Enum.map(dna, &@nucleotides[&1])
  end
end
