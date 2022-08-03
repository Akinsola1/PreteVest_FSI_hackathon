
import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/textStyle.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'PreteVest',
          style: AppFonts.blueHeader,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                )),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.settings))
          ],
        )
      ],
    );
  }
}
