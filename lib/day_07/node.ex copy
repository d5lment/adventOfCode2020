defmodule Day07.Node do
  @moduledoc """
    Definition of node
  """
  defstruct node: nil,
            bags: [],
            parent: nil,
            childs: []

  def new(node, bags, parent, childs)do
    %{
      %__MODULE__{} |
        node: node,
        bags: bags,
        parent: parent,
        childs: childs
    }
  end

  def add_childs(node, childs)do
    %{node | childs: childs}
  end
end
