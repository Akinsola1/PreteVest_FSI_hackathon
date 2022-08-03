
import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';

class emailSignUp extends StatelessWidget {
  const emailSignUp({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Register',
              style: AppFonts.blueHeader,
            ),
            signUpProcessCount(
              currentPage: '1',
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: AppFonts.tinyBlack,
            children: const <TextSpan>[
              TextSpan(text: 'Sign In', style: AppFonts.tinyBlue),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Email address',
          hintText: 'e.g, pretevest@example.com',
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text:
                'By clicking continue to create an account, you agree to our ',
            style: AppFonts.tinyBlack,
            children: const <TextSpan>[
              TextSpan(
                  text: 'Terms of Conditions ',
                  style: AppFonts.tinyBlue),
              TextSpan(text: 'and', style: AppFonts.tinyBlack),
              TextSpan(
                  text: ' Privacy Policy',
                  style: AppFonts.tinyBlue),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: CustomButton(
                    onTap: () {
                      pageViewController!.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease,
                      );
                    },
                    label: 'Continue')),
          ],
        )
      ],
    );
  }
}
