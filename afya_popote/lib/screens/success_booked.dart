import 'package:afya_popote/components/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   alignment: Alignment.center,
            //   child: const Text(
            //     'Ongera umeweka ahadi kikamilifu',
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.green,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 3, child: Lottie.asset('assets/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Hongera umeweka ahadi kikamilifu',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Karibu sana kwa matibabu',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Button(
                width: double.infinity,
                title: 'Rudi mwanzo',
                onPressed: () => Navigator.of(context).pushNamed('main'),
                disable: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
