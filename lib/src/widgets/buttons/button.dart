import 'package:prozone/src/init.dart';
import 'package:prozone/src/services/utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double elevation;
  final VoidCallback onPressed;

  const AppButton({
    Key key,
    @required this.title,
    this.onPressed,
    this.elevation = 5,
  }) : super(key: key);

  bool get normal => elevation == null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        elevation: elevation,
        shape: Utils.shapeBorder(),
        padding: EdgeInsets.symmetric(vertical: 16),
        color: deep_orange_color,
        textColor: white_color,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: normal ? 14 : 17),
        ),
      ),
    );
  }
}
