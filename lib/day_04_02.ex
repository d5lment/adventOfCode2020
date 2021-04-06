defmodule Day0402 do
  @moduledoc """
  Documentation for `Day 04`.
  """

  @doc """
  ## Examples
      iex> Day0402.get_total_valid_passports("/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_04/input_04.txt")
      103
  """
  def get_total_valid_passports(file_path) do
    file_path
    |> get_entries()
    |> Enum.count(&validate_passport/1)
  end
  def validate_passport(passport) do
    Enum.reduce(get_required_fields(), true, fn required_field, acc ->
      case acc && Keyword.has_key?(passport, required_field) do
        true ->
            validate_fields(required_field, passport)
        _ ->
          false
      end
    end)
  end

  @spec validate_fields(:byr | :ecl | :eyr | :hcl | :hgt | :iyr | :pid, keyword) ::
          false | nil | true
  def validate_fields(field, passport)do
    field_value = Keyword.get(passport, field)
    case field do
      :hgt ->
        is_valid_hgt = Regex.match?(~r/^(\d{1,}cm|\d{1,}in)$/, field_value)
        if is_valid_hgt do
          hgt_length = String.length(field_value)
          hgt_units = String.slice(field_value, (hgt_length-2)..hgt_length)
          hgt_value = String.slice(field_value, 0..(hgt_length-3))
          validate_field(field, hgt_value, hgt_units)
        end
      _ ->
      validate_field(field, field_value)
    end
  end

  def validate_field(:byr, field_value) do
    is_valid_range?(field_value, 1920, 2002)
  end

  def validate_field(:iyr, field_value) do
    is_valid_range?(field_value, 2010, 2020)
  end

  def validate_field(:eyr, field_value) do
    is_valid_range?(field_value, 2020, 2030)
  end

  def validate_field(:hcl, field_value) do
    # a # followed by exactly six characters 0-9 or a-f.
    Regex.match?(~r/^#[\da-f]{6}$/, field_value)
  end

  def validate_field(:ecl, field_value) do
    Regex.match?(~r/^amb|blu|brn|gry|grn|hzl|oth$/, field_value)
  end

  def validate_field(:pid, field_value) do
    Regex.match?(~r/^[\d]{9}$/, field_value)
  end

  def validate_field(:hgt, field_value, "cm") do
    is_valid_range?(field_value, 150, 193)
  end

  def validate_field(:hgt, field_value, "in") do
    is_valid_range?(field_value, 59, 76)
  end

  defp is_valid_range?(field_value, min, max) when is_integer(min) and is_integer(max) and is_binary(field_value) do
    {value, _} = Integer.parse(field_value)
    value >= min && value <= max
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
