import 'package:flutter/material.dart';
import 'package:flutter_fireworks/fireworks_assets.dart';
import 'package:spritewidget/spritewidget.dart';

const _avgTimeBetweenExplosions = 0.2;

class FireworksNode extends NodeWithSize {
  final FireworkAssets assets;

  FireworksNode({this.assets, Size size}) : super(size);
  double _countDown = 0.0;

  @override
  void update(double dt) {
    if (_countDown <= 0.0) {
      _addExplosion();
      _countDown = randomDouble() * _avgTimeBetweenExplosions * 2.0;
    }
    _countDown -= dt;
  }


  Color _randomExplosionColor() {
    double rand = randomDouble();
    if (rand < 0.25){ return Colors.deepPurple[400]; }
    else if (rand < 0.5){ return Colors.yellow[400]; }      
    else if (rand < 0.75) {return Colors.amber[400];}
    else{return Colors.red[400];}
  }

  // Adds an explosion to the fireworks
  void _addExplosion() {
    Color startColor = _randomExplosionColor();
    Color endColor = startColor.withAlpha(0);

    // Use SpriteWidget's particle system to render the fireworks' explosions.
    ParticleSystem system = new ParticleSystem(
      assets.textureFirework,
      numParticlesToEmit: 100,
      emissionRate: 1000.0,
      rotateToMovement: true,
      startRotation: 90.0,
      endRotation: 90.0,
      speed: 100.0,
      speedVar: 50.0,
      startSize: 0.3,
      startSizeVar: 0.15,
      gravity: const Offset(0.0, 30.0),
      colorSequence: new ColorSequence.fromStartAndEndColor(startColor, endColor),
    );


    system.position = new Offset(randomDouble() * size.width, randomDouble() * size.height);

    addChild(system);
  }
}
