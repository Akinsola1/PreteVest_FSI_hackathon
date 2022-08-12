import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screens/Authentication/signIn_screen.dart';
import 'package:pretevest/ui/screens/Authentication/signUp_screen.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/custom_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

@override
void initState() {
  clearData();
  
}
clearData ()async {
  SharedPreferences preferences =await  SharedPreferences.getInstance();
  preferences.clear();
}

class _AuthScreenState extends State<AuthScreen> {
  String authType = 'Login';

  bool login = false;
  bool register = false;
  @override
  void initState() {
    login = true;
    register = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PreteVest',
                    style: AppFonts.blueHeader,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            authType = 'Login';
                            login = true;
                            register = false;
                          });
                        },
                        child: Text(
                          'Login',
                          style: login
                              ? AppFonts.bodyBlue
                              : AppFonts.bodyBlack,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            authType = 'Register';
                            login = false;
                            register = true;
                          });
                        },
                        child: Text(
                          'Register',
                          style: register
                              ? AppFonts.bodyBlue
                              : AppFonts.bodyBlack,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height / 1.6,
              width: responsive.isMobile(context)
                  ? size.width
                  : responsive.isTablet(context)
                      ? size.width / 2
                      : size.width / 3,
              child: buldUi(authType),
            )
          ],
        ),
      ),
    );
  }

  buldUi(String authType) {
    if (authType == 'Login') {
      return SignInScreen();
    } else {
      return SignUpScreen();
    }
  }
}
