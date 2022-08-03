import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign in',
                  style: AppFonts.blueHeader,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Email address',
                  hintText: 'pretevest@example.com',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: '*********',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Having difficulties remembering your password?',
                  style: AppFonts.tinyBlue,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(onTap: () {
                          Navigator.pushNamed(context, RouteNames.navBar);
                        }, label: 'Sign In')),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
