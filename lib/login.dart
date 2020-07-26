import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolling_international/buttons.dart';

import 'package:rolling_international/register.dart';
import 'colors.dart';
import 'home.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatefulWidget {
  @override
  __LoginBodyState createState() => __LoginBodyState();
}

class __LoginBodyState extends State<_LoginBody> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();

  bool _showPassword = true;

  String _phone = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Expanded(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          EasyLocalization.of(context).locale =
                              Locale('ne', 'NP');
                        });
                      },
                      child: Text('Nepali'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          EasyLocalization.of(context).locale =
                              Locale('en', 'US');
                        });
                      },
                      child: Text('English'),
                    )
                  ],
                ),
                Container(
                  child: ClipPath(
                    child: Container(
                      height: height / 2.25,
                      width: width,
                      color: primaryColor,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              elevation: 0,
                              child: SizedBox(
                                height: width / 3.5,
                                width: width / 1.5,
                                child: Image.asset('images/logo.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    clipper: BottomWaveClipper(),
                  ),
                ),
                Center(
                  child: Text(
                    'LOGIN TO ACCOUNT'.tr().toString(),
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _phoneField(),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _passwordField(),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: width * 0.6,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'LOG IN'.tr().toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
//                      if (_phone.isEmpty) {
//                        return;
//                      }
//
//                      if (_password.isEmpty) {
//                        return;
//                      }

                      //login(context, _email, _password, db, _isChecked);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have a account? ".tr().toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ButtonWithIcons(
                      label: 'Register'.tr().toString(),
                      backGroundColor: Colors.white,
                      foreGroundColor: primaryColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneField() => Form(
        key: _phoneFormKey,
        child: TextFormField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          initialValue: _phone,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_phone_mobile_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Mobile Number".tr().toString(),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          autovalidate: true,
          validator: (value) {
            if (value.isEmpty) {
              return 'Empty Field!'.tr().toString();
            }
            if (value.length < 10) {
              return 'Minimum 10 Digit Required!';
            }
            return null;
          },
          onChanged: (value) => _phone = value,
        ),
      );

  Widget _passwordField() => Form(
        key: _passwordFormKey,
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          maxLines: 1,
          initialValue: '',
          obscureText: _showPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_lock_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Password".tr().toString(),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword
                    ? FluentSystemIcons.ic_fluent_eye_hide_filled
                    : FluentSystemIcons.ic_fluent_eye_show_filled,
                color: _showPassword ? Colors.grey : primaryColor,
              ),
            ),
          ),
          autovalidate: true,
          validator: (value) {
            if (value.isEmpty) {
              return 'Empty Field!'.tr().toString();
            }
            if (value.length < 6) {
              return 'At Least 6 Character Required!';
            }
            return null;
          },
          onChanged: (value) => _password = value,
        ),
      );
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 80.0);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 80.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

//    var secondControlPoint =
//        Offset(size.width - (size.width / 3.25), size.height - 65);
//    var secondEndPoint = Offset(size.width, size.height - 40);
//    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//        secondEndPoint.dx, secondEndPoint.dy);

    //path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
