import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Color color;
  Function onPress;
  String label;
  RoundedButton({this.color, this.onPress, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            this.label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
