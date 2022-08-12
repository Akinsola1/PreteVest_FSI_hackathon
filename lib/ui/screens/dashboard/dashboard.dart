// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:provider/provider.dart';

import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customAppbar.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../responsive_state.dart/responsive_state.dart';
import '../../widgets/widgetsExport.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserProvider>(context, listen: false);
      userProv.getUserData();
    });

    super.initState();
  }

  TextEditingController amount = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProv = Provider.of<UserProvider>(context);
    var userData = userProv.userData;
    bool? completeKyc = userData.data?.kycVerified;
    bool? infoCompleted = userData.data?.infoCompleted;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ResponsiveState(
          state: userProv.state,
          busyWidget: const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 6)),
          idleWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: customAppBar(
                        name: '${userData.data?.firstname}',
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: responsive.isMobile(context)
                          ? double.infinity
                          : size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wallet Balance',
                              style: AppFonts.tinyBlack2,
                            ),
                            Text(
                              '₦ ${userData.data?.balance}',
                              style: AppFonts.blueHeader,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        insetPadding: EdgeInsets.all(10),
                                        title: Text(
                                          "Fund Wallet",
                                          style: AppFonts.blueHeader,
                                        ),
                                        content: Form(
                                          key: _key,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextField(
                                              isAmount: true,
                                                labelText: "Amount",
                                                hintText:
                                                    "₦10,000 - ₦100,000,000",
                                                controller: amount,
                                                textInputType:
                                                    TextInputType.number,
                                                validator: (value) => userProv
                                                    .validateAmount(value!),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              ResponsiveState(
                                                  state: userProv.state,
                                                  busyWidget: const SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child:
                                                          CircularProgressIndicator(
                                                              strokeWidth: 6)),
                                                  idleWidget: CustomButton(
                                                      onTap: () async {
                                                        if (!_key.currentState!
                                                            .validate()) return;
                                                        bool u = await userProv
                                                            .foundWallet(
                                                                amount.text);
                                                        if (u) {
                                                          Navigator.pop(
                                                              context);

                                                          js.context.callMethod(
                                                              'open', [
                                                            userProv
                                                                .foundWalletResponse
                                                                .data
                                                                ?.data
                                                                ?.link,
                                                          ]);
                                                        }
                                                      },
                                                      label: "Make request"))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                label: 'Fund wallet'),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // border: Border.all(
                                  //     color: Colors.black.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'To-Do List',
                                    style: AppFonts.bodyBlack,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  getStartedTask(
                                    done: completeKyc ?? false,
                                    title: 'Complete your KYC',
                                    subtitle:
                                        'Provide information to verify your identity',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  getStartedTask(
                                    done: infoCompleted ?? false,
                                    title: 'Lets know more about you',
                                    subtitle:
                                        'Provide answers to the following information',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class getStartedTask extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool done;
  const getStartedTask({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.done,
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
                  Text(title,
                      style: TextStyle(
                          decoration: done ? TextDecoration.lineThrough : null,
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'openSansLight',
                          fontWeight: FontWeight.w700)),
                  Text(subtitle,
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
                  color: done ? AppColors.primaryColor : Colors.white,
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
