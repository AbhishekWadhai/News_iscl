import 'package:flutter/material.dart';
import 'package:news_incl/Model/newsArticles.dart';
import 'package:news_incl/controller/fetchNews.dart';
import 'package:news_incl/widgets/news_container.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static List<String> categories = [
    'all',
    'national',
    'business',
    'sports',
    'world',
    'politics',
    'technology',
    'startup',
    'entertainment',
    'miscellaneous',
    'hatke',
    'science',
    'automobile'
  ];

  static var currentCategory = categories[1];
  List<MenuItemButton> getMenuChildren(){
    List<MenuItemButton> menuItems = [];
    for(String category in categories){
      //print(category);
      var newMenu = MenuItemButton(
        onPressed: (){
          setState(() {
            currentCategory = category;
            print(currentCategory);
          });

        },
        child: Text(category),
      );
      print(currentCategory);
      menuItems.add(newMenu);
    }
    return menuItems;
  }

  late NewsArticles newsArticles;
  bool isLoading = true;
  late PageController pageController;
  getNews() async{
    newsArticles = await FetchNews.fetchNews(currentCategory);
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    getMenuChildren();
    return Scaffold(

      body: PageView.builder(

        controller: pageController,
        onPageChanged: (int page) {
          setState(() {
            isLoading = true;
          });
          getNews();
        },
        scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
          return isLoading ? Center(
            child: CircularProgressIndicator(),) : Stack(
              children: [
                NewsContainer(
                      imgUrl: newsArticles.imgUrl,
                      newsHeading: newsArticles.newsHeadline,
                      date: newsArticles.date,
                      newsDesc: newsArticles.newsDesc,
                      newsUrl: newsArticles.newsUrl),
                MenuBar(
                  style: MenuStyle(),
                  
                      children: [
                        SubmenuButton(
                        menuChildren: getMenuChildren(),
                        child: Text('$currentCategory'.toUpperCase(),
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                        ),
            ],

            ),


              ],
            );
        }),

    );
  }
}
