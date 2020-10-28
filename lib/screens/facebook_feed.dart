import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class FacebookFeeds extends StatefulWidget {
  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  TextStyle _hashTagStyle = TextStyle(color: Colors.orange);

  List<int> ids = [];

  @override
  void initState() {
    super.initState();
    ids = [0, 2, 4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Feeds"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawHeader(position),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),
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

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                Text(
                  "Christina Meyers",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Fri, 12 May 2017 . 14.30'),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: () {
                setState(
                  () {
                    if (ids.contains(position)) {
                      ids.remove(position);
                    } else {
                      ids.add(position);
                    }
                  },
                );
              },
              color: (ids.contains(position))? Colors.red : Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Text(
        'We also talk about the future of work as the robots',
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _drawHashTags() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "#advance",
            style: _hashTagStyle,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "#retro",
            style: _hashTagStyle,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "#instagram",
            style: _hashTagStyle,
          ),
        ),
      ],
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image(
        image: ExactAssetImage('assets/images/placeholder_bg.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            '10 COMMENTS',
            style: _hashTagStyle,
          ),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text(
                'SHARE',
                style: _hashTagStyle,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'OPEN',
                style: _hashTagStyle,
              ),
            ),
          ],
        )
      ],
    );
  }
}
