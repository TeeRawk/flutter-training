import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;

  final Function onPress;
  final double paddingTop;
  final double paddingBottom;
  final double width;
  final bool isLoading;
  final double textOpacity;

  RoundedButton(this.onPress,
      {this.text: 'Test',
      this.paddingTop: 0.0,
      this.paddingBottom: 0.0,
      this.width: 350.0,
      this.isLoading,
      this.textOpacity: 1.0});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            top: paddingTop, bottom: paddingBottom, left: 20.0, right: 20.0),
        child: RawMaterialButton(
          constraints: BoxConstraints.expand(height: 60.0, width: width),
          onPressed: onPress,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(40.0), right: Radius.circular(40.0))),
          fillColor: Colors.pink,
          child: !isLoading
              ? Opacity(
                  opacity: textOpacity,
                  child: Text('Sign In', style: TextStyle(color: Colors.white)))
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 1.0,
                ),
        ),
      );
}
