import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rolling_international/buttons.dart';
import 'package:rolling_international/colors.dart';

import 'Profiledetail.dart';

class ProfileDrawer extends StatefulWidget {
  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: primaryColor,
      child: SizedBox(
        width: width * 0.7,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 18.0,
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: width * 0.175,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      child: Image.asset(
                        'images/logo.png',
                        height: width * 0.175,
                        width: width * 0.175,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                new Container(
                  height: 427,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.work,
                                    color: primaryColor,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Text(
                                            'App developer at Rolling plans'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.school,
                                    color: primaryColor,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Text('Went to BMC'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.cake,
                                    color: primaryColor,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Text('Born on 10/10/1997'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.home,
                                    color: primaryColor,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        child: Text('From Rautahat'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 20.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[],
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 15.0,
                          ),
                          child: ButtonWithIcons(
                            label: 'Update Profile',
                            backGroundColor: primaryColor,
                            foreGroundColor: Colors.white,
                            leadingIcon: Icon(
                              FluentSystemIcons.ic_fluent_edit_filled,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _status = false;
                              });
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          child: ButtonWithIcons(
                            label: 'Log Out',
                            backGroundColor: primaryColor,
                            foreGroundColor: Colors.white,
                            leadingIcon: Icon(
                              FluentSystemIcons.ic_fluent_sign_out_filled,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 0.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
