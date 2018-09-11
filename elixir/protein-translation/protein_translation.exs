defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @proteins [
    {:Cysteine, ["UGU", "UGC"]},
    {:Leucine, ["UUA", "UUG"]},
    {:Methionine, ["AUG"]},
    {:Phenylalanine, ["UUU", "UUC"]},
    {:Serine, ["UCU", "UCC", "UCA", "UCG"]},
    {:Tryptophan, ["UGG"]},
    {:Tyrosine, ["UAU", "UAC"]},
    {:STOP, ["UAA", "UAG", "UGA"]}
  ]
  
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
  end
end
