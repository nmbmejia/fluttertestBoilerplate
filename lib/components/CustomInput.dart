import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
    final String hinttext;
    final Icon iconlink;
    final TextInputType keyboardType;
    final bool obscureText;
    final TextEditingController controller;
    CustomInput({Key key, @required this.controller, @required this.hinttext, @optionalTypeArgs this.iconlink, @required this.keyboardType, @optionalTypeArgs this.obscureText=false}) : super(key: key);
    _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType??widget.keyboardType,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Color(0xFFA0273B)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Color(0xFFA0273B)),
        ),
        hintStyle: TextStyle(color: Colors.white70),
        hintText: widget.hinttext,
        prefixIcon: widget.iconlink??widget.iconlink,
      ),
    );
  }
}