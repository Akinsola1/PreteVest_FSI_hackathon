import 'package:flutter/material.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsive_state.dart/responsive_state.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screens/invest/active_investment.dart';
import 'package:pretevest/ui/screens/invest/loanRequest.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/customButton.dart';
import 'package:provider/provider.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({Key? key}) : super(key: key);

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserProvider>(context, listen: false);
      userProv.getAllLoanRequest();
      userProv.getpledgedLoan();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);
    var userData = userProv.userData;
    Size size = MediaQuery.of(context).size;
    return Center(
      child: ResponsiveState(
          state: userProv.state,
          busyWidget: const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 6)),
          idleWidget: Container(
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
                            'Invest',
                            style: AppFonts.blueHeader,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Pledged Amount',
                            style: AppFonts.tinyBlack2,
                          ),
                          Text(
                            '₦ ${userData.data?.totalBorrowed}',
                            style: AppFonts.blueHeader,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                                      text: 'Loan Request',
                                    ),
                                    Tab(
                                      text: 'Active Investment',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              child: TabBarView(
                            children: [LoanRequest(), ActiveInvestment()],
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
