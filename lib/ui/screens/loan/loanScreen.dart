import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/screens/Authentication/completion_screen.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:pretevest/ui/widgets/widgetsExport.dart';
import 'package:provider/provider.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  void initState() {
      
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserProvider>(context, listen: false);
    userProv.getLoanRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);
    var userData = userProv.userData;
    var userLoanRequest = userProv.loanRequest;
    Size size = MediaQuery.of(context).size;
    return  Center(
                    child: ResponsiveState(
                      state: userProv.state,
                      busyWidget: const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(strokeWidth: 6)),
                      idleWidget: 
Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: SizedBox(
            width:
                responsive.isMobile(context) ? double.infinity : size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loan',
                  style: AppFonts.blueHeader,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Total Borrowed',
                  style: AppFonts.tinyBlack2,
                ),
                Text(
                  '₦ ${userData.data?.totalBorrowed}',
                  style: AppFonts.blueHeader,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    label: 'Make  Loan Request'),
                const SizedBox(
                  height: 20,
                ),

                Text(
                  'Loan Requests',
                  style: AppFonts.tinyBlackBold,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: userLoanRequest.data?.length,
                    itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${userLoanRequest.data?.elementAt(index).title}',style: AppFonts.bodyBlue,),
                        Text('${userLoanRequest.data?.elementAt(index).description}',style: AppFonts.tinyBlack2,),
                        Row(
                          children: [
                        Text('₦ ${userLoanRequest.data?.elementAt(index).pledged}/₦${userLoanRequest.data?.elementAt(index).amount}',style: AppFonts.tinyBlack2,),

                          ],
                        ),
                        Divider(),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    )
                    ),
                  );
  }

  showAlertDialog(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context, listen: false);

    TextEditingController amount = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();

    final _key = GlobalKey<FormState>();

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      insetPadding: EdgeInsets.all(10),
      title: Text(
        "Make Loan Request",
        style: AppFonts.blueHeader,
      ),
      content: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              labelText: "Title",
              hintText: "Promote music career",
              controller: title,
              validator: (value) => userProv.validateComment(value!),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Amount",
              hintText: "₦10,000 - ₦100,000,000",
              controller: amount,
              textInputType: TextInputType.number,
              validator: (value) => userProv.validateAmount(value!),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Description",
              hintText: "Loan request to finance my music career ",
              controller: description,
              validator: (value) => userProv.validateComment(value!),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 20,
            ),
            ResponsiveState(
                state: userProv.state,
                busyWidget: const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(strokeWidth: 6)),
                idleWidget: CustomButton(
                    onTap: () async {
                      if (!_key.currentState!.validate()) return;
                      bool u = await userProv.makeLoanRequest(
                          amount.text, title.text, description.text);
                      if (u) {
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletionScreen(
                                  title: "Loan request successful",
                                  onpressed: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        RouteNames.navBar, (route) => false);
                                  },
                                  description: Text("Pay the loan back"))),
                        );
                      }
                    },
                    label: "Make request")),
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

