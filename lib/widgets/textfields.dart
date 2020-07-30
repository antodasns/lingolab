import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData icon;

  const CustomTextField ({ Key key, this.hint,this.icon }): super(key: key);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width*.92,
      decoration: BoxDecoration(
        color: Color(0xFFFf7f7f7),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 7),
            blurRadius: 12,
            spreadRadius: 0,
            color: Colors.grey,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon,color: Colors.deepOrangeAccent,),
            border: InputBorder.none,
            hintText: widget.hint),

      ),
    );
  }
}

