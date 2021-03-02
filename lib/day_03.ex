defmodule Day03 do
  @moduledoc """
    Documentation for `Day 03`.
  """
  @origin 0
  @steps_x 3
  @steps_y 1
  @size_y 322
  @size_x 969
  #322 * 1 (steps) = 322
  #322 * 3 (steps) = 969
  #322 * 5 (steps)
  #322 * 7 (steps)
  #322 * 1 (steps)

  @doc """
    (x,y) |  (x,y)  |  (x,y)  |  (x,y)  |  (x,y)  |
    (1,1) |  (3,1)  |  (5,1)  |  (7,1)  |  (1,2)  |  producto
    ______|_________|_________|_________|_________|_____________
    2     |  7      |  3      |  4      |  2      | 336
    57    |  193    |  71     |  49     |  35     | 1339536765
  """
  def tree_counter() do
    matrix = get_entries()
    coodinates = iterate()

    coodinates
      |> Enum.map(fn {x, y} ->
        # IO.inspect(" #{x}, #{y}")
        get_value(matrix, x, y)
      end)
      |> Enum.count(fn value ->
        value == "#"
      end)
  end

  def iterate(index, _, acc) when index == @size_y do
    acc
  end

  def iterate(y, x, acc) do
    y2 = get_y(y)
    x2 = get_x(x)
    iterate(y2, x2, acc ++ [{x2, y2}])
  end

  def iterate() do
    x = get_x(@origin)
    y = get_y(@origin)
    iterate(y, x, [{x, y}])
  end

  def get_y(index) do
    index + @steps_y
  end

  def get_x(x) do
    absolut_x2 = x + @steps_x
    cond do
      absolut_x2 > @size_x ->
        (absolut_x2 - @size_x) - 1
      true ->
        absolut_x2
    end
  end

  def get_value(matrix, x, y) do
    matrix
      |> Enum.at(y)
      |> Enum.at(x)
  end

  def get_entries() do
    # path_entries = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_03/input_03_ext.txt"
    path_entries = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_03/input_03_sample.txt"
    {:ok, contents} = File.read(path_entries)

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.graphemes(x)  end)
  end

end
