// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width:
              responsive.isMobile(context) ? double.infinity : size.width / 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: ListView(
                children: [
                  const Text(
                    'Settings',
                    style: AppFonts.blueHeader,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor.withOpacity(0.5)),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Akinsola faruq',
                      style: AppFonts.bodyBlue,
                    ),
                  ),
                  Text(
                    'General',
                    style: AppFonts.tinyBlack,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  settingOptions(
                    size: size,
                    subtitle: 'Adjust Notification setting',
                    title: 'Notification',
                    icon: Icons.notifications,
                    onpressed: (){},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  settingOptions(
                    size: size,
                    subtitle:
                        'Provide updated information any time they change',
                    title: 'Edit Personal Info',
                    icon: Icons.person,
                    onpressed: (){},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  settingOptions(
                    size: size,
                    subtitle:
                        'Provide updated document to verify your identity',
                    title: 'Update KYC',
                    icon: Icons.update,
                    onpressed: (){},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  settingOptions(
                    size: size,
                    subtitle: 'Change your wallet preference',
                    title: 'Wallet setting',
                    icon: Icons.wallet,
                    onpressed: (){},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'FAQ',
                    style: AppFonts.tinyBlack,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  settingOptions(
                    size: size,
                    subtitle: 'Talk to our customer care',
                    title: 'Self Help',
                    icon: Icons.info,
                    onpressed: (){
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Account',
                    style: AppFonts.tinyBlack,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  settingOptions(
                    size: size,
                    subtitle: 'We will be expecting you back',
                    title: 'Logout',
                    icon: Icons.logout,
                    onpressed: () async{
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.clear();
                      Navigator.pushNamedAndRemoveUntil(context, RouteNames.authScreen, (route) => false);

                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  settingOptions(
                    size: size,
                    subtitle: 'Delete your pretevest Account',
                    title: 'Delete Account',
                    icon: Icons.logout,
                    onpressed: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class settingOptions extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onpressed;
  const settingOptions({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onpressed,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Card(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppFonts.tinyBlackBold,
                      ),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.tinyBlack2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
