import 'package:flutter/material.dart';
import 'package:pretevest/core/repositories/auth_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class emailValidationScreen extends StatefulWidget {
  const emailValidationScreen({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController? pageViewController;

  @override
  State<emailValidationScreen> createState() => _emailValidationScreenState();
}

class _emailValidationScreenState extends State<emailValidationScreen> {
  String email = '';
  String password = '';
  @override
  void initState() {
    fetchPreference();
    super.initState();
  }

  fetchPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('Email') ?? '';
    password = prefs.getString('password') ?? '';
  }

  TextEditingController OTP = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);
    Size size  = MediaQuery.of(context).size;
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
          child: ListView(
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
                  children: <TextSpan>[
                    TextSpan(text: email, style: AppFonts.tinyBlue),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'e.g.,002211',
                controller: OTP,
              autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:  (value) => authProv.validatePin(value!),
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
              Center(
                child: ResponsiveState(
                  state: authProv.state,
                  busyWidget: const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(strokeWidth: 6)),
                  idleWidget: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            onTap: () async {
                          if (!_key.currentState!.validate()) return;

                              bool response = await authProv.registerEmailOtp(
                                  email, password, OTP.text);

                              if (response) {
                                widget.pageViewController!.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            label: 'Create Account'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
