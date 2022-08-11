import 'package:flutter/material.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllBankModel.dart';

class BankDropdown extends StatefulWidget {
  const BankDropdown({
    Key? key,
    required this.initialOption,
    required this.hintText,
    required this.options,
    required this.onChanged,
    required this.icon,
    required this.width,
    required this.height,
    required this.fillColor,
    required this.textStyle,
    required this.elevation,
    required this.borderWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.margin,
    this.hidesUnderline = false,
  }) : super(key: key);

  final GetAllBankModel initialOption;
  final String hintText;
  final List<GetAllBankModel> options;
  final Function(GetAllBankModel) onChanged;
  final Widget icon;
  final double width;
  final double height;
  final Color fillColor;
  final TextStyle textStyle;
  final double elevation;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;

  @override
  _BankDropdownState createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {
  late GetAllBankModel dropDownValue;
  List<GetAllBankModel> get effectiveOptions =>
      widget.options.isEmpty ? [] : widget.options;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDownValue = widget.initialOption;
  }


  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButton<GetAllBankModel>(
      value: effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      hint: widget.hintText != null
          ? Text(widget.hintText, style: widget.textStyle)
          : null,
      items: effectiveOptions
          .map((e) => DropdownMenuItem(
        value: e,
        child: Text(
          e.name!,
          style: widget.textStyle,
        ),
      ))
          .toList(),
      elevation: widget.elevation.toInt(),
      onChanged: (value) {
        dropDownValue = value!;
        widget.onChanged(value);
      },
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: widget.fillColor,
      focusColor: Colors.transparent,
    );
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
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