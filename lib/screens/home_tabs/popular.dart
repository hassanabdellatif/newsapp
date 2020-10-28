import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_utilities.dart';
// ignore: unused_import
import 'dart:async';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsAPI postsAPI = PostsAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsAPI.fetchPopular(),
      // ignore: missing_return
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {
              return error(snapShot.error);
            } else {
              List<Post> posts = snapShot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    child: _drawSingleRow(posts[position]),
                  );
                },
                itemCount: posts.length,
              );
            }
            break;
        }
      },
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SinglePost(post);
              },
            ),
          );
        },
        child: Row(
          children: [
            SizedBox(
              child: Image(
                image: NetworkImage(post.urlToImage),
                fit: BoxFit.cover,
              ),
              width: 125,
              height: 125,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    post.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Michael Adams'),
                      Row(
                        children: [
                          Icon(Icons.timer),
                          Text(parseHumanDateTime(post.publishedAt)
                              .substring(0, 11)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
