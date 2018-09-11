defmodule Luhn do
  def digit_wrap(num) do
    cond do
      num > 9 ->
        num - 9
      true ->
        num
    end
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number = number
      |> String.replace(" ", "")

    try do
      _ = String.to_integer(number) # This will raise an exception if there are
                                    # any punctuation characters.
      if number == "0" do
        raise ArgumentError
      end

      remainder = number
        |> String.reverse()
        |> String.to_charlist()
        |> Enum.reduce([ [], [] ], fn n, acc ->
            cond do
              length(Enum.at(acc, 0)) == length(Enum.at(acc, 1)) ->
                [[ n | Enum.at(acc, 0) ], Enum.at(acc, 1) ]
              length(Enum.at(acc, 0)) > length(Enum.at(acc, 1)) ->
                [Enum.at(acc, 0), [ n | Enum.at(acc, 1) ]]
            end
          end
          )
        |> List.update_at(1, fn doubles ->
          Enum.map(doubles, fn n ->
            List.to_integer([n]) * 2
              |> digit_wrap()
              |> Integer.to_charlist()
          end)
        end)
        |> List.flatten()
        |> Enum.reduce(0, fn n, acc -> acc + List.to_integer([n]) end)
        |> Integer.mod(10)

      cond do
        remainder == 0 ->
          true
        true ->
          false
      end
    rescue
      ArgumentError ->
        false
    end
  end
end
