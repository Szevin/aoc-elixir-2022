defmodule Day2 do
  def input() do
    File.stream!("2.txt")
    |> Stream.map(fn
      input -> {Enum.at(to_charlist(String.at(input, 0)) ++ [0], 0) - 65, Enum.at(to_charlist(String.at(input, 2)) ++ [0], 0) - 88}
    end)
  end

  def part1() do
    input()
    |> Enum.reduce(0, fn
      {elf, me}, sum -> sum + me+1 + rem(elf-me+1, 3)*3
    end)
  end

  def part2() do
    input()
    |> Enum.reduce(0, fn
      {elf, outcome}, sum -> sum + rem(elf+outcome-1, 3)+1 + outcome*3
    end)
  end
end
