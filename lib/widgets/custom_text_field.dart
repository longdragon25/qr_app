import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.hintText,
    this.textController,
    this.isPasswordField = false,
    this.isFocus = false,
    this.widthSize = 60,
    this.isTextAlignCenter = false,
    this.backgroundColor = Colors.white,
    this.paddingVertical = 8,
    this.paddingHorizontal = 10,
    this.focusNode,
    this.validator,
    this.isInputNumber = false,
    this.onFieldSubmitted,
    this.onChanged,
    this.widthOfBox = 1,
    this.hintTextSize = 16,
    this.textSize = 16,
    this.enable = true,
    this.initString,
    this.isSentences = true,
    this.prefixIcon,
    this.borderRadius = 6,
  }) : super(key: key);

  final String hintText;
  final bool isPasswordField;
  final bool isFocus;
  final double widthSize;
  final bool isTextAlignCenter;
  final Color backgroundColor;
  final double paddingVertical;
  final double paddingHorizontal;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool isInputNumber;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final double widthOfBox;
  final double hintTextSize;
  final double textSize;
  final bool enable;
  final String? initString;
  final bool? isSentences;
  final Widget? prefixIcon;
  final double borderRadius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - widget.widthSize,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
              color: const Color.fromRGBO(230, 231, 234, 1),
              width: widget.widthOfBox)),
      child: widget.isPasswordField
          ? TextFormField(
              onFieldSubmitted: (string) {
                if (widget.onFieldSubmitted != null) {
                  widget.onFieldSubmitted!(string);
                }
              },
              onChanged: (string) {
                if (widget.onChanged != null) {
                  widget.onChanged!(string);
                }
              },
              controller: widget.textController,
              validator: widget.validator,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w500, fontSize: widget.textSize),
              textAlign:
                  widget.isTextAlignCenter ? TextAlign.center : TextAlign.start,
              obscureText: _isObscure,
              decoration: InputDecoration(
                errorStyle: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.red),
                errorMaxLines: 2,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.paddingHorizontal,
                    vertical: widget.paddingVertical),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: widget.hintTextSize,
                  color: Colors.grey.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Montserrat',
                ),
                // focusedErrorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: ColorsTheme.grey2,
                //     width: 1,
                //   ),
                //   borderRadius: BorderRadius.circular(6),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: ColorsTheme.grey2,
                //     width: 1,
                //   ),
                //   borderRadius: BorderRadius.circular(6),
                // ),
                // errorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: ColorsTheme.grey5, width: 1),
                //   borderRadius: BorderRadius.circular(6),
                // ),
                border: InputBorder.none,
              ))
          : TextFormField(
              initialValue:
                  widget.initString != null ? widget.initString : null,
              onFieldSubmitted: (string) {
                if (widget.onFieldSubmitted != null) {
                  widget.onFieldSubmitted!(string);
                }
              },
              onChanged: (string) {
                if (widget.onChanged != null) {
                  widget.onChanged!(string);
                }
              },
              focusNode: widget.focusNode,
              controller: widget.textController,
              validator: widget.validator,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w500, fontSize: widget.textSize),
              textAlign:
                  widget.isTextAlignCenter ? TextAlign.center : TextAlign.start,
              autofocus: widget.isFocus,
              keyboardType: widget.isInputNumber
                  ? TextInputType.number
                  : TextInputType.text,
              textCapitalization: widget.isSentences!
                  ? TextCapitalization.sentences
                  : TextCapitalization.none,
              decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(),
                  prefixIcon: widget.prefixIcon,
                  enabled: widget.enable,
                  errorStyle: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.red),
                  errorMaxLines: 2,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.paddingHorizontal,
                      vertical: widget.paddingVertical),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: widget.hintTextSize,
                    color: Colors.grey.withOpacity(0.7),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                  ),
                  // focusedErrorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: ColorsTheme.grey5,
                  //     width: 1,
                  //   ),
                  //   borderRadius: BorderRadius.circular(6),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: ColorsTheme.grey5,
                  //     width: 0.4,
                  //   ),
                  //   borderRadius: BorderRadius.circular(6),
                  // ),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: ColorsTheme.grey2, width: 1),
                  //   borderRadius: BorderRadius.circular(6),
                  // ),
                  border: InputBorder.none)),
    );
  }
}

class TextFormFieldConfig {
  bool? enabled;
  TextEditingController? controller;
  FocusNode? focusNode;
  TextFormFieldConfig({
    this.enabled,
    this.controller,
    this.focusNode,
  });
}
