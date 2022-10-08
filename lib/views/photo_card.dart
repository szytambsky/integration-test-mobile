import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoCell extends StatelessWidget {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoCell({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      padding: EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   child: ColoredBox(color: Colors.amber),
          //   width: 180,
          //   height: 180,
          // ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(this.thumbnailUrl), fit: BoxFit.fill),
            ),
            width: 152,
            height: 152,
          ),
          // 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360'),
          // DecoratedBox(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: NetworkImage(
          //             'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360')),
          //   ),
          // ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'id: ${id}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ),
                SizedBox(height: 4),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // return ListTile(
    //   title: Text('${title}'),
    //   subtitle: Text('${id}'),
    // );
  }
}

class PhotoCard extends StatelessWidget {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoCard({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 19,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text('${id}'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text('${albumId}'),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
