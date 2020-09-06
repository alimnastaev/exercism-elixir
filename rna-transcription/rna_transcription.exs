defmodule RNATranscription do
  @nucleotides %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  def to_rna(dna) do
    Enum.map(dna, &@nucleotides[&1])
  end
end
