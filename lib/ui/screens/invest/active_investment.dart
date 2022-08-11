import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/widgetsExport.dart';
import 'package:provider/provider.dart';

class ActiveInvestment extends StatefulWidget {
  const ActiveInvestment({Key? key}) : super(key: key);

  @override
  State<ActiveInvestment> createState() => _ActiveInvestmentState();
}

class _ActiveInvestmentState extends State<ActiveInvestment> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);
    var userData = userProv.userData;
    var allpledged = userProv.pledgedLoan;
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
                  'Pledged Loan',
                  style: AppFonts.tinyBlackBold,
                ),
               const  Text(
                  'Total Loans you have contributed to are displayed here',
                  style: AppFonts.tinyBlack2,
                ),
                const SizedBox(height: 20),
                ListView.builder(
                    itemCount: allpledged.data?.length,
                    itemBuilder: (context, index) {
          
                      return userProv.pledgedLoan.data!.isEmpty
                          ? Center(child: Text('You have no pledged to any Loan', style: AppFonts.tinyBlackBold,))
                          : Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Title: ${allpledged.data?.elementAt(index).request?.title}',
                                        style: AppFonts.tinyBlue2Bold,
                                      ),
                                      Text(
                                        'Descripttion: ${allpledged.data?.elementAt(index).request?.description}',
                                        style: AppFonts.tinyBlue2Bold,
                                      ),
                                      Text(
                                        'Amount pledged: ${allpledged.data?.elementAt(index).amount}',
                                        style: AppFonts.tinyBlue2Bold,
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}