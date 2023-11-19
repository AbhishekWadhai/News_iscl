import 'dart:math';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:news_incl/Model/newsArticles.dart';


class FetchNews{

  static Future<NewsArticles> fetchNews(String category) async{
    print(category);


    Response response = await get(Uri.parse('https://inshortsapi.vercel.app/news?category=$category'));

    Map body_data = jsonDecode(response.body);
    List data = body_data['data'];
    //print(data);
    final random = new Random();
    var myData = data[random.nextInt(data.length)];
    print(myData);

    return NewsArticles.fromAPItoApp(myData);
  }
}