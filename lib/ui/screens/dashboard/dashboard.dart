// ignore_for_file: public_member_api_docs, sort_constructors_first
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    responsive.isMobile(context)
                        ? const SizedBox()
                        : Column(
                            children: [
                              desktopNav(
                                image: 'assets/images/Home.png',
                                label: 'Home',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              desktopNav(
                                image: 'assets/images/Nest.png',
                                label: 'Invest',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              desktopNav(
                                image: 'assets/images/Transaction.png',
                                label: 'Loan',
                              )
                            ],
                          ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(
                                //     color: Colors.black.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Get Started',
                                    style: AppFonts.bodyBlack,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  getStartedTask(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  getStartedTask(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  getStartedTask(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  getStartedTask(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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

class getStartedTask extends StatelessWidget {
  const getStartedTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Verify your identity', style: AppFonts.tinyBlackBold),
                  Text(
                      'Provide documents to identify yourself before making transaction',
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.tinyBlack2),
                ],
              ),
            ),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: Center(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class desktopNav extends StatelessWidget {
  final String image;
  final String label;
  const desktopNav({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
          height: 35,
          width: 120,
          decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    image,
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    label,
                    style: AppFonts.tinyBlack,
                  ),
                ]),
          )),
    );
  }
}
