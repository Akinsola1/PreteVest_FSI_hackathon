import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:pretevest/core/api/data_models/user_response/myLoanRequestModel.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/screens/Authentication/completion_screen.dart';
import 'package:pretevest/ui/screens/loan/active_loan.dart';
import 'package:pretevest/ui/screens/loan/myLoan_request.dart';
import 'package:pretevest/ui/theme/colors.dart';
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
    return Center(
      child: ResponsiveState(
          state: userProv.state,
          busyWidget: const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 6)),
          idleWidget:  Container(
            width:
                responsive.isMobile(context) ? double.infinity : size.width / 2,
            child: DefaultTabController(
                length: 2,
                child: Builder(builder: (BuildContext context) {
                  final TabController? tabController =
                      DefaultTabController.of(context);
                  tabController?.addListener(
                    () {
                      if (!tabController.indexIsChanging) {}
                    },
                  );
                  return Scaffold(
                      body: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
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
                const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: const [
                                    Tab(
                                      text: 'My Loan Request',
                                    ),
                                    Tab(
                                      text: 'Active Loan',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              child: TabBarView(
                            children: [MyLoanRequestScreen(), MyActiveLoan()],
                          ))
                        ],
                      ),
                    ),
                  ));
                })),
          )),
    );
  }

}
