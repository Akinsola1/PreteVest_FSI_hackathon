
import 'package:flutter/material.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screen_route.dart/screen_routes.dart';
import 'package:pretevest/ui/screens/dashboard/dashboard.dart';
import 'package:pretevest/ui/screens/invest/investScreen.dart';
import 'package:pretevest/ui/screens/loan/loanScreen.dart';
import 'package:pretevest/ui/screens/setting/setting_screen.dart';
import 'package:pretevest/ui/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class base_screen extends StatefulWidget {
  const base_screen({Key? key}) : super(key: key);

  @override
  _base_screenState createState() => _base_screenState();
}

class _base_screenState extends State<base_screen> {
   @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserProvider>(context, listen: false);
      userProv.getUserData();
    });

    checkToken();

    super.initState();
  }

  checkToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('data valid:${preferences.getString('token')}');
    if (preferences.getString('token')!.isEmpty) {

      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.authScreen, (route) => false);
    }
  }

  // bottom navigation bar
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    InvestScreen(),
    LoanScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          iconSize: 23,
          backgroundColor: AppColors.scaffoldBackground,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/Home.png"),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/Nest.png"),
              ),
              label: 'Invest',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/Transaction.png"),
              ),
              label: 'Loan',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
