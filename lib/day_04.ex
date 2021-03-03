defmodule Day04 do
  @moduledoc """
  Documentation for `Day 04`.
  """

  @doc """
  ## Examples
      iex> Day04.get_total_valid_passports("/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_04/input_04.txt")
      170
  """
  def get_total_valid_passports(file_path) do
    file_path
    |> get_entries()
    |> Enum.count(&validate_passport/1)
  end
  def validate_passport(passport) do
    Enum.reduce(get_required_fields(), true, fn required_field, acc ->
      acc && Keyword.has_key?(passport, required_field)
    end)
  end

  defp get_required_fields do
    [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]
  end

  def get_entries(file_path) do
    {:ok, contents} = File.read(file_path)

    contents
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn x -> String.replace(x, " ", "\n")  end)
    |> Enum.map(fn x -> String.split(x, "\n", trim: true)  end)
    |> Enum.map(fn x ->
        Enum.map(x, fn fields ->
          String.split(fields, ":", trim: true)
        end)
      end)
    |> Enum.map(fn pairs ->
        Enum.reduce(pairs, [], fn ([key, val], acc) ->
        [{String.to_atom(key), val} | acc]
      end)
    end)
  end

end
