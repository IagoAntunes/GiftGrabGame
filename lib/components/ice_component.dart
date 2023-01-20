import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import '../constants/globals.dart';
import '../games/gif_grab_game.dart';

class IceComponent extends SpriteComponent
    with HasGameRef<GiftGrabGame>, CollisionCallbacks {
  final double _spriteHeight = 200;
  final Vector2 startPosition;
  late Vector2 _velocity;
  double speed = 300;

  double degree = pi / 100;

  IceComponent({required this.startPosition});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.iceSprite);
    position = startPosition;
    width = height = _spriteHeight;
    anchor = Anchor.center;

    double spawnAngle = _getSpawnAngle();

    final double vx = cos(spawnAngle * degree) * speed;
    final double vy = cos(spawnAngle * degree) * speed;

    _velocity = Vector2(vx, vy);

    add(CircleHitbox());
  }

  @override
  void update(dt) {
    super.update(dt);

    position += _velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is ScreenHitbox) {
      final Vector2 collisionPoint = intersectionPoints.first;

      if (collisionPoint.x == 0) {
        _velocity.x = -_velocity.x;
        _velocity.y = _velocity.y;
      } else if (collisionPoint.x == gameRef.size.x) {
        _velocity.x = -_velocity.x;
        _velocity.y = _velocity.y;
      } else if (collisionPoint.y == gameRef.size.y) {
        _velocity.x = _velocity.x;
        _velocity.y = -_velocity.y;
      } else if (collisionPoint.y == 0) {
        _velocity.x = _velocity.x;
        _velocity.y = -_velocity.y;
      }
    }
  }

  double _getSpawnAngle() {
    final random = Random().nextDouble();
    final spawnAngle = lerpDouble(0, 360, random)!;

    return spawnAngle;
  }
}
