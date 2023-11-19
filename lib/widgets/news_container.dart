import 'package:flutter/material.dart';
import 'package:news_incl/view/readMore.dart';
import 'package:http/http.dart' as http;

class NewsContainer extends StatelessWidget {

  String imgUrl;
  String newsHeading;
  String date;
  String newsDesc;
  String newsUrl;


  NewsContainer({super.key,
    required this.imgUrl,
    required this.newsHeading,
    required this.date,
    required this.newsDesc,
    required this.newsUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(placeholder: 'lib/assets/loading.jpg', image: imgUrl,
        height: 350,
        width:MediaQuery.of(context).size.width ,
        fit: BoxFit.cover,),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsHeading,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Text(date,
                  style: TextStyle(fontSize: 15, color: Colors.grey),),
                SizedBox(height: 10,),
                Text(newsDesc,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  print('Button pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadMorePage(newsUrl: newsUrl)));
                },
                    child: Text('Read More')),
              ),
            ],
          ),
          SizedBox()
        ],
      ),
    );
  }
}
