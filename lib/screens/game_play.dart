import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import '../games/gif_grab_game.dart';
import 'game_over_menu.dart';

GiftGrabGame _giftGrabGame = GiftGrabGame();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _giftGrabGame,
      overlayBuilderMap: {
        GameOverMenu.ID: (BuildContext context, GiftGrabGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
      },
    );
  }
}
