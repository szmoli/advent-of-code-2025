defmodule Day1 do
  def step(str) do
    {dir, dist} = String.split_at(str, 1)
    dist = String.to_integer(dist)
    dir = if dir == "L", do: -1, else: 1
    dir * dist
  end

  def turn(from, step), do: Integer.mod(from + step, 100)

  def sequence(steps, from), do: Enum.reverse sequence(from, steps, [])

  defp sequence(_from, [], acc), do: acc

  defp sequence(from, [step|steps], acc) do
    acc = [from|acc]
    sequence(turn(from, step), steps, acc)
  end

  def password(input) do
    input |> String.split("\n") |> Enum.map(&Day1.step/1) |> Day1.sequence(50) |> Enum.filter(&(&1 == 0)) |> Enum.count
  end
end
