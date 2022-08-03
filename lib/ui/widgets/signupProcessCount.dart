
import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/textStyle.dart';

class signUpProcessCount extends StatelessWidget {
  final String currentPage;
  const signUpProcessCount({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$currentPage/',
          style: AppFonts.bodyBlue,
        ),
        Text(
          '4',
          style: AppFonts.tinyBlack,
        ),
      ],
    );
  }
}
