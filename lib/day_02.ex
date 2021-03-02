defmodule Day02 do
  @moduledoc """
  Documentation for `Day 02`.
  """

    def recorrer_lista([h|t]) do
      [h2|t2] = t
      head = h + h2
      # IO.inspect([head|t2])

      if (head < 2020) do
        IO.inspect("#{h} + #{h2} = #{head}")
        lista_parcial = part_one([head|t2])
        IO.inspect(lista_parcial)
      end
      recorrer_lista(t, [h])
    end

    def recorrer_lista([h|t], reverse_list) do
      {head, t2, h2} =
        if (List.last(t)== nil) do
         {h + List.last(reverse_list), [], 00}
        else
          [h2|t2] = t
          {h + h2, t2, h2}
        end

      d =
      if (List.last(t)== nil) do
        [_hr|tr]  = Enum.reverse(reverse_list)
        #  IO.inspect([head] ++ tr)
        [head] ++ tr
       else
        #  IO.inspect(reverse_list ++ [head] ++ t2)
        reverse_list ++ [head] ++ t2
       end

      if (head < 2020) do
        IO.inspect("#{h} + #{h2} = #{head}")
        lista_parcial = part_one(d)
        # lista_parcial = part_one([head] ++ t2)
        IO.inspect(lista_parcial)
      end

      recorrer_lista(t, [h|reverse_list])
    end

    def recorrer_lista([], _reverse_list) do
      :ok
    end

    def part_one(entries) do
      entries
      |> Enum.map(fn x ->
        Enum.filter(entries, fn y ->
          y + x == 2020
        end)
      end)
      |> List.flatten()
    end

    def get_entries() do
      test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1_sample.txt"
      # test_file = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day1/puzzle_input_d1.txt"
      {:ok, contents} = File.read(test_file)

      contents
      |> String.split("\n", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)
    end
end
