// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pretevest/ui/theme/textStyle.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key? key,
    required this.initialOption,
    required this.hintText,
    required this.options,
    required this.onChanged,
     this.width = double.infinity,
     this.height = 56,
     this.fillColor = Colors.white,
    required this.elevation,

    required this.margin,
    this.hidesUnderline = false,
  }) : super(key: key);

  final String initialOption;
  final String hintText;
  final List<String> options;
  final Function(String) onChanged;
   double width;
   double height;
   Color fillColor;
  final double elevation;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String dropDownValue;
  List<String> get effectiveOptions =>
      widget.options.isEmpty ? ['[Option]'] : widget.options;

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButton<String>(
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      hint: widget.hintText != null
          ? Text(widget.hintText, style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).iconTheme.color!,
                          ),)
          : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style:   AppFonts.tinyBlack
                ),
              ))
          .toList(),
      elevation: widget.elevation.toInt(),
      onChanged: (value) {
        dropDownValue = value!;
        widget.onChanged(value);
      },
      icon: Icon(
                Icons.arrow_drop_down_rounded,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
      isExpanded: true,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      focusColor: Colors.transparent,
    );
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
        color: widget.fillColor,
      ),
      child: Padding(
        padding: widget.margin,
        child: widget.hidesUnderline
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget,
      ),
    );
    if (widget.height != null || widget.width != null) {
      return Container(
          width: widget.width, height: widget.height, child: childWidget);
    }
    return childWidget;
  }
}
