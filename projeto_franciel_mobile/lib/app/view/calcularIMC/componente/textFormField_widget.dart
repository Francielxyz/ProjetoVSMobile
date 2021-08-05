import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFieldWidget extends StatefulWidget {
  //Variavel para adicionar texto de títulos nas caixas de texto
  String labelText;
  String hintText;
  String mask;
  String initialValue;
  FormFieldSetter<String> onSaved;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;

  TextFormFieldWidget(
      {this.labelText,
      this.hintText,
      this.onSaved,
      this.initialValue,
      this.validator,
      this.mask,
      this.keyboardType});

  @override
  _TextFormFieldWidget createState() => _TextFormFieldWidget();
}

class _TextFormFieldWidget extends State<TextFormFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: widget.validator,
        onSaved: widget.onSaved,
        initialValue: widget.initialValue,
        inputFormatters: [MaskTextInputFormatter(mask: widget.mask)],
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.green),
          ),
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
