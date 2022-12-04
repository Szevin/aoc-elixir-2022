defmodule Day4 do
  def input() do
    File.stream!("4.txt")
    |> Stream.map(&(String.split(&1, ",")))
    |> Stream.map(&(Enum.map(&1, fn pair -> String.trim(pair) end)))
    |> Stream.map(&Enum.map(&1, fn pair ->
      %{
        :start => String.to_integer(Enum.at(String.split(pair, "-"), 0)),
        :end => String.to_integer(Enum.at(String.split(pair, "-"), 1))
      }
    end))
  end

  def part1() do
    input()
    |> Enum.reduce(0, fn pairs, sum ->
      cond do
      Enum.at(pairs, 0).start >= Enum.at(pairs, 1).start and Enum.at(pairs, 0).end <= Enum.at(pairs, 1).end ->
        sum + 1
      Enum.at(pairs, 1).start >= Enum.at(pairs, 0).start and Enum.at(pairs, 1).end <= Enum.at(pairs, 0).end ->
        sum + 1
      true -> sum
      end
    end)
  end

  def part2() do
    input()
    |> Stream.map(fn pairs ->
      %{
        :first => Range.new(Enum.at(pairs, 0).start, Enum.at(pairs, 0).end),
        :second => Range.new(Enum.at(pairs, 1).start, Enum.at(pairs, 1).end)
      }
    end)
    |> Enum.reduce(0, fn pairs, sum ->
      cond do
      Range.disjoint?(pairs.first, pairs.second) ->
        sum
      true ->
        sum + 1
      end
    end)
  end
end
