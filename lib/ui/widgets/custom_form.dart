// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretevest/ui/theme/textStyle.dart';

class CustomTextField extends StatefulWidget {
  final bool? hasLeading;
  final bool? isDate;
  final bool? isPassword;
  final bool? readOnly;
  final bool? changePhoneNumber;
  final int? maxLines;
  final Function? validator;
  final Widget? prefix;
  final String? hintText;
  final String? labelText;
  final String? trailling;
  final bool? hasBorder;
  final bool? obscureText;
  final IconData? suffixData;
  final Function? onTap;
  final String? imgUri;
  final Color? fillColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode? autovalidateMode;

  ///labelText cannot be used when hintText is used
  CustomTextField({
    Key? key,
    this.hasLeading = false,
    this.isDate = false,
    this.isPassword = false,
    this.readOnly = false,
    this.changePhoneNumber = false,
    this.maxLines,
    this.validator,
    this.prefix,
    this.hintText,
    this.labelText,
    this.trailling = '',
    this.hasBorder,
    this.obscureText = false,
    this.suffixData,
    this.onTap,
    this.imgUri,
    this.fillColor = Colors.white,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.textInputType,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hide = false;
  @override
  void initState() {
    super.initState();
    hide = widget.obscureText!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text( widget.labelText!,
                      style:AppFonts.bodyBlack),
                )
              : SizedBox(),
          SizedBox(
            height: 58,
            child: Row(
              children: [
                widget.imgUri != null
                    ? Image.asset(widget.imgUri!)
                    : Container(),
                widget.imgUri != null
                    ? SizedBox(
                        width: 16,
                      )
                    : Container(),
                Expanded(
                  child: Center(
                    child: TextFormField(
                      autovalidateMode: widget.autovalidateMode,
                      keyboardType: widget.textInputType,
                      textInputAction: widget.textInputAction,
                      readOnly: widget.readOnly!,
                      controller: widget.controller,
                      // onTap: widget.onTap,
                      obscureText: hide,
                      obscuringCharacter:'•',
                      maxLines: widget.maxLines ?? 1,
                      // validator: widget.validator,
                      decoration: InputDecoration(
                        // labelText: widget.labelText,
                        
                        prefixIcon: widget.prefix,
                        isDense: false,
                        fillColor: widget.fillColor,
                        suffixIcon: widget.obscureText!
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    hide = !hide;
                                  });
                                },
                                icon: !hide
                                    ? Icon(
                                        Icons.visibility_outlined,
                                        color: Color(0xffA5D0DB),
                                      )
                                    : Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color(0xffA5D0DB),
                                      ),
                              )
                            : widget.suffixData != null
                                ? Icon(
                                    widget.suffixData,
                                  )
                                : null,
                        filled: true,
                        //labelText: widget.labelTex
                        hintText: widget.hintText,
                        hintStyle: AppFonts.hintText,
                        labelStyle: AppFonts.bodyBlack,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffD5DDE0).withOpacity(0.8)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.trailling!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 11,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
