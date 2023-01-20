import 'package:flame/game.dart';
import 'package:santagame/components/background_component.dart';
import 'package:santagame/components/santa_component.dart';
import 'package:santagame/inputs/joystick.dart';

class GiftGrabGame extends FlameGame with HasDraggables {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    add(joystick);
  }
}
