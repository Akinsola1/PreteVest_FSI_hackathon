// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';

import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';

class CompletionScreen extends StatefulWidget {
  final String title;
  final VoidCallback onpressed;
  final Widget description;
  const CompletionScreen({
    Key? key,
    required this.title,
    required this.onpressed,
    required this.description,
  }) : super(key: key);

  @override
  State<CompletionScreen> createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PreteVest',
                        style: AppFonts.blueHeader,
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: responsive.isMobile(context)
                      ? size.width
                      : responsive.isTablet(context)
                          ? size.width / 2
                          : size.width / 3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Stack(
                      children: [
                        // Lottie.asset('assets/lottie/completion.json'),
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/Double Tick.png',
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                widget.title,
                                style: AppFonts.blueHeader,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              widget.description,
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomButton(
                                          onTap: widget.onpressed,
                                          label: 'Continue')),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
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
