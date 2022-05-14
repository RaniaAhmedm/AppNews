import 'package:app_news/home-screen/categories/categories-fragment.dart';
import 'package:app_news/home-screen/home-side-menu.dart';
import 'package:app_news/model/category.dart';
import 'package:flutter/material.dart';
import '../api-manager.dart';
import '../model/NewsResponse.dart';
import 'category-details/category-details.dart';
import 'news/news-item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background_pattern.png'),
          )),
      child: Scaffold(
        key: key,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.view_list,
              color: Colors.white,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: NewsSearch());
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                )),
          ],
          backgroundColor: Color.fromRGBO(57, 165, 82, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
          centerTitle: true,
          title: Text(
            'News App',
          ),
        ),
        drawer: Drawer(
          child: HomeSideMenu(
            onItemClicked: onSideMenuClicked,
          ),
        ),
        body: categorySelected == null
            ? CategoriesFragment(onCategoryClicked)
            : CategoryDetails(
                category: categorySelected!,
              ),
      ),
    );
  }

  Category? categorySelected = null;
  void onCategoryClicked(Category category) {
    print(category.title);
    categorySelected = category;
    setState(() {});
  }

  void onSideMenuClicked(String itemName) {
    Navigator.pop(context);
    if (itemName == HomeSideMenu.settings) {
    } else if (itemName == HomeSideMenu.categories) {
      categorySelected = null;
      setState(() {});
    }
  }
}

class NewsSearch extends SearchDelegate {
  late Future<NewsResponse> newsResponse;
  NewsSearch(){
    newsResponse=ApiManager.getNews(searchKeyword: query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
    IconButton(
        onPressed: () {
          newsResponse=ApiManager.getNews(searchKeyword: query);
         showResults(context);

        },
        icon: Icon(
          Icons.search,
          color: Color.fromRGBO(57, 165, 82, 1.0),
        )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          color: Color.fromRGBO(57, 165, 82, 1.0),
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<NewsResponse>(
        builder: (context, snapshot) {
          //in case loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //  in case has error
          else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text('Something went Wrong'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Try Again'),
                  )
                ],
              ),
            );
          }
          //in case status != 'ok'
          else if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ""),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Try Again'),
                )
              ],
            );
          }
          //in case has data
          List<Article> articlesList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(article: articlesList[index]);
            },
            itemCount: articlesList.length,
          );
        },
        future: newsResponse,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Container(
     width: double.infinity,
     height: double.infinity,
     color: Colors.white,
     child: Text('Suggestion'),
   );
  }
}
