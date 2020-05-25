import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gods_eye/components/horizontal_line.dart';
import 'package:gods_eye/components/radio_button.dart';
import 'package:gods_eye/components/rounded_button.dart';
import 'package:gods_eye/screens/main_nav.dart';
import 'package:gods_eye/screens/sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSelected = false;
  final RoundedButtonController _btnController = new RoundedButtonController();

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;

    void _validateLogin() async {
      // Login Fail
//      Timer(Duration(seconds: 3), () {
//        _btnController.error();
//        Timer(Duration(seconds: 2), () {
//          _btnController.stop();
//          _btnController.reset();
//        });
//      });

      // Login Success
      Timer(Duration(seconds: 3), () {
        _btnController.success();
        Timer(Duration(seconds: 2), () {
          Navigator.pushNamed(context, MainNav.id);
          _btnController.stop();
          _btnController.reset();
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: screenWidth * -0.07,
              top: screenHeight * 0.023,
              child: SvgPicture.asset(
                'images/login_background.svg',
                height: screenHeight * 0.297,
                width: screenWidth * 0.297,
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Image.asset("images/city.png"),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.068,
                  right: screenWidth * 0.068,
                  top: screenHeight * 0.088,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "images/ball.png",
                          width: screenWidth * 0.147,
                          height: screenWidth * 0.138,
                        ),
                        Text(
                          "Welcome.",
                          style: textTheme.headline1.copyWith(
                              letterSpacing: .6,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 26),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.0965,
                          left: screenWidth * 0.033),
                      child: Text(
                        'Sign in to continue.',
                        style: textTheme.headline1
                            .copyWith(fontSize: 17.5, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.037,
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.405,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.015),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, screenHeight * 0.02),
                              blurRadius: screenHeight * 0.02,
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, screenHeight * -0.015),
                              blurRadius: screenHeight * 0.015,
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.038,
                          right: screenWidth * 0.038,
                          top: screenHeight * 0.023,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Login",
                                style: textTheme.headline1.copyWith(
                                    letterSpacing: .6,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24.8)),
                            SizedBox(
                              height: screenHeight * 0.0225,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(fontSize: 19.3),
                              ),
                              onChanged: (value) {},
                            ),
                            SizedBox(
                              height: screenHeight * 0.0225,
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 19.3),
                              ),
                              onChanged: (value) {},
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.045),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Forgot Password?",
                                    style: textTheme.bodyText1.copyWith(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            GestureDetector(
                              onTap: _radio,
                              child: radioButton(_isSelected),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Text("Remember me",
                                style: textTheme.bodyText1.copyWith(
                                    fontSize: 12.7,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: .005))
                          ],
                        ),
                        RoundedButton(
                          text: "SIGN IN",
                          controller: _btnController,
                          onPressed: _validateLogin,
                          width: screenWidth * 0.44,
                          height: screenHeight * 0.075,
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        horizontalLine(),
                        SizedBox(
                          width: screenWidth * 0.07,
                        ),
                        horizontalLine()
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.053,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User? ",
                          style: textTheme.bodyText1
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                          child: Text(
                            "Sign Up",
                            style: textTheme.bodyText1.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
