import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolling_international/buttons.dart';

import 'colors.dart';
import 'login.dart';

class Register extends StatelessWidget {
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
      body: _RegisterBody(),
    );
  }
}

class _RegisterBody extends StatefulWidget {
  @override
  __RegisterBodyState createState() => __RegisterBodyState();
}

class __RegisterBodyState extends State<_RegisterBody> {
  final GlobalKey<FormState> _firstNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _middleNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lastNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _confirmPasswordFormKey = GlobalKey<FormState>();

  bool _showPassword = true;
  bool _showConfirmPassword = true;

  String _first = '';
  String _middle = '';
  String _last = '';
  String _phone = '';
  String _email = '';
  String _address = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: primaryColor,
      child: SingleChildScrollView(
        child: Container(
          height: height,
          color: Colors.white,
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  child: ClipPath(
                    child: Container(
                      height: height / 3,
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
                    'REGISTER AN ACCOUNT',
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
                  child: _firstNameField(),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _middleNameField(),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _lastNameField(),
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
                  child: _emailField(),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _addressField(),
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
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: _confirmPasswordField(),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
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
                            'Register',
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
                      if (_phone.isEmpty) {
                        return;
                      }

                      if (_password.isEmpty) {
                        return;
                      }

                      //login(context, _email, _password, db, _isChecked);
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
                      'Already have a account? ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ButtonWithIcons(
                      label: 'Login',
                      backGroundColor: Colors.white,
                      foreGroundColor: primaryColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstNameField() => Form(
        key: _firstNameFormKey,
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: 1,
          initialValue: _first,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_phone_mobile_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your First Name",
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
              return 'Empty Field!';
            }
            return null;
          },
          onChanged: (value) => _first = value,
        ),
      );

  Widget _middleNameField() => Form(
        key: _middleNameFormKey,
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: 1,
          initialValue: _middle,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_phone_mobile_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Middle Name",
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          onChanged: (value) => _middle = value,
        ),
      );

  Widget _lastNameField() => Form(
        key: _lastNameFormKey,
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: 1,
          initialValue: _last,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_phone_mobile_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Last Name",
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
              return 'Empty Field!';
            }
            return null;
          },
          onChanged: (value) => _last = value,
        ),
      );

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
            labelText: "Enter Your Mobile Number",
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
              return 'Empty Field!';
            }
            if (value.length < 10) {
              return 'Minimum 10 Digit Required!';
            }
            return null;
          },
          onChanged: (value) => _phone = value,
        ),
      );

  Widget _emailField() => Form(
        key: _emailFormKey,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          initialValue: _email,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_phone_mobile_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Email Address",
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          onChanged: (value) => _email = value,
        ),
      );

  Widget _addressField() => Form(
        key: _addressFormKey,
        child: TextFormField(
          keyboardType: TextInputType.text,
          maxLines: 1,
          initialValue: _address,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_phone_mobile_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Address",
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          onChanged: (value) => _address = value,
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
            labelText: "Enter Your Password",
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
              return 'Empty Field!';
            }
            if (value.length < 6) {
              return 'At Least 6 Character Required!';
            }
            return null;
          },
          onChanged: (value) => _password = value,
        ),
      );

  Widget _confirmPasswordField() => Form(
        key: _confirmPasswordFormKey,
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          maxLines: 1,
          initialValue: '',
          obscureText: _showConfirmPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(
              FluentSystemIcons.ic_fluent_lock_filled,
              color: primaryColor,
            ),
            labelText: "Enter Your Confirm Password",
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
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
            if (value.trim() != _password.trim()) {
              return 'Passwords do not match!';
            }
            return null;
          },
          onChanged: (value) => _confirmPassword = value,
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
