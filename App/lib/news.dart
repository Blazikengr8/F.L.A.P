import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flap/goals.dart';
import 'package:flap/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'newsweb.dart';

final String base_url ="https://newsapi.org/v2/";
final String key1 = "5ccdf373158c417f81d1535310b444ec";
class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:
        Column(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child:
              Container(
                  color: Colors.white,
                  child:
                  GestureDetector(
                    child:
                    new FutureBuilder<List<News>>(
                      future: fatchNews(
                          http.Client()),
                      builder: (context,snapshot){
                        if(snapshot.hasError)print(snapshot.error);

                        return snapshot.hasData
                            ? NewsList(news: snapshot.data)
                            : Center(child:ImageRotate());
                      },
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
Future<List<News>> fatchNews(http.Client client) async {
  String url;
    url = base_url + "everything?q=premierleague&language=en&apiKey=" + key1;

  final response = await client.get(url);
  return compute(parsenews, response.body);
}
List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

class News {
  String auther;
  String title;
  String description;
  String url;
  String imgurl;

  News({this.auther, this.title, this.description, this.url, this.
  imgurl, image});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imgurl:json['urlToImage'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Center(
            child: new Card(
              color: Colors.yellowAccent,
              child: Container(
                height: 100,
                child: new ListTile(
                  leading:
                  CachedNetworkImage(
                    imageUrl: news[index].imgurl,
                    placeholder: (context, url) => CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(55, 0, 60, 1)),
                    ),
                    errorWidget: (context, url, error) => Padding(padding: EdgeInsets.all(20),child: Icon(FontAwesomeIcons.newspaper,size: 50,color: Color.fromRGBO(55, 0, 60, 1),)),
                  ),
                  title: Text(news[index].title,style: plStyle,),

                  onTap: () {
                    var url = news[index].url;
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new DescriptionPage(url),
                        ));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}