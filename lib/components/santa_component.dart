import 'package:flame/components.dart';
import 'package:santagame/games/gif_grab_game.dart';

import '../constants/globals.dart';

//SpriteComponent pode ser um personagem,background etc
//HasGameRef usa as propriedades do game
class SantaComponent extends SpriteComponent with HasGameRef<GiftGrabGame> {
  final double _spriteHeight = 200;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.santaIdleSprite);
    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.42;
    anchor = Anchor.center;
  }
}
