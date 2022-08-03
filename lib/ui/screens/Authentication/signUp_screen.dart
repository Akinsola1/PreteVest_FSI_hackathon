// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screens/Authentication/signUpPages/createPassword.dart';
import 'package:pretevest/ui/screens/Authentication/signUpPages/emailScreen.dart';
import 'package:pretevest/ui/screens/Authentication/signUpPages/emailValidation_screen.dart';
import 'package:pretevest/ui/screens/Authentication/signUpPages/personalInfoScreen.dart';
import 'package:pretevest/ui/theme/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late PageController? pageViewController;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: responsive.isMobile(context)
              ? size.height / 1.5
              : size.height / 2,
          width: responsive.isMobile(context)
              ? size.width
              : responsive.isTablet(context)
                  ? size.width / 2
                  : size.width / 3,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: PageView(
              controller: pageViewController = PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              children: [
                emailSignUp(pageViewController: pageViewController),
                CreatePassword(pageViewController: pageViewController),
                emailValidationScreen(pageViewController: pageViewController),
                PersonalInfo(pageViewController: pageViewController),
              ],
            ),
          ),
        )
      ],
    );
  }
}
