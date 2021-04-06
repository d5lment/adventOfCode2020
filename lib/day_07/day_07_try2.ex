# defmodule Day07Try2 do
#   @moduledoc """
#   Documentation for `Day 07`.
#   """
#   alias Day07.Node

#   def find_bag_options(path, bag) do
#     path
#     |> make_tree(bag)
#     |> navigate_tree()
#     |> Enum.uniq
#     |> Enum.count
#   end

#   def navigate_tree(tree) do
#     keys =
#       tree
#       |> Keyword.keys() # [:"muted yellow", :"bright white"]

#     keys
#     |> Enum.reduce(keys, fn key, acc ->
#         {:ok, node} = Keyword.fetch(tree, key)
#         childs = node.childs
#         keys_childs = Keyword.keys(childs)
#         acc ++ keys_childs
#         # ["dark orange", "light red"], ["dark orange", "light red"]
#       end)
#   end

#   @spec make_tree(
#           binary
#           | maybe_improper_list(
#               binary | maybe_improper_list(any, binary | []) | char,
#               binary | []
#             ),
#           any
#         ) :: any
#   def make_tree(path, bag)do #la primera vez
#     entries = get_entries(path)
#     nodes = find_nodes(entries, bag)
#     tree = add_childs(nodes, entries)
#     make_tree(nodes, entries, tree)
#   end

#   def make_tree(nodes, entries, tree)do #caso generico
#     Enum.map(nodes, fn node ->

#       Enum.reduce(node.childs, tree, fn node, acc ->
#         grandchildren = find_nodes(entries, node.node)
#         [Node.add_childs(node, grandchildren) | List.delete(acc, node)]
#       end)
#     end)
#   end

#   def make_tree([], entries, tree)do #la ultima vez

#   end

#   def add_childs(nodes, entries) do
#     Enum.reduce(nodes, nodes, fn node, acc ->
#       childs = find_nodes(entries, node.node)
#       # [Node.add_childs(nodo, childs) | List.delete(acc, nodo)]
#       %Node{node | childs: childs}
#     end)
#   end

#   def find_nodes(entries, bag)do
#     entries
#     |> Enum.filter(fn x ->
#       !String.contains?(x, bag <> " bags contain") && String.contains?(x, bag)
#       end)
#     # |> IO.inspect
#     |> Enum.reduce([], fn x, acc ->
#         [h|t] = String.split(x, " bags contain ", trim: true)
#         bags = String.split(Enum.at(t, 0), ",", trim: true)
#         # item = {String.to_atom(h), Node.new(h, bags, bag, [])}
#         [Node.new(h, bags, bag, [])|acc]
#       end)
#     # |> IO.inspect
#   end

#   def get_entries(path_entries) do
#     {:ok, contents} = File.read(path_entries)
#     String.split(contents, "\n", trim: false)
#   end
# end
