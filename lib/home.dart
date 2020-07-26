import 'dart:async';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rolling_international/colors.dart';
import 'package:rolling_international/profile_drawer.dart';

import 'job_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  bool _isAdding = false;

  Future<void> _loadjobs() {
    Timer(
      Duration(seconds: 5),
      () {
        print('List Data Added!');
        if (mounted)
          setState(() {
            if (mounted)
              setState(() {
                _isAdding = false;
              });
          });
        return true;
      },
    );
  }

  _loadMoreJobs() async {
    if (mounted)
      setState(() {
        _isAdding = true;
      });
    Timer(
      Duration(seconds: 5),
      () {
        print('List Data Added!');
        if (mounted)
          setState(() {
            if (mounted)
              setState(() {
                _isAdding = false;
              });
          });
      },
    );
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'Rolling International',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              FluentSystemIcons.ic_fluent_person_regular,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      //drawer: ProfileDrawer(),
      drawer: ProfileDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _loadjobs(),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification s) {
            if (!_isAdding && s.metrics.pixels == s.metrics.maxScrollExtent) {
              if (!_isAdding) _loadMoreJobs();
              return true;
            } else {
              return false;
            }
          },
          child: Column(
            children: <Widget>[
              _isAdding
                  ? SizedBox(
                      height: 4,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.amberAccent.withOpacity(0.4),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.amberAccent,
                        ),
                      ),
                    )
                  : SizedBox(),
              (!_isLoading)
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => JobDetails(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: SizedBox(
                                        height: 60.0,
                                        width: 60.0,
                                        child: ClipRRect(
                                          child: Image.network(
                                            //'${job.employer_logo}',
                                            'https://www.rollingplans.com.np/'
                                            'image/catalog/logo_RPPL.png',
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              100.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        //'${job.title}',
                                        'Job Title',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                      subtitle: Text(
                                        //'${job.title}',
                                        'Job Description',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        8,
                                        0,
                                        8,
                                        16,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 4.0,
                                                ),
                                                child: Icon(
                                                  FluentSystemIcons
                                                      .ic_fluent_globe_location_filled,
                                                  size: 12.0,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                ' Nepal ',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 4.0,
                                                ),
                                                child: Icon(
                                                  FluentSystemIcons
                                                      .ic_fluent_briefcase_filled,
                                                  size: 12.0,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                ' Services ',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 4.0,
                                                ),
                                                child: Icon(
                                                  FluentSystemIcons
                                                      .ic_fluent_people_team_filled,
                                                  size: 12.0,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                ' 35 ',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
