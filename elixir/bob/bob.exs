defmodule Bob do
  def hey(input) do
    empty = String.match?(input, ~r/^\s*$/)
    question = String.ends_with?(input, "?")
    upcase = input |> String.upcase |> String.jaro_distance(input)
    downcase = input |> String.downcase |> String.jaro_distance(input)

    yelling =
      if upcase > downcase do
        true
      else
        false
      end
    
    cond do
      empty -> "Fine. Be that way!"
      question and not yelling -> "Sure."
      yelling and not question -> "Whoa, chill out!"
      question and yelling -> "Calm down, I know what I'm doing!"
      not question and not yelling -> "Whatever."
    end
  end
end
