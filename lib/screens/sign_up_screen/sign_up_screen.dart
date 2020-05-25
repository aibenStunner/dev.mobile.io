import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gods_eye/components/horizontal_line.dart';
import 'package:gods_eye/components/rounded_button.dart';
import 'package:gods_eye/screens/login_screen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'sign_up_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RoundedButtonController _btnController = new RoundedButtonController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;

    void _validateSignUp() async {
      // Sign up fail
      Timer(Duration(seconds: 3), () {
        _btnController.error();
        Timer(Duration(seconds: 2), () {
          _btnController.stop();
          _btnController.reset();
        });
      });

      // Sign up success
//      Timer(Duration(seconds: 3), () {
//        _btnController.success();
//        Timer(Duration(seconds: 2), () {
//          Navigator.pushNamed(context, LoginScreen.id);
//      _btnController.stop();
//      _btnController.reset();
//        });
//      });
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
              top: screenHeight * 0.024,
              child: SvgPicture.asset(
                'images/sign_up_background.svg',
                height: screenHeight * 0.305,
                width: screenWidth * 0.305,
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
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 26),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.148, left: screenWidth * 0.033),
                      child: Text(
                        'Enter details to register.',
                        style: textTheme.headline1.copyWith(
                          fontSize: 17.5,
                          color: Colors.black,
                        ),
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
                        child: Stack(
                          children: <Widget>[
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Sign Up",
                                      style: textTheme.headline1.copyWith(
                                          letterSpacing: .6,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          fontSize: 24.8)),
                                  SizedBox(
                                    height: screenHeight * 0.0225,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'First Name',
                                      labelStyle: TextStyle(fontSize: 19.3),
                                    ),
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.0225,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Last Name',
                                      labelStyle: TextStyle(fontSize: 19.3),
                                    ),
                                    onChanged: (value) {},
                                  ),
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
                                  SizedBox(
                                    height: screenHeight * 0.0225,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      labelStyle: TextStyle(fontSize: 19.3),
                                    ),
                                    onChanged: (value) {},
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.045))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundedButton(
                          text: "SIGN UP",
                          controller: _btnController,
                          onPressed: _validateSignUp,
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
                          width: screenWidth * 0.03,
                        ),
                        horizontalLine()
                      ],
                    ),
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
