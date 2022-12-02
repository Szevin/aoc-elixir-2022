defmodule Day2 do
  def input() do
    File.stream!("2.txt")
    |> Stream.map(fn
      "A " <> guess -> {:A, Enum.at(to_charlist(guess) ++ [0], 0) - 87}
      "B " <> guess -> {:B, Enum.at(to_charlist(guess) ++ [0], 0) - 87}
      "C " <> guess -> {:C, Enum.at(to_charlist(guess) ++ [0], 0) - 87}
    end)
  end

  def part1() do
    input()
    |> Enum.reduce(0, fn
      {:A, guess = 3}, sum -> sum + guess + 0
      {:A, guess = 1}, sum -> sum + guess + 3
      {:A, guess = 2}, sum -> sum + guess + 6

      {:B, guess = 1}, sum -> sum + guess + 0
      {:B, guess = 2}, sum -> sum + guess + 3
      {:B, guess = 3}, sum -> sum + guess + 6

      {:C, guess = 2}, sum -> sum + guess + 0
      {:C, guess = 3}, sum -> sum + guess + 3
      {:C, guess = 1}, sum -> sum + guess + 6
    end)
  end

  def part2() do
    input()
    |> Enum.reduce(0, fn
      {:A, 1}, sum -> sum + 3 + 0
      {:A, 2}, sum -> sum + 1 + 3
      {:A, 3}, sum -> sum + 2 + 6

      {:B, 1}, sum -> sum + 1 + 0
      {:B, 2}, sum -> sum + 2 + 3
      {:B, 3}, sum -> sum + 3 + 6

      {:C, 1}, sum -> sum + 2 + 0
      {:C, 2}, sum -> sum + 3 + 3
      {:C, 3}, sum -> sum + 1 + 6
    end)
  end
end
