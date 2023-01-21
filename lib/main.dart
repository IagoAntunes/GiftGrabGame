import 'package:flutter/material.dart';
import 'package:santagame/screens/game_play.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePlay(),
    ),
  );
}
