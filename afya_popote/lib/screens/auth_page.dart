import 'package:afya_popote/components/login_form.dart';
import 'package:afya_popote/components/sign_up_form.dart';
import 'package:afya_popote/components/social_button.dart';
import 'package:afya_popote/utils/text.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //build login text field
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height, // Set a specific height
            child: ListView(
              children: <Widget>[
                // Text(
                //   AppText.enText['welcome_text']!,
                //   style: const TextStyle(
                //     fontSize: 36,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Config.spaceSmall,
                Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/profile1.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppText.enText['sfrh']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppText.enText['slogan']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Config.spaceSmall,
                Center(
                  child: Text(
                    isSignIn
                        ? AppText.enText['signIn_text']!
                        : AppText.enText['register_text']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                Config.spaceSmall,
                isSignIn ? LoginForm() : SignUpForm(),
                Config.spaceSmall,

                // Button to switch between Sign In and Sign Up
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isSignIn = !isSignIn;
                      });
                    },
                    child: Text(
                      isSignIn
                          ? 'Huna akaunti? Jisajili hapa'
                          : 'Unayo akaunti? Ingia hapa',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    TextButton(
                      onPressed: () {null;
                      },
                      child: Text(
                        isSignIn ? 'Ukipata changamoto piga: 0655 551 379' : '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
