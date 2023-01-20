import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:santagame/games/gif_grab_game.dart';

import '../constants/globals.dart';

enum MovimentState {
  idle,
  slideLeft,
  slideRight,
}

//SpriteComponent pode ser um personagem,background etc
//HasGameRef usa as propriedades do game
class SantaComponent extends SpriteGroupComponent
    with HasGameRef<GiftGrabGame> {
  final double _spriteHeight = 200;
  final double speed = 500;
  late double _rightBound;
  late double _leftBound;

  late double _upBound;
  late double _downBound;
  JoystickComponent joystick;
  SantaComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    Sprite santaIdle = await gameRef.loadSprite(Globals.santaIdleSprite);
    Sprite santaLeftSlide = await gameRef.loadSprite(Globals.santaLeftSprite);
    Sprite santaRightSlide = await gameRef.loadSprite(Globals.santaRightSprite);

    sprites = {
      MovimentState.idle: santaIdle,
      MovimentState.slideLeft: santaLeftSlide,
      MovimentState.slideRight: santaRightSlide,
    };

    _rightBound = gameRef.size.x - 40;
    _leftBound = 45;
    _upBound = 55;
    _downBound = gameRef.size.y - 85;

    //Verifica o estado atual(GROUP COMPONENT)
    current = MovimentState.idle;
    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.42;
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (joystick.direction == JoystickDirection.idle) {
      current = MovimentState.idle;
      return;
    } else if (x >= _rightBound) {
      x = _rightBound - 1;
    } else if (x <= _leftBound) {
      x = _leftBound + 1;
    } else if (y >= _downBound) {
      y = _downBound - 1;
    } else if (y <= _upBound) {
      y = _upBound + 1;
    }

    bool movingLeft = joystick.relativeDelta[0] < 0;

    if (movingLeft) {
      current = MovimentState.slideLeft;
    } else {
      current = MovimentState.slideRight;
    }

    position.add(joystick.relativeDelta * speed * dt);
  }
}
