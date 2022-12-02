defmodule Day1 do
  def calories() do
    File.read!("day1.txt")
    |> String.split("\n\n", trim: true)
    |> Enum.map(&(String.split(&1, "\n", trim: true)))
    |> Enum.map(fn elf -> Enum.map(elf, &String.to_integer/1) end)
    |> Enum.map(&Enum.sum/1)
end

  def part1() do
    calories()
    |> Enum.max()
  end

  def part2() do
    calories()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
