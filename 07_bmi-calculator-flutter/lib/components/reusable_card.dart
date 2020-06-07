import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function onPress;
  ReusableCard({@required this.color, this.cardChild, this.onPress});
  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
