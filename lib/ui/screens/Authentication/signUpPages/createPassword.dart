import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({
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
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      pageViewController!.previousPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease,
                      );
                    },
                    icon: Icon(Icons.arrow_back)),
                const Text(
                  'Choose a password',
                  style: AppFonts.blueHeader,
                ),
              ],
            ),
            signUpProcessCount(
              currentPage: '2',
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Password',
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '* Password should be At least 8 characters',
          style: AppFonts.tinyBlack,
        ),
        Text(
          '* Password should have uppercase and lowercase letters',
          style: AppFonts.tinyBlack,
        ),
        Text(
          '* Inclusion of at least one special character, e.g., ! @ # ? ]',
          style: AppFonts.tinyBlack,
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
                    label: 'Create account')),
          ],
        )
      ],
    );
  }
}
