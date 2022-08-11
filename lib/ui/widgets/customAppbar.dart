// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/theme/textStyle.dart';

class customAppBar extends StatefulWidget {
  final String name;
  const customAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<customAppBar> createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello ${widget.name}',
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
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.settingScreen);
                }, icon: Icon(Icons.settings))
          ],
        )
      ],
    );
  }
}
