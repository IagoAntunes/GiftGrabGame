import 'package:flame/components.dart';
import 'package:santagame/games/gif_grab_game.dart';

import '../constants/globals.dart';

//SpriteComponent pode ser um personagem,background etc
//HasGameRef usa as propriedades do game
class GiftComponent extends SpriteComponent with HasGameRef<GiftGrabGame> {
  final double _spriteHeight = 200;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.giftSprite);
    size = gameRef.size;
    height = width = _spriteHeight;
    position = gameRef.size / 2;
    anchor = Anchor.center;
  }
}
