defmodule Day07Test do
  @moduledoc """
    Test for module `Day 07`.
  """

  use ExUnit.Case
  doctest Day07
  alias Day07Mocks

  setup do
    input = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_07/input_07.txt"
    path = "/Users/d5lment/workspace/D5lmentsDojo/adventOfCode2020/advent_of_code_2020/lib/resources/day_07/input_07_sample.txt"
    entries = Day07.get_entries(path)
    mock_tree = Day07Mocks.mock_tree()
    mock_entries = Day07Mocks.mock_entries()
    mock_nodes = Day07Mocks.mock_nodes()
    {:ok,
      entries: entries,
      path: path,
      input: input,
      mock_tree: mock_tree,
      mock_entries: mock_entries,
      mock_nodes: mock_nodes
    }
  end

  test "¿La entrada es un arreglo donde cada elemento es una oracion que termina con un punto?", %{path: path, mock_entries: mock_entries} do
    #Precondiciones
    assert path

    # TEST
    entries = Day07.get_entries(path)

    # Criterios de aceptacion
    # La enttrada esperada es un arreglo de cadenas que no está vacio
    assert [h|t] = entries
    # El arreglo debe tener 9 elementos
    assert Enum.count(entries) == 9
    # Cada elemento de la lista debe terminar con un punto
    Enum.each(entries, fn item ->
      assert String.ends_with?(item, ".")
    end)
    # El resultado esperado debe ser igual al obtenido
    assert mock_entries == entries
  end

  node_sample_data = [
   {"shiny gold", Day07Mocks.mock_node_shiny_gold},
   {"muted yellow", Day07Mocks.mock_node_muted_yellow},
   {"bright white", Day07Mocks.mock_node_bright_white}
  ]

  for {bag, node_expected} <- node_sample_data do
    @bag bag
    @node_expected node_expected

    test "Get node to #{@bag}", %{entries: entries} do
      node = Day07.find_nodes(entries, @bag)
      assert @node_expected == node
    end
  end

  test "Get tree from sample entries", %{path: path, mock_tree: mock_tree} do
    bag_root = "shiny gold"
    tree = Day07.make_tree(path, bag_root)
    assert mock_tree == tree
  end

  test "Navigate tree", %{mock_tree: mock_tree, mock_nodes: mock_nodes} do
    # Precondictions
    assert mock_tree
    # Test
    salida = Day07.navigate_tree(mock_tree)
    # Postconditions
    assert salida == mock_nodes
  end

  test "find_bag_options", %{path: path} do
    # Data
    bag = "shiny gold"

    # Precondictions
    assert path

    # Test
    salida = Day07.find_bag_options(path, bag)

    # Postconditions
    assert salida == 4
  end

end
