import 'package:flutter/cupertino.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String text;

  BottomButton({this.onPress, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
            child: Text(
          this.text,
          style: kBottomLargeTextStyle,
        )),
      ),
    );
  }
}
