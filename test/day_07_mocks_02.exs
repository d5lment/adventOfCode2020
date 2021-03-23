defmodule Day07Mocks02 do

  def nodos do
    [
      "light bronze": %Day07.Node{
        bags: ["1 shiny gold bag", " 1 striped bronze bag."],
        childs: [],
        node: "light bronze",
        parent: "shiny gold"
      },
      "wavy black": %Day07.Node{
        bags: ["2 shiny gold bags."],
        childs: [],
        node: "wavy black",
        parent: "shiny gold"
      },
      "dark chartreuse": %Day07.Node{
        bags: ["1 dark maroon bag", " 5 shiny gold bags."],
        childs: [],
        node: "dark chartreuse",
        parent: "shiny gold"
      },
      "pale crimson": %Day07.Node{
        bags: ["5 shiny gold bags", " 2 striped chartreuse bags",
         " 5 bright brown bags."],
        childs: [],
        node: "pale crimson",
        parent: "shiny gold"
      },
      "dim coral": %Day07.Node{
        bags: ["1 shiny gold bag."],
        childs: [],
        node: "dim coral",
        parent: "shiny gold"
      },
      "dull maroon": %Day07.Node{
        bags: ["3 posh green bags", " 1 shiny gold bag", " 5 light salmon bags",
         " 1 posh teal bag."],
        childs: [],
        node: "dull maroon",
        parent: "shiny gold"
      }
    ]
  end

  def light_bronze do
    []
  end

  def wavy_black do
    []
  end

  def dark_chartreuse do
    [
      "drab gold": %Day07.Node{
        bags: ["4 dark chartreuse bags", " 2 clear orange bags",
         " 5 vibrant magenta bags", " 1 wavy gray bag."],
        childs: [],
        node: "drab gold",
        parent: "dark chartreuse"
      },
      "vibrant purple": %Day07.Node{
        bags: ["2 posh gray bags", " 3 dark chartreuse bags", " 3 wavy bronze bags",
         " 5 faded purple bags."],
        childs: [],
        node: "vibrant purple",
        parent: "dark chartreuse"
      },
      "plaid brown": %Day07.Node{
        bags: ["3 dim fuchsia bags", " 3 dark chartreuse bags",
         " 4 bright magenta bags."],
        childs: [],
        node: "plaid brown",
        parent: "dark chartreuse"
      },
      "clear maroon": %Day07.Node{
        bags: ["1 faded yellow bag", " 4 dark chartreuse bags",
         " 4 bright magenta bags."],
        childs: [],
        node: "clear maroon",
        parent: "dark chartreuse"
      },
      "plaid gray": %Day07.Node{
        bags: ["5 pale chartreuse bags", " 1 dull plum bag",
         " 1 dark chartreuse bag", " 4 clear lime bags."],
        childs: [],
        node: "plaid gray",
        parent: "dark chartreuse"
      },
      "muted black": %Day07.Node{
        bags: ["2 dark chartreuse bags."],
        childs: [],
        node: "muted black",
        parent: "dark chartreuse"
      },
      "shiny lavender": %Day07.Node{
        bags: ["4 bright yellow bags", " 4 muted salmon bags",
         " 1 dull chartreuse bag", " 2 dark chartreuse bags."],
        childs: [],
        node: "shiny lavender",
        parent: "dark chartreuse"
      }
    ]
  end

  def pale_crimson do
    [
      "plaid gold": %Day07.Node{
        bags: ["5 pale crimson bags", " 4 clear tan bags", " 3 wavy turquoise bags",
         " 2 dim chartreuse bags."],
        childs: [],
        node: "plaid gold",
        parent: "pale crimson"
      },
      "dim white": %Day07.Node{
        bags: ["2 pale crimson bags", " 4 clear brown bags",
         " 2 mirrored coral bags."],
        childs: [],
        node: "dim white",
        parent: "pale crimson"
      },
      "plaid violet": %Day07.Node{
        bags: ["2 pale crimson bags", " 1 mirrored crimson bag."],
        childs: [],
        node: "plaid violet",
        parent: "pale crimson"
      }
    ]
  end

  def dim_coral do
    [
      "drab orange": %Day07.Node{
        bags: ["2 shiny teal bags", " 2 light olive bags", " 2 dim coral bags."],
        childs: [],
        node: "drab orange",
        parent: "dim coral"
      },
      "light yellow": %Day07.Node{
        bags: ["1 dim beige bag", " 1 wavy cyan bag", " 1 dim coral bag."],
        childs: [],
        node: "light yellow",
        parent: "dim coral"
      },
      "wavy brown": %Day07.Node{
        bags: ["1 dim coral bag", " 3 muted beige bags", " 1 shiny orange bag",
         " 1 dim brown bag."],
        childs: [],
        node: "wavy brown",
        parent: "dim coral"
      },
      "shiny orange": %Day07.Node{
        bags: ["2 drab yellow bags", " 5 dim coral bags", " 3 wavy blue bags."],
        childs: [],
        node: "shiny orange",
        parent: "dim coral"
      },
      "shiny chartreuse": %Day07.Node{
        bags: ["2 faded yellow bags", " 2 shiny green bags",
         " 2 mirrored cyan bags", " 5 dim coral bags."],
        childs: [],
        node: "shiny chartreuse",
        parent: "dim coral"
      },
      "muted silver": %Day07.Node{
        bags: ["2 dim coral bags."],
        childs: [],
        node: "muted silver",
        parent: "dim coral"
      }
    ]
  end

  def dull_maroon do
    []
  end

  def full_tree do
    [
      "dull maroon": %Day07.Node{
        bags: ["3 posh green bags", " 1 shiny gold bag", " 5 light salmon bags",
         " 1 posh teal bag."],
        childs: [],
        node: "dull maroon",
        parent: "shiny gold"
      },
      "dim coral": %Day07.Node{
        bags: ["1 shiny gold bag."],
        childs: [
          "drab orange": %Day07.Node{
            bags: ["2 shiny teal bags", " 2 light olive bags", " 2 dim coral bags."],
            childs: [],
            node: "drab orange",
            parent: "dim coral"
          },
          "light yellow": %Day07.Node{
            bags: ["1 dim beige bag", " 1 wavy cyan bag", " 1 dim coral bag."],
            childs: [],
            node: "light yellow",
            parent: "dim coral"
          },
          "wavy brown": %Day07.Node{
            bags: ["1 dim coral bag", " 3 muted beige bags", " 1 shiny orange bag",
             " 1 dim brown bag."],
            childs: [],
            node: "wavy brown",
            parent: "dim coral"
          },
          "shiny orange": %Day07.Node{
            bags: ["2 drab yellow bags", " 5 dim coral bags", " 3 wavy blue bags."],
            childs: [],
            node: "shiny orange",
            parent: "dim coral"
          },
          "shiny chartreuse": %Day07.Node{
            bags: ["2 faded yellow bags", " 2 shiny green bags",
             " 2 mirrored cyan bags", " 5 dim coral bags."],
            childs: [],
            node: "shiny chartreuse",
            parent: "dim coral"
          },
          "muted silver": %Day07.Node{
            bags: ["2 dim coral bags."],
            childs: [],
            node: "muted silver",
            parent: "dim coral"
          }
        ],
        node: "dim coral",
        parent: "shiny gold"
      },
      "pale crimson": %Day07.Node{
        bags: ["5 shiny gold bags", " 2 striped chartreuse bags",
         " 5 bright brown bags."],
        childs: [
          "plaid gold": %Day07.Node{
            bags: ["5 pale crimson bags", " 4 clear tan bags",
             " 3 wavy turquoise bags", " 2 dim chartreuse bags."],
            childs: [],
            node: "plaid gold",
            parent: "pale crimson"
          },
          "dim white": %Day07.Node{
            bags: ["2 pale crimson bags", " 4 clear brown bags",
             " 2 mirrored coral bags."],
            childs: [],
            node: "dim white",
            parent: "pale crimson"
          },
          "plaid violet": %Day07.Node{
            bags: ["2 pale crimson bags", " 1 mirrored crimson bag."],
            childs: [],
            node: "plaid violet",
            parent: "pale crimson"
          }
        ],
        node: "pale crimson",
        parent: "shiny gold"
      },
      "dark chartreuse": %Day07.Node{
        bags: ["1 dark maroon bag", " 5 shiny gold bags."],
        childs: [
          "drab gold": %Day07.Node{
            bags: ["4 dark chartreuse bags", " 2 clear orange bags",
             " 5 vibrant magenta bags", " 1 wavy gray bag."],
            childs: [],
            node: "drab gold",
            parent: "dark chartreuse"
          },
          "vibrant purple": %Day07.Node{
            bags: ["2 posh gray bags", " 3 dark chartreuse bags",
             " 3 wavy bronze bags", " 5 faded purple bags."],
            childs: [],
            node: "vibrant purple",
            parent: "dark chartreuse"
          },
          "plaid brown": %Day07.Node{
            bags: ["3 dim fuchsia bags", " 3 dark chartreuse bags",
             " 4 bright magenta bags."],
            childs: [],
            node: "plaid brown",
            parent: "dark chartreuse"
          },
          "clear maroon": %Day07.Node{
            bags: ["1 faded yellow bag", " 4 dark chartreuse bags",
             " 4 bright magenta bags."],
            childs: [],
            node: "clear maroon",
            parent: "dark chartreuse"
          },
          "plaid gray": %Day07.Node{
            bags: ["5 pale chartreuse bags", " 1 dull plum bag",
             " 1 dark chartreuse bag", " 4 clear lime bags."],
            childs: [],
            node: "plaid gray",
            parent: "dark chartreuse"
          },
          "muted black": %Day07.Node{
            bags: ["2 dark chartreuse bags."],
            childs: [],
            node: "muted black",
            parent: "dark chartreuse"
          },
          "shiny lavender": %Day07.Node{
            bags: ["4 bright yellow bags", " 4 muted salmon bags",
             " 1 dull chartreuse bag", " 2 dark chartreuse bags."],
            childs: [],
            node: "shiny lavender",
            parent: "dark chartreuse"
          }
        ],
        node: "dark chartreuse",
        parent: "shiny gold"
      },
      "wavy black": %Day07.Node{
        bags: ["2 shiny gold bags."],
        childs: [],
        node: "wavy black",
        parent: "shiny gold"
      },
      "light bronze": %Day07.Node{
        bags: ["1 shiny gold bag", " 1 striped bronze bag."],
        childs: [],
        node: "light bronze",
        parent: "shiny gold"
      }
    ]
  end
end
