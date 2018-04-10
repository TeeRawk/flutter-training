import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;

  final IconData icon;

  InputField({this.hint, this.icon});

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white24,
          ),
        ),
      ),
      child: TextFormField(
          obscureText: false,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
            contentPadding: EdgeInsets.only(
                top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
          )));
}
