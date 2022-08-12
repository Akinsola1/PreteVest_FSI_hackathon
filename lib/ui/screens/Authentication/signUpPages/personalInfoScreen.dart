import 'package:flutter/material.dart';
import 'package:pretevest/core/repositories/auth_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/screens/Authentication/completion_screen.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';
import 'package:pretevest/ui/widgets/widgetsExport.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController? pageViewController;

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController address = TextEditingController();
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
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Personal Info',
                    style: AppFonts.blueHeader,
                  ),
                  signUpProcessCount(
                    currentPage: '4',
                  ),
                ],
              ),
              Text(
                'You are almost done 🚀',
                style: AppFonts.tinyBlack,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'First name',
                hintText: 'john',
                controller: firstName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => authProv.validateName(value!),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Last name',
                hintText: 'Doe',
                controller: lastName,
                validator: (value) => authProv.validateName(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Phone',
                hintText: 'e.g +234,090.',
                controller: phone,
                validator: (value) => authProv.validatePhoneNumber(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Home Address',
                hintText: 'e.g, 21, PreteVest street, Lagos, Nigeria',
                controller: address,
                validator: (value) => authProv.validateAddress(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        text: 'Terms of Conditions ', style: AppFonts.tinyBlue),
                    TextSpan(text: 'and', style: AppFonts.tinyBlack),
                    TextSpan(text: ' Privacy Policy', style: AppFonts.tinyBlue),
                  ],
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

                              bool response = await authProv.setPersonalInfo(
                                  firstName.text,
                                  lastName.text,
                                  phone.text,
                                  address.text);

                              if (response) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CompletionScreen(
                                              title: 'Registration Completed',
                                              onpressed: () {

                                                Navigator.pushNamedAndRemoveUntil(context, RouteNames.navBar, (route) => false);
                                              },
                                              description: RichText(
                                                text: TextSpan(
                                                  text: 'Hi ',
                                                  style: AppFonts.tinyBlack,
                                                  children: const <TextSpan>[
                                                    TextSpan(
                                                        text: 'Faruq ',
                                                        style:
                                                            AppFonts.tinyBlue),
                                                    TextSpan(
                                                        text:
                                                            'your account is ready to go, ensure you provide neccecary document when needed.',
                                                        style:
                                                            AppFonts.tinyBlack),
                                                  ],
                                                ),
                                              ),
                                            )),
                                    (route) => false);
                              }
                            },
                            label: 'Complete'),
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
