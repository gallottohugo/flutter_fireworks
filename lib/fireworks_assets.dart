import 'package:flutter/services.dart';
import 'package:flutter_fireworks/character_points_builder.dart';
import 'package:spritewidget/spritewidget.dart';
const _pathFireworkParticle = 'assets/firework-particle.png';

class FireworkAssets {
  CharacterPointsBuilder get characterPathBuilder => _characterPathBuilder;
  CharacterPointsBuilder _characterPathBuilder;

  SpriteTexture get textureNumberOutline => _textureNumberOutline;
  SpriteTexture _textureNumberOutline;

  SpriteTexture get textureFirework => _textureFirework;
  SpriteTexture _textureFirework;

  ImageMap _images;

  Future<void> load() async {
    _images = ImageMap(rootBundle);
    await _images.load([
      _pathFireworkParticle,
    ]);
    _textureFirework = SpriteTexture(_images[_pathFireworkParticle]);
  }
}
