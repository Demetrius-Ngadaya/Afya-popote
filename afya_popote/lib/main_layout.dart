import 'package:afya_popote/components/appointment_card.dart';
import 'package:afya_popote/providers/dio_provider.dart';
import 'package:afya_popote/screens/appointment_page.dart';
import 'package:afya_popote/screens/fav_page.dart';
import 'package:afya_popote/screens/home_page.dart';
import 'package:afya_popote/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // variable declaration
  int currentPage = 0;
  final PageController _page = PageController();

  Future<void> logoutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty && token != '') {
      // logout here
      final response = await DioProvider().logout(token);

      if (response == 200) {
        // if successfully delete access token
        // then delete token saved at Shared Preference as well
        await prefs.remove('token');
        setState(() {
          // redirect to login page
          MyApp.navigatorKey.currentState!.pushReplacementNamed('/');
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children: <Widget>[
          const HomePage(),
          const AppointmentPage(),
          AppointmentCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page) {
          if (page == 3) {
            logoutUser();
          } else {
            setState(() {
              currentPage = page;
              _page.animateToPage(
                page,
                duration: const Duration(milliseconds: 5),
                curve: Curves.easeInOut,
              );
            });
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyUser),
            label: 'Nyumbani',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidCalendarDays),
            label: 'Ahadi',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.comment),
            label: 'Maoni',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.signOut),
            label: 'ondoka',
          ),
        ],
      ),
    );
  }
}