defmodule Day08 do
  @moduledoc """
  Documentation for `Day 08`.
  """

  @operations [:nop, :acc, :jmp]

  def get_entries(path) do
    path = "lib/resources/day_08/input_08_sample.txt"
    # path ="/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/day_08/input_08.txt"

    contents =
      case File.read(path) do
        {:ok, contents} -> contents
        {:error, :enoent} -> :error
      end

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&itemize(&1))
    |> IO.inspect
    end

    def itemize(item) when is_binary(item) do
      # ["nop", "+0"]
      [h|[t]] = String.split(item, " ", trim: true)

      operation = get_operation(h)
      sign = get_sign(t)
      value = get_value(t)

      {operation, sign, value}
    end

    def get_sign(value) when is_binary(value), do: String.first(value) # "+0"

    def get_value(value) when is_binary(value) do
      # "+0"
      value
      |> String.slice(1..-1)
      |> String.to_integer()
    end

    def get_operation("nop"), do: :nop
    def get_operation("acc"), do: :acc
    def get_operation("jmp"), do: :jmp
    def get_operation(_), do: :error
end
