defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.filter(strand, &(&1 == nucleotide)) |> Enum.count()
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
      |> Map.new(fn x -> {x, 0} end)
      |> Map.replace!(?A, count(strand, ?A))
      |> Map.replace!(?T, count(strand, ?T))
      |> Map.replace!(?C, count(strand, ?C))
      |> Map.replace!(?G, count(strand, ?G))
  end
end
