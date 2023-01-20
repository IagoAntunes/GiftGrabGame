import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santagame/games/gif_grab_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GameWidget(
      game: GiftGrabGame(),
    ),
  );
}
