#Battleships

###The Rules of the game

``````
The game is made up of two players. Players each have 5 ships of different lengths. Players organise their ships on their home grid, which is 10x10 (100 cells). The ships can be next to each other but two ships cannot share one cell. Also, ships can only be placed horizontally or vertically but cannot be placed diagonally. Players also have an away grid where they will record their attacks.

Each player takes a turn to attack his opponents ships on the grid. You may not attack a cell that you have previously attacked. If the coordinates are the same as where an opponent's ship is placed they get a response of "hit" otherwise they will get a response of "miss". Each response is recorded on the player's away grid.

Once a ship has been hit across it's entire length, it is then classified as sunk. Once a player has sunk all of his opponents ships the game is over and that player wins.
``````

### CRC
####Grid
| Responsibility     | Collaborators 					 |
| ------------------ | --------------------------------- |
| Contains 100 | Cells |
| Contains a | Ship |
| Should know how many are left | Ships |


####Cell
| Responsibility     | Collaborators 					 |
| ------------------ | --------------------------------- |
| Should know it holds a | ship |
| Receive hit from | player |
| Record hit/miss from | player |
| Know it's position on | grid |


####Players
| Responsibility     | Collaborators 					 |
| ------------------ | --------------------------------- |
| Place (on grid) | Ships / Grid |
| Has | Ships |
| Attacks | Ships |
| Looks into opponents board to see where he shot | grid
| Looks into his board to see which ships are left| Ships/grid


####Ships
| Responsibility     | Collaborators 					 |
| ------------------ | --------------------------------- |
| Can be placed on | grid |
| Receives hits from | cell |
| Knows its location on | grid |


####Game
| Responsibility     | Collaborators 					 |
| ------------------ | --------------------------------- |
| Can initialize a game with 2  | players |
| Can initialize a board with | grids |
| Can initialize | ships|
