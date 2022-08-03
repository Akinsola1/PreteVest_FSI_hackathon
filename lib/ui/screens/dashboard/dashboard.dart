import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screens/Authentication/signIn_screen.dart';
import 'package:pretevest/ui/screens/Authentication/signUp_screen.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customAppbar.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: customAppBar(),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
               Center(
                 child: Container(
                  width: responsive.isMobile(context) ? size.width : size.width / 1.2,
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                      ],
                    ),
                  ),
                 ),
               )
              ],
            ),
            responsive.isMobile(context)
                ? SizedBox()
                : Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('© PreteVest')],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class desktopNav extends StatelessWidget {
  const desktopNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Home.png',
                    height: 20,
                    width: 20,
                  ),
                  Text('Home')
                ]),
          )),
    );
  }
}
