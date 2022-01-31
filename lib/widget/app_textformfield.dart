import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final void Function(String val) validator;
  final void Function(String val) onChanged;
  final int maxLength;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final Color fillColor;
  final Icon suffixIcon;
  final bool enabled;
  final String initialValue;
  final Widget suffix;
  final TextCapitalization textCapitalization;

  const AppTextFormField({
    Key key,
    this.placeholder,
    this.controller,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
    this.obscureText = false,
    this.inputFormatters,
    this.maxLines = 1,
    this.suffix,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      focusNode: focusNode,
      //autocorrect: false,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      cursorColor: Colors.black,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12, fontFamily: 'Avenir', letterSpacing: .65),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          alignLabelWithHint: true,
          fillColor: fillColor,
          filled: fillColor != null,
          suffix: suffix,
          errorStyle: TextStyle(fontFamily: 'Avenir', fontWeight: FontWeight.bold, fontSize: 12),
          labelText: '$placeholder',
          labelStyle: TextStyle(fontWeight: FontWeight.w900, color: Colors.black38),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue[900], width: 1)),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange, width: 2)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(.5), width: 2)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
          counterText: ''),
    );
  }
}
