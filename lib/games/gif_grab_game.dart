import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:santagame/components/background_component.dart';
import 'package:santagame/components/gitft_component.dart';
import 'package:santagame/components/ice_component.dart';
import 'package:santagame/components/santa_component.dart';
import 'package:santagame/inputs/joystick.dart';

import '../constants/globals.dart';

class GiftGrabGame extends FlameGame with HasDraggables, HasCollisionDetection {
  int score = 0;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    add(GiftComponent());
    add(joystick);

    FlameAudio.audioCache.loadAll(
      [
        Globals.itemGrabSound,
      ],
    );

    add(IceComponent(startPosition: Vector2(200, 200)));
    add(IceComponent(startPosition: Vector2(size.x - 200, size.y - 200)));

    add(ScreenHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
