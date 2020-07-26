import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolling_international/constants.dart';
import 'package:rolling_international/home.dart';
import 'package:rolling_international/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

class SplashScreenRolling extends StatefulWidget {
  @override
  _SplashScreenRollingState createState() => _SplashScreenRollingState();
}

class _SplashScreenRollingState extends State<SplashScreenRolling> {
  SharedPreferences _preferences;

  @override
  void initState() {
    _loadPreference();
    super.initState();
  }

  _loadPreference() async {
    _preferences = await SharedPreferences.getInstance();
    _pageRouting(context, _preferences);
  }

  @override
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
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: primaryColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: width,
              //color: colors.primaryColor,
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
          Column(
            children: <Widget>[
              Text(
                'Copyright © '
                '${DateTime.now().year}'
                ' Rolling Plans Pvt. Ltd.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: primaryText,
                ),
              ),
              const Text(
                'Version 1.0.0',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: primaryText,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

void _pageRouting(BuildContext context, SharedPreferences preferences) {
  Timer(
    Duration(seconds: 1),
    () {
      bool logged = preferences.getBool(PREF_IS_LOGGED) ?? false;
      if (logged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    },
  );
}
