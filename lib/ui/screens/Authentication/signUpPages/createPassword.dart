// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class CreatePassword extends StatefulWidget {
  const CreatePassword({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController? pageViewController;

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController password= TextEditingController();
  final _key = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProv = Provider.of<AuthProvider>(context);
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.pageViewController!.previousPage(
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
                    hintText: '••••••••',
                    obscureText: true,
                    controller: password,
                    validator: (value) => authProv.validatePassword(value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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

                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  String email = prefs.getString('Email') ?? '';

                                  bool response = await authProv.sendOtp(email);

                                  if (response) {
                                    prefs.setString('password', password.text);
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
