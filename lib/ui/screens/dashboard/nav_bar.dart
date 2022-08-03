import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/screens/dashboard/dashboard.dart';
import 'package:pretevest/ui/theme/colors.dart';

class base_screen extends StatefulWidget {
  const base_screen({Key? key}) : super(key: key);

  @override
  _base_screenState createState() => _base_screenState();
}

class _base_screenState extends State<base_screen> {
  // bottom navigation bar
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    DashBoard(),
    DashBoard(),
    DashBoard(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return responsive.isMobile(context) ? 
    Scaffold(
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
    ):DashBoard();
  }
}
