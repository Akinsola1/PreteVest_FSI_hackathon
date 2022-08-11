import 'package:flutter/material.dart';
import 'package:pretevest/core/repositories/auth_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screens/Authentication/signUpPages/createPassword.dart';
import 'package:pretevest/ui/screens/Authentication/signUp_screen.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class emailSignUp extends StatefulWidget {
  const emailSignUp({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController? pageViewController;

  @override
  State<emailSignUp> createState() => _emailSignUpState();
}

class _emailSignUpState extends State<emailSignUp> {
  final TextEditingController emailAddress = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _key,
      child: Container(
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
                controller: emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value)=>  authProv.validateEmail(value!),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text:
                      'By clicking continue to create an account, you agree to our ',
                  style: AppFonts.tinyBlack2,
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Terms of Conditions ',
                        style: AppFonts.tinyBlue2),
                    TextSpan(text: 'and', style: AppFonts.tinyBlack2),
                    TextSpan(
                        text: ' Privacy Policy', style: AppFonts.tinyBlue2),
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
                        onTap: () async {
                          if (!_key.currentState!.validate()) return;

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('Email', emailAddress.text);
                          widget.pageViewController!.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                        label: 'Continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
