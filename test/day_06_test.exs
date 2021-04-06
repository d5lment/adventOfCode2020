defmodule Day06Test do
  @moduledoc """
    Test for module `Day 06`.
  """
  use ExUnit.Case
  doctest Day06

  @sample "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_06/input_06_sample.txt"
  @entry "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_06/input_06.txt"

  test_data = [
    {1, @sample, 11},
    {2, @entry, 6387}]

  for {index, entradas, total} <- test_data do
    @index index
    @entradas entradas
    @total total
    test "#{@index} For each group, count the number of questions to which anyone answered yes. What is the sum of those counts?"do
      assert Day06.count_yes_questions(@entradas) == @total
    end
  end

end
