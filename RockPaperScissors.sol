pragma solidity ^0.4.23;

contract RockPaperScissors {

    address player1;
    address player2;

    enum GameMove {ROCK, PAPER, SCISSORS}

    mapping (address => uint) stakes;
    mapping (address => GameMove) gameMove;

    // struct gameState {
    //     GameMove player1move;
    //     GameMove player2move;
    // }

    constructor(address _player1, address _player2) public {
        player1 = _player1;
        player2 = _player2;
    }

    event LogResult(string);

    function enrol() public payable {
        require (msg.sender == player1 || msg.sender == player2);
        stakes[msg.sender] == msg.value;
    }

    function playerMove(GameMove _move) public {
        require (msg.sender == player1 || msg.sender == player2);

        gameMove[msg.sender] == _move;

    }

    function checkWinner() public {

        GameMove player1move;
        GameMove player2move;

        player1move = gameMove[player1];
        player2move = gameMove[player2];

        string memory result;

        if (player1move == player2move) {
            result = "DRAW";
        } else if
            (player1move == GameMove.ROCK) {
                if (player2move == GameMove.SCISSORS) {
                    result = "PLAYER 1 WINS";
                } else {
                    result = "PLAYER 2 WINS";
                }
            } else if
                (player1move == GameMove.SCISSORS) {
                    if (player2move == GameMove.PAPER) {
                        result = "PLAYER 1 WINS";
                    } else {
                        result = "PLAYER 2 WINS";
                    }
                } else if
                    (player1move == GameMove.PAPER) {
                        if (player2move == GameMove.ROCK) {
                            result = "PLAYER 1 WINS";
                        } else {
                            result = "PLAYER 2 WINS";
                        }
                    }

            emit LogResult(result);

    }

    function getMoves() public view returns (GameMove, GameMove) {
        return (gameMove[player1], gameMove[player2]);
    }


}
