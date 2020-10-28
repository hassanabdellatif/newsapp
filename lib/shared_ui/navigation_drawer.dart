// ignore: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/facebook_feed.dart';
// ignore: unused_import
import 'package:news_app/utilities/app_utilities.dart';
import 'package:news_app/screens/pages/login.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {


  List<NavMenuItem> navigationMenu = [
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('HeadlineNews', () => HeadlineNews()),
    NavMenuItem('Twitter Feeds', () => TwitterFeed()),
    NavMenuItem('Instagram Feeds', () => InstagramFeed()),
    NavMenuItem('Facebook Feeds', () => FacebookFeeds()),
    NavMenuItem("Login", () => Login()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 75, left: 24),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                navigationMenu[position].title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 22,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return navigationMenu[position].destination();
                    },
                  ),
                );
              },
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
