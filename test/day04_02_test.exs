defmodule Day0402Test do
  use ExUnit.Case
  doctest Day0402

  setup do
    valid_passport =
      [hgt: "183cm",
      cid: "147",
      iyr: "2017",
      byr: "1937",
      hcl: "#fffffd",
      eyr: "2020",
      pid: "860033327",
      ecl: "gry"]
    {:ok, valid_passport: valid_passport}
  end

  test "Validate byr valid", %{valid_passport: valid_passport} do
    assert Day0402.validate_fields(:byr, valid_passport) == true
  end
end
