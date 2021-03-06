import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textFieldHeight=1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int textFieldHeight;

  @override
  State<StatefulWidget> createState() {
    return CustomTextFieldState();
  }
}

class CustomTextFieldState extends State<CustomTextField> {
  double _width = 0.0;
  Color _color = Colors.white;

  void _setFocusedBorder(PointerEvent details) {
    setState(() {
      _width = 2.0;
      _color = Colors.grey;
    });
  }

  void _removeFocusedBorder(PointerEvent details) {
    setState(() {
      _width = 0.0;
      _color = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: MouseRegion(
        onHover: _setFocusedBorder,
        onEnter: _setFocusedBorder,
        onExit: _removeFocusedBorder,
        child: TextFormField(
          controller: widget.controller,
          maxLines: widget.textFieldHeight,
          minLines: widget.textFieldHeight,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _color, width: _width
                  )
              )
          ),
        ),
      ),
    );
  }
}