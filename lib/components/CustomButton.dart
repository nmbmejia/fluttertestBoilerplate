import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
    final String hinttext;
    final VoidCallback onPressFunctionality;
    CustomButton({Key key, @required this.hinttext, @optionalTypeArgs this.onPressFunctionality}) : super(key: key);
    _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(widget.hinttext),
      onPressed: widget.onPressFunctionality,
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          minimumSize: Size( MediaQuery.of(context).size.width, 20),
          primary: Color(0xFFE53854),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    );
  }
}