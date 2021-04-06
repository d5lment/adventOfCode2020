defmodule Day07 do
  @moduledoc """
  Documentation for `Day 07`.
  """
  alias Day07.Node

  def find_bag_options(path, bag) do
    path
    |> make_tree(bag)
    |> navigate_tree()
    |> Enum.uniq
    |> Enum.count
  end

  def navigate_tree(tree) do
    keys =
      tree
      |> Keyword.keys() # [:"muted yellow", :"bright white"]

    keys
    |> Enum.reduce(keys, fn key, acc ->
        {:ok, node} = Keyword.fetch(tree, key)
        childs = node.childs
        keys_childs = Keyword.keys(childs)
        acc ++ keys_childs
        # ["dark orange", "light red"], ["dark orange", "light red"]
      end)
  end

  def make_tree(path, bag) do
    entries = get_entries(path)
    nodes = find_nodes(entries, bag)

    Enum.reduce(nodes, nodes, fn {key, nodo}, acc ->
      childs = find_nodes(entries, nodo.node)
      Keyword.put(acc, key, Node.add_childs(nodo, childs))
    end)
  end

  def find_nodes(entries, bag)do
    entries
    |> Enum.filter(fn x ->
      !String.contains?(x, bag <> " bags contain") && String.contains?(x, bag)
      end)
    # |> IO.inspect
    |> Enum.reduce([], fn x, acc ->
        [h|t] = String.split(x, " bags contain ", trim: true)
        bags = String.split(Enum.at(t, 0), ",", trim: true)
        item = {String.to_atom(h), Node.new(h, bags, bag, [])}
        [item|acc]
      end)
    # |> IO.inspect
  end

  def get_entries(path_entries) do
    {:ok, contents} = File.read(path_entries)
    String.split(contents, "\n", trim: false)
  end
end
