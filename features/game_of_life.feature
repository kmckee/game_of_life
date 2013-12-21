Feature: Evolution of the game board

  Scenario: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    Given the following game board:
      | . | . | . |
      | . | X | . |
      | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . |
      | . | . | . |
      | . | . | . |

  Scenario: Any dead cell with exactly three live neighbours becomes a live cell.
    Given the following game board:
      | . | X | . |
      | X | . | X |
      | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | X | . |
      | . | X | . |
      | . | . | . |
  
  Scenario: Any live cell with more than three live neighbours dies, as if by overcrowding.
    Given the following game board:
      | X | X | X |
      | X | X | . |
      | . | . | . |
    When a generation passes
    Then the center cell should be dead 

  Scenario: Any live cell with two or three live neighbours lives on to the next generation.
    Given the following game board:
      | . | X | . |
      | X | X | . |
      | . | . | . |
    When a generation passes
    Then the center cell should be alive

  @ignore
  Scenario: Block
    Given the following game board:
      | . | . | . | . | . |
      | . | x | x | . | . |
      | . | x | x | . | . |
      | . | . | . | . | . |
      | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . |
      | . | x | x | . | . |
      | . | x | x | . | . |
      | . | . | . | . | . |
      | . | . | . | . | . |

  @ignore
  Scenario: Beehive
    Given the following game board:
      | . | . | . | . | . | . |
      | . | . | x | x | . | . |
      | . | x | . | . | x | . |
      | . | . | x | x | . | . |
      | . | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . | . |
      | . | . | x | x | . | . |
      | . | x | . | . | x | . |
      | . | . | x | x | . | . |
      | . | . | . | . | . | . |

  @ignore
  Scenario: Loaf
    Given the following game board:
      | . | . | . | . | . | . |
      | . | . | x | x | . | . |
      | . | x | . | . | x | . |
      | . | . | x | . | x | . |
      | . | . | . | x | . | . |
      | . | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . | . |
      | . | . | x | x | . | . |
      | . | x | . | . | x | . |
      | . | . | x | . | x | . |
      | . | . | . | x | . | . |
      | . | . | . | . | . | . |

  @ignore
  Scenario: Boat
    Given the following game board:
      | . | . | . | . | . |
      | . | x | x | . | . |
      | . | x | . | x | . |
      | . | . | x | . | . |
      | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . |
      | . | x | x | . | . |
      | . | x | . | x | . |
      | . | . | x | . | . |
      | . | . | . | . | . |
