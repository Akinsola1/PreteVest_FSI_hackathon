import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllLoanRequestModel.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/widgetsExport.dart';
import 'package:provider/provider.dart';

class LoanRequest extends StatefulWidget {
  const LoanRequest({Key? key}) : super(key: key);

  @override
  State<LoanRequest> createState() => _LoanRequestState();
}

class _LoanRequestState extends State<LoanRequest> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);
    GetAllLoanRequestModel allLoanRequest= userProv.allLoanRequest;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  'All Loan Requests',
                  style: AppFonts.tinyBlackBold,
                ),
                Text(
                  'Pretevest invest allows you lend people money and get back certain percentage back. E.g if you invest ₦5,000 out of ₦10,000 loan request, you will get back ₦750 back',
                  style: AppFonts.tinyBlack2,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      itemCount: allLoanRequest.data?.length,
                      itemBuilder: (context, index) {
                        double? amountPlegded = double.parse(allLoanRequest.data!.elementAt(index).pledged.toString())  ;
                        double? loanAmount = double.parse(allLoanRequest.data!
                            .elementAt(index)
                            .amount
                            .toString());

                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${allLoanRequest.data?.elementAt(index).title}',
                                    style: AppFonts.tinyBlue2Bold,
                                  ),
                                  Text(
                                    '${allLoanRequest.data?.elementAt(index).description}',
                                    style: AppFonts.tinyBlack2,
                                  ),
                                  Text(
                                    '₦ ${allLoanRequest.data?.elementAt(index).pledged}/₦${allLoanRequest.data?.elementAt(index).amount}',
                                    style: AppFonts.tinyBlack2,
                                  ),
                                  SizedBox(
                                    height: 15,
                                    width: double.infinity,
                                    child: FAProgressBar(
                                      currentValue:
                                          ((amountPlegded / loanAmount) * 100)
                                              .roundToDouble(),
                                      // displayText: '%',
                                      backgroundColor: AppColors.primaryColor
                                          .withOpacity(0.5),
                                      progressColor: AppColors.primaryColor,
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showAlertDialog(
                                        context,
                                        allLoanRequest.data!
                                            .elementAt(index)
                                            .id!);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Pledge',
                                        style: AppFonts.tinyBlue2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, int owner) {
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
            Center(
              child: ResponsiveState(
                state: userProv.state,
                busyWidget: const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(strokeWidth: 6)),
                idleWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      isAmount: true,
                      labelText: "Amount",
                      hintText: "₦1000 - ₦100,000,000",
                      controller: amount,
                      textInputType: TextInputType.number,
                      validator: (value) => userProv.validateAmount(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onTap: () async {
                          if (!_key.currentState!.validate()) return;
                          // if (int.parse(amount.text) >
                          //     int.parse(userProv.userData.data!.balance!)) {
                          //   Navigator.pop(context);
                          //   showInsuffecientFund(context);
                          // }
                          Navigator.pop(context);
                          bool u = await userProv.pledgeToALaon(
                              double.parse(amount.text), owner);
                        },
                        label: "Make request")
                  ],
                ),
              ),
            ),
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

showInsuffecientFund(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 40,
              ),
              Text(
                "Insufficient fund",
                style: AppFonts.bodyBlue,
              )
            ],
          ),
        );
      });
}
