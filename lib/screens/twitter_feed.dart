import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                children: [
                  _cardHeader(),
                  _cardBody(),
                  _drawLine(),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
      drawer: NavigationDrawer(),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage:
                ExactAssetImage('assets/images/placeholder_bg.png'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hassan Ahmed",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "@ha_ahmed",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('Fri, 29 May 2020 . 09.46'),
          ],
        )
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text(
        "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
        style: TextStyle(
          fontSize: 16,
          height: 1.25,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  size: 28,
                 ),
                onPressed: () {},
                color: Colors.orange,
              ),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  "SHARE",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "OPEN",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16),
    );
  }
}
