import 'package:flame/components.dart';
import 'package:santagame/games/gif_grab_game.dart';

import '../constants/globals.dart';

//SpriteComponent pode ser um personagem,background etc
//HasGameRef usa as propriedades do game
class BackgroundComponent extends SpriteComponent
    with HasGameRef<GiftGrabGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.backgroundSpriote);
    size = gameRef.size;
  }
}
