import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'InputField.dart';
import 'RoundedButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginScreen> with TickerProviderStateMixin {
  TapGestureRecognizer _longPressRecognizer;
  AnimationController controller;
  Tween animation;
  Animation<double> width;
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    _longPressRecognizer = new TapGestureRecognizer()..onTap = _handlePress;
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    width = Tween(begin: 350.0, end: 60.0).animate(new CurvedAnimation(
        parent: controller, curve: new Interval(0.0, 0.250)));
    controller.addListener(() => _handleAnimation());
  }

  void _handlePress() {
    print('click');
  }

  void _handleAnimation() {
    setState(() {
      value = width.value;
    });
  }

  BoxDecoration buildOverlayDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color.fromRGBO(162, 146, 199, 0.8),
          Color.fromRGBO(51, 51, 63, 0.9),
        ],
        stops: [0.2, 1.0],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => new Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'http://www.wallpapers13.com/wp-content/uploads/2016/01/Wallpaper-sea-wave-surf-clouds-coast_3840x2160-1366x768.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          padding: EdgeInsets.only(bottom: 40.0),
          decoration: buildOverlayDecoration(),
          child: Column(
            children: <Widget>[
              Image(
                  width: 300.0,
                  image: NetworkImage(
                      'https://github.com/GeekyAnts/flutter-login-home-animation/blob/master/dribbbledanimation/assets/tick.png?raw=true')),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InputField(icon: Icons.account_circle, hint: 'Email'),
                  InputField(icon: Icons.lock, hint: 'Email'),
                  RoundedButton(
                    () => animateButtonWidth(),
                    text: 'Sign In',
                    paddingTop: 60.0,
                    paddingBottom: 40.0,
                    textOpacity: 1 - controller.value,
                    isLoading: controller.isCompleted,
                    width: controller.isAnimating || controller.isCompleted
                        ? value
                        : 350.0,
                  ),
                  Text.rich(
                      TextSpan(
                          text: 'Dont have an account?',
                          children: <TextSpan>[
                            TextSpan(
                                style: TextStyle(color: Colors.white),
                                text: 'Sign Up',
                                recognizer: _longPressRecognizer)
                          ]),
                      style: TextStyle(color: Colors.grey, fontSize: 12.0))
                ],
              ))
            ],
          )));

  Future<Null> animateButtonWidth() async {
    await controller.forward();
  }
}
