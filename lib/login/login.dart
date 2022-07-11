import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            Container(
                child: Column(children: [
              SizedBox(
                height: 230,
              ),
              LoginButton(
                text: 'Sign in with Google',
                icon: FontAwesomeIcons.google,
                color: Color.fromARGB(255, 255, 161, 89),
                loginMethod: AuthService().googleLogin,
              ),
              SizedBox(
                height: 10,
              ),
              // FutureBuilder<Object>(
              //   future: SignInWithApple.isAvailable(),
              //   builder: (context, snapshot) {
              //     if (snapshot.data == true) {
              //       return SignInWithAppleButton(
              //         onPressed: () {
              //           AuthService().signInWithApple();
              //         },
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // ),
              LoginButton(
                icon: FontAwesomeIcons.userNinja,
                text: 'Continue as Guest',
                loginMethod: AuthService().anonLogin,
                color: Colors.deepPurple,
              ),
              SizedBox(
                height: 30,
              ),
            ])),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          side: const BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        onPressed: () => loginMethod(),
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
