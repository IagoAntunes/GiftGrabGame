import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:santagame/components/background_component.dart';
import 'package:santagame/components/santa_component.dart';
import 'package:santagame/inputs/joystick.dart';

class GiftGrabGame extends FlameGame with HasDraggables {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(backgroundComponent());
    add(SantaComponent());
    add(joystick);
  }
}
