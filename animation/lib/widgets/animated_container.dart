import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({
    Key key,
  }) : super(key: key);
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100.0;
  double _width = 100.0;
  _increaseWidth() {
    setState(() {
      _width = _width >= 300 ? 100.0 : _width += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.elasticInOut,
          color: Colors.amber,
          height: _height,
          width: _width,
          child: FlatButton(
            child: Text('Tap to grow width\n $_width'),
            onPressed: _increaseWidth(),
          ),
        )
      ],
    );
  }
}
