import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/colorz.dart';
import '../../config/dimens.dart';
import '../../config/thems.dart';



class CustomFormFieldText extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? enabled;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final int maxLength;
  final String? errorText;
  final bool? error;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCounter;
  final String? hintText;
  final String? labelText;
  final bool obscureText;


  const CustomFormFieldText({
    super.key,
    this.controller,
    required this.textInputType,
    this.maxLength = 1,
    this.errorText,
    this.error,
    this.onChanged,
    this.inputFormatters,
    this.showCounter = false,
    this.obscureText = false,
    this.hintText,
    this.width,
    this.height,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.labelText,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    double errorFontSize = FontSize.small;
    double? errorHeight;
    if (errorText != null) {
      if (errorText!.isEmpty) {
        errorFontSize = FontSize.zero;
        errorHeight = 0.0;
      } else {
        errorHeight = null;
      }
    }

    var errorStyle = TextStyle(
      color: Colorz.textError,
      fontSize: errorFontSize,
      height: errorHeight,
    );
    return SizedBox(
        width: width,
        height: 50,
        child: TextField(
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          keyboardType: textInputType,
          autofocus: false,
          textAlign: textAlign ,
          textAlignVertical: TextAlignVertical.top,
          controller: controller,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          style: CustomTheme.textStyleTextBig,
          focusNode: focusNode,
          onChanged: (String newVal) => {
            if (onChanged != null) {{onChanged!(newVal.toUpperCase())}}
          },
          decoration: InputDecoration(
            filled: true,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            counterText: "",
            errorStyle: errorStyle,
            label: labelText == null
                ? null
                : Text(
              labelText!,
            ),
            hintText: hintText,
            alignLabelWithHint: true,
            // contentPadding: EdgeInsets.all(textVerticalAlignment),
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: FontSize.small,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: FontSize.little,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(BorderRadiuses.medium),
              borderSide: BorderSide.none,
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(BorderRadiuses.medium),
              borderSide: BorderSide.none,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(BorderRadiuses.medium),
              borderSide: BorderSide.none,
            ),
          ),
        ));
  }
}
