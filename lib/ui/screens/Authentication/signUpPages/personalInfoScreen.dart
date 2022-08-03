
import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/signupProcessCount.dart';
import 'package:pretevest/ui/widgets/widgetsExport.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children:[
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const  [
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
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Last name',
          hintText: 'Doe',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Home Address',
          hintText: 'e.g, 21, PreteVest street, Lagos, Nigeria',
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
