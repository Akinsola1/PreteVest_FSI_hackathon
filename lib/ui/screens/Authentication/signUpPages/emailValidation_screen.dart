import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';

class emailValidationScreen extends StatelessWidget {
  const emailValidationScreen({
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
              'Confirm Email',
              style: AppFonts.blueHeader,
            ),
            signUpProcessCount(
              currentPage: '3',
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text:
                'To complete your registration, please enter the code that we sent to: ',
            style: AppFonts.tinyBlack,
            children: const <TextSpan>[
              TextSpan(
                  text: 'Akindoyinfaruq@gmail.com', style: AppFonts.tinyBlue),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          hintText: 'e.g.,0022',
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: const Text(
            'Click to resend OTP',
            style: AppFonts.tinyBlue,
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
                    label: 'Submit')),
          ],
        )
      ],
    );
  }
}
