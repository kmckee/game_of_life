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

  Scenario: Any dead cell with eXactly three live neighbours becomes a live cell.
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

  Scenario: Any live cell with two or three live neighbours lives on to the neXt generation.
    Given the following game board:
      | . | X | . |
      | X | X | . |
      | . | . | . |
    When a generation passes
    Then the center cell should be alive

  Scenario: Block
    Given the following game board:
      | . | . | . | . | . |
      | . | X | X | . | . |
      | . | X | X | . | . |
      | . | . | . | . | . |
      | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . |
      | . | X | X | . | . |
      | . | X | X | . | . |
      | . | . | . | . | . |
      | . | . | . | . | . |

  Scenario: Beehive
    Given the following game board:
      | . | . | . | . | . | . |
      | . | . | X | X | . | . |
      | . | X | . | . | X | . |
      | . | . | X | X | . | . |
      | . | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . | . |
      | . | . | X | X | . | . |
      | . | X | . | . | X | . |
      | . | . | X | X | . | . |
      | . | . | . | . | . | . |

  Scenario: Loaf
    Given the following game board:
      | . | . | . | . | . | . |
      | . | . | X | X | . | . |
      | . | X | . | . | X | . |
      | . | . | X | . | X | . |
      | . | . | . | X | . | . |
      | . | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . | . |
      | . | . | X | X | . | . |
      | . | X | . | . | X | . |
      | . | . | X | . | X | . |
      | . | . | . | X | . | . |
      | . | . | . | . | . | . |

  Scenario: Boat
    Given the following game board:
      | . | . | . | . | . |
      | . | X | X | . | . |
      | . | X | . | X | . |
      | . | . | X | . | . |
      | . | . | . | . | . |
    When a generation passes
    Then the board should look like:
      | . | . | . | . | . |
      | . | X | X | . | . |
      | . | X | . | X | . |
      | . | . | X | . | . |
      | . | . | . | . | . |
