import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget loading() {
  return Center(
    child: Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: CircularProgressIndicator(),
    ),
  );
}

Widget connectionError() {
  return Center(
    child: Container(
      padding: EdgeInsets.all(16),
      child: Text("Connection Error!!!!"),
    ),
  );
}

Widget error(var error) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(16),
      child: Text(error.toString()),
    ),
  );
}

Widget noData() {
  return Center(
    child: Container(
      padding: EdgeInsets.all(16),
      child: Text("No Data Available!"),
    ),
  );
}

String parseHumanDateTime(String dateTime) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);
  return timeago.format(theDifference);
}