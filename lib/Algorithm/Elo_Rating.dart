import 'package:elo_rating/elo_rating.dart';

class Player {
  String name;
  double rating;

  Player({required this.name, required this.rating});
}

class Matchmaker {
  List<Player> _players;
  EloRating _elo;

  Matchmaker() {
    _players = <Player>[];
    _elo = EloRating();
  }

  void addPlayer(Player player) {
    _players.add(player);
  }

  void matchmake() {
    // Find the two players with the closest ratings
    Player player1, player2;
    double closestRating = 99999;
    for (int i = 0; i < _players.length; i++) {
      for (int j = i + 1; j < _players.length; j++) {
        double ratingDiff = (_players[i].rating - _players[j].rating).abs();
        if (ratingDiff < closestRating) {
          closestRating = ratingDiff;
          player1 = _players[i];
          player2 = _players[j];
        }
      }
    }

    // Match the two players
    playMatch(player1, player2);
  }

  void playMatch(Player player1, Player player2) {
    // Get the match result (1 for player1 wins, 0 for player2 wins)
    int result = getMatchResult();
    _elo.updateRating(player1.rating, player2.rating, result);
    player1.rating = _elo.playerRating1;
    player2.rating = _elo.playerRating2;
    print("${player1.name} new rating: ${player1.rating}");
    print("${player2.name} new rating: ${player2.rating}");
  }

  int getMatchResult() {
    // get the match result from user or by random
    // in this example I will return random number
    return  new math.Random().nextInt(2);
  }
}

class EloRating {
}

void main() {
  Matchmaker matchmaker = Matchmaker();
  matchmaker.addPlayer(Player(name: "player1", rating: 1000));
  matchmaker.addPlayer(Player(name: "player2", rating: 1200));
  matchmaker.addPlayer(Player(name: "player3", rating: 1200));
  matchmaker.addPlayer(Player(name: "player4", rating: 1300));
  matchmaker.matchmake();
}
