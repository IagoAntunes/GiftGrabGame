import 'package:flame/game.dart';
import 'package:santagame/components/background_component.dart';
import 'package:santagame/components/santa_component.dart';

class GiftGrabGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(backgroundComponent());
    add(SantaComponent());
  }
}
