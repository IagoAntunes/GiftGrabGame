import 'package:flutter/material.dart';

import '../constants/globals.dart';
import '../games/gif_grab_game.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final GiftGrabGame gameRef;
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${Globals.backgroundSprite}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Game Over',
                  style: TextStyle(
                    fontSize: Globals.isTablet ? 100 : 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Score: ${gameRef.score}',
                  style: TextStyle(
                    fontSize: Globals.isTablet ? 100 : 50,
                  ),
                ),
              ),
              SizedBox(
                width: Globals.isTablet ? 400 : 200,
                height: Globals.isTablet ? 100 : 50,
                child: ElevatedButton(
                  onPressed: () {
                    gameRef.overlays.remove(GameOverMenu.ID);
                    gameRef.reset();
                    gameRef.resumeEngine();
                  },
                  child: Text(
                    'Play Again?',
                    style: TextStyle(
                      fontSize: Globals.isTablet ? 50 : 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
