import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoCalcularWidget extends StatefulWidget {

  final String labelText;
  VoidCallback onPressed;

  BotaoCalcularWidget({this.labelText, this.onPressed});

  @override
  _BotaoCalcularWidget createState() => _BotaoCalcularWidget();
}

class _BotaoCalcularWidget extends State<BotaoCalcularWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
            padding: EdgeInsets.only( bottom: 0, top: 0, left: 14, right: 14),
            margin: EdgeInsets.only( bottom: 14, top: 0, left: 0, right: 0),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: TextButton(
            child: Text(widget.labelText, style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }

}