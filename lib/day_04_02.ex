defmodule Day0402 do
  @moduledoc """
  Documentation for `Day 04`.
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
    #http://erlang.org/doc/man/re.html
    field_value = Keyword.get(passport, field)
    case field do
      :byr -> #four digits; at least 1920 and at most 2002
        is_valid_range?(field_value, 1920, 2002)
      :iyr -> #four digits; at least 2010 and at most 2020
        is_valid_range?(field_value, 2010, 2020)
      :eyr -> #four digits; at least 2020 and at most 2030
        is_valid_range?(field_value, 2020, 2030)
      :hgt -> #a number followed by either cm or in:
        is_valid_hgt = Regex.match?(~r/^(\d{1,}cm|\d{1,}in)$/, field_value)
        if is_valid_hgt do
          #179cm
          hgt_length = String.length(field_value)
          hgt_units = String.slice(field_value, (hgt_length-2)..hgt_length)
          hgt_value = String.slice(field_value, 0..(hgt_length-3))
          case hgt_units do
            "cm" ->
              #If cm, the number must be at least 150 and at most 193.
              is_valid_range?(hgt_value, 150, 193)
            "in" ->
              #If in, the number must be at least 59 and at most 76
              is_valid_range?(hgt_value, 59, 76)
          end
        end
      :hcl -> #a # followed by exactly six characters 0-9 or a-f.
        Regex.match?(~r/^#[\da-f]{6}$/, field_value)
      :ecl -> #exactly one of: amb blu brn gry grn hzl oth.
        Regex.match?(~r/^amb|blu|brn|gry|grn|hzl|oth$/, field_value)
      :pid -> #a nine-digit number, including leading zeroes.
        Regex.match?(~r/^[\d]{9}$/, field_value)
    end
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
