import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/ui/news_web_page_views.dart';
import 'package:news_app/ui/web_view_example.dart';
import 'package:news_app/utils/timeago.dart';

class NewsDetailScreen extends StatefulWidget {
  final String title;
  final String sourceName;
  final String author;
  final String publishedAt;
  final String imageUrl;
  final String description;
  final String content;
  final String url;
  const NewsDetailScreen({
    super.key,
    required this.title,
    required this.sourceName,
    required this.author,
    required this.publishedAt,
    required this.imageUrl,
    required this.description,
    required this.content,
    required this.url,
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details News")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.sourceName, style: TextStyle(fontSize: 25)),
                  Spacer(),
                  Text(
                    formatTimeAgo(DateTime.parse(widget.publishedAt)),
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),

              widget.imageUrl != "No image"
                  ? Image(image: NetworkImage(widget.imageUrl))
                  : Image(image: AssetImage("assets/image.png")),

              Text(
                widget.title,
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(widget.author, style: TextStyle(fontSize: 20)),
              Text(
                widget.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                widget.content,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "For More Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WebViewExample(url: widget.url,),
                    ),
                  );
                },
                child: Text('Read Full News'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
