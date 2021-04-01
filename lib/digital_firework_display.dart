import 'package:flutter/material.dart';
import 'package:flutter_fireworks/fireworks_assets.dart';
import 'package:flutter_fireworks/fireworks_node.dart';
import 'package:spritewidget/spritewidget.dart';

// The coordinate system we are using for the clock, 5/3 proportions.
const _displaySize = Size(1000.0, 500.0);

/// Animates and renders the clock.
class DigitalFireworkDisplay extends StatefulWidget {
  final FireworkAssets assets;

  DigitalFireworkDisplay({this.assets});

  @override
  State<StatefulWidget> createState() => _CharacterDiplayState();
}

class _CharacterDiplayState extends State<DigitalFireworkDisplay> {
  _DigitalDisplayNode _displayNode;

  @override
  void initState() {
    super.initState();
    // Setup the root SpriteWorld node, that we are using to animate the clock.
    _displayNode = _DigitalDisplayNode(assets: widget.assets);
  }

  @override
  void didUpdateWidget(DigitalFireworkDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(_displayNode);
  }
}

class _DigitalDisplayNode extends NodeWithSize {
  final FireworkAssets assets;

  _DigitalDisplayNode({this.assets}) : super(_displaySize) {
    var fireworks = FireworksNode(assets: assets, size: _displaySize, );
    fireworks.zPosition = 1.0;
    addChild(fireworks);
  }
}
