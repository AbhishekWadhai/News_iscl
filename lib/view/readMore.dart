import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class ReadMorePage extends StatefulWidget {

  String newsUrl;

  ReadMorePage({super.key, required this.newsUrl});

  @override
  State<ReadMorePage> createState() => _ReadMorePageState();
}

class _ReadMorePageState extends State<ReadMorePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  WebView(
        initialUrl: widget.newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

