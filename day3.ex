defmodule Day3 do
  def input() do
    File.stream!("3.txt")
    |> Stream.map(&String.trim/1)
  end

  def letterToScore(stream) do
    stream
    |> Stream.map(fn letter ->
      if letter == String.upcase(letter) do
        Enum.at(to_charlist(letter) ++ [0], 0) - 38
      else
        Enum.at(to_charlist(letter) ++ [0], 0) - 96
      end
    end)
    |> Enum.sum()
  end

  def part1() do
    input()
    |> Stream.map(fn input -> String.split_at(input, div(String.length(input), 2)) end)
    |> Stream.map(&Tuple.to_list/1)
    |> Stream.map(&(Enum.map(&1, fn sack -> String.split(sack, "", trim: true) end)))
    |> Stream.map(fn input ->
    Enum.at(Enum.at(input, 0) -- (Enum.at(input, 0) -- Enum.at(input, 1)), 0)
    end)
    |> letterToScore()
  end

  def part2() do
    input()
    |> Stream.chunk_every(3)
    |> Stream.map(&(Enum.map(&1, fn sack -> String.split(sack, "", trim: true) end)))
    |> Stream.map(fn input ->
      Enum.uniq(Enum.at(input, 0)) ++ Enum.uniq(Enum.at(input, 1)) ++ Enum.uniq(Enum.at(input, 2))
    end)
    |> Stream.map(&Enum.frequencies/1)
    |> Stream.map(fn counts -> Enum.max_by(counts, &elem(&1, 1)) end)
    |> Enum.map(fn {letter, _count} -> letter end)
    |> letterToScore()
  end
end
