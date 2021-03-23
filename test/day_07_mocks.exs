defmodule Day07Mocks do
  @moduledoc """
    Datos de prueba
  """

  def mock_tree do
    [
      "bright white": %Day07.Node{
        bags: ["1 shiny gold bag."],
        childs: [
          "dark orange": %Day07.Node{
            bags: ["3 bright white bags", " 4 muted yellow bags."],
            childs: [],
            node: "dark orange",
            parent: "bright white"
          },
          "light red": %Day07.Node{
            bags: ["1 bright white bag", " 2 muted yellow bags."],
            childs: [],
            node: "light red",
            parent: "bright white"
          }
        ],
        node: "bright white",
        parent: "shiny gold"
      },
      "muted yellow": %Day07.Node{
        bags: ["2 shiny gold bags", " 9 faded blue bags."],
        childs: [
          "dark orange": %Day07.Node{
            bags: ["3 bright white bags", " 4 muted yellow bags."],
            childs: [],
            node: "dark orange",
            parent: "muted yellow"
          },
          "light red": %Day07.Node{
            bags: ["1 bright white bag", " 2 muted yellow bags."],
            childs: [],
            node: "light red",
            parent: "muted yellow"
          }
        ],
        node: "muted yellow",
        parent: "shiny gold"
      }
    ]
  end

  def mock_node_shiny_gold  do
    # entry = shiny gold
    [
      "muted yellow": %Day07.Node{
        bags: ["2 shiny gold bags", " 9 faded blue bags."],
        childs: [],
        node: "muted yellow",
        parent: "shiny gold"
      },
      "bright white": %Day07.Node{
        bags: ["1 shiny gold bag."],
        childs: [],
        node: "bright white",
        parent: "shiny gold"
      }
    ]
  end

  def mock_node_muted_yellow do
    [
      "dark orange": %Day07.Node{
        bags: ["3 bright white bags", " 4 muted yellow bags."],
        childs: '',
        node: "dark orange",
        parent: "muted yellow"
      },
      "light red": %Day07.Node{
        bags: ["1 bright white bag", " 2 muted yellow bags."],
        childs: '',
        node: "light red",
        parent: "muted yellow"
      }
    ]
  end

  def mock_node_bright_white do
    [
      "dark orange": %Day07.Node{
        bags: ["3 bright white bags", " 4 muted yellow bags."],
        childs: '',
        node: "dark orange",
        parent: "bright white"
      },
      "light red": %Day07.Node{
        bags: ["1 bright white bag", " 2 muted yellow bags."],
        childs: '',
        node: "light red",
        parent: "bright white"
      }
    ]
  end

  def mock_entries do
     ["light red bags contain 1 bright white bag, 2 muted yellow bags.",
     "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
     "bright white bags contain 1 shiny gold bag.",
     "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
     "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
     "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
     "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
     "faded blue bags contain no other bags.",
     "dotted black bags contain no other bags."]
  end

  def mock_nodes do
    [:"bright white", :"muted yellow", :"dark orange", :"light red", :"dark orange",:"light red"]
  end

  # def find_nodes(entries, nodes, parent) do
  #   nodes
  #   |> Enum.map(fn node ->
  #     # ["2 shiny gold bags", " 9 faded blue bags."]
  #     # 1. Si contiene al padre eliminar de la lista
  #       if !String.contains?(node, parent) do
  #         # 2. Si no es el padre: Eliminar puntos si existen
  #         a = String.replace(" 9 faded blue bags.", ".", "")
  #         # 3. Eliminar espacios al inicio y final de la cadena
  #         b = String.trim(a)
  #         # 4. obtener cantidad y nodo: [["9"], [" faded blue bags"]]
  #         [h|t] = Regex.scan(~r/[0-9]+|[a-z" "]+/, b)

  #       end
  #     end)
  # end
end
