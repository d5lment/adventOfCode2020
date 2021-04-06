# defmodule Day07Tres do
#   @moduledoc """
#   Documentation for `Day 07Tres`.
#   """
#   alias Day07.Node

#   def init(path, bag)do
#     entries = get_entries(path)
#     nodes = find_nodes(entries, bag)
#     Enum.map(nodes, fn nodo ->
#       %Node{nodo | childs: find_nodes(entries, nodo.node)}
#     end)

#   end

#   def make_tree(path, bag)do
#     entries = get_entries(path)
#     nodes = find_nodes(entries, bag)
#     Enum.map(nodes, fn node ->
#       childs = find_nodes(entries, node.node)
#       node_completed = %Node{node | childs: childs}
#       make_tree(nodes, entries, tree, node_completed)
#     end)
#   end

#   def make_tree(nodes, entries, tree, node_completed)do
#       Enum.map(nodes, fn node ->
#         Enum.reduce(node.childs, tree, fn child, acc ->
#           %Node{node | childs: find_nodes(entries, child.node)}
#         end)
#       end)
#   end

#   def make_tree([], _entries, tree)do
#     tree
#   end

#   def find_nodes(entries, bag)do
#     entries
#     |> Enum.filter(fn x ->
#       !String.contains?(x, bag <> " bags contain") && String.contains?(x, bag)
#       end)
#     |> Enum.reduce([], fn x, acc ->
#         [h|t] = String.split(x, " bags contain ", trim: true)
#         bags = String.split(Enum.at(t, 0), ",", trim: true)
#         [Node.new(h, bags, bag, [])|acc]
#       end)
#   end

#   def get_entries(path_entries) do
#     {:ok, contents} = File.read(path_entries)
#     String.split(contents, "\n", trim: false)
#   end

# end
