defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @nucleotides [{:G, 'C'}, {:C, 'G'}, {:T, 'A'}, {:A, 'U'}]

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
      |> List.to_string()
      |> String.upcase()
      |> String.to_charlist()
      |> Enum.map(fn l -> @nucleotides[List.to_atom([l])] end)
      |> Enum.reduce('x', &Enum.into/2)
      |> Enum.drop(1)
      # I wasn't able to figure out how to reduce() with an empty list as the
      # accumulator.
  end
end
