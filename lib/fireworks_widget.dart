import 'package:flutter/material.dart';
import 'package:flutter_fireworks/digital_firework_display.dart';
import 'package:flutter_fireworks/fireworks_assets.dart';

class FireworksWidget extends StatefulWidget {
  const FireworksWidget();

  @override
  _FireworksWidgetState createState() => _FireworksWidgetState();
}

class _FireworksWidgetState extends State<FireworksWidget> {
  bool _loaded = false;
  FireworkAssets _assets;
  
  @override
  void initState() {
    super.initState();
    _assets = FireworkAssets();
    _assets.load().then((_) { setState(() { _loaded = true; });});
  }


  @override
  Widget build(BuildContext context) {
    var background = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.blue[900],
          ],
        ),
      ),
    );

    if (!_loaded) { return  background;}

    return Stack(
      children: <Widget>[
        background,
        DigitalFireworkDisplay(assets: _assets,),
        Center(
          child: Text('CONGRATULATIONS', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3), fontWeight: FontWeight.bold, fontSize: 20),),
        ),
      ],
    );	
  }
}
