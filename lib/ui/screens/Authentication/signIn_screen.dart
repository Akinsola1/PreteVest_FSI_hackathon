import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../core/repositories/auth_repositories.dart';
import '../../responsive_state.dart/responsive_state.dart';
import '../../responsiveness/responsive.dart';
import '../../screen_route.dart/screen_routes.dart';
import '../../theme/colors.dart';
import '../../theme/textStyle.dart';
import '../../widgets/customButton.dart';
import '../../widgets/custom_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
void dispose() {
  email.dispose();
  password.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProv = Provider.of<AuthProvider>(context);

    return Form(
      key: _key,
      child: Column(
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
                    controller: email,
                    validator:  (value) => authProv.validateEmail(value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    height: 10,
                  ),
                  const Text(
                    'Having difficulties remembering your password?',
                    style: AppFonts.tinyBlue2,
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

                                  bool response = await authProv.login(
                                      email.text, password.text);

                                  if (response) {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        RouteNames.navBar, (route) => false);
                                  }
                                },
                                label: 'Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
