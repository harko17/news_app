import 'package:flutter/material.dart';
import 'package:news_api_app/components/customListTile.dart';
import 'package:news_api_app/model/article_model.dart';
import 'package:news_api_app/services/api_service.dart';
String val="Health";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
ApiService client = ApiService();

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("First Light News 💡", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent,

        actions: [
          PopupMenuButton(
            tooltip: 'Select News Category',
            // icon: Icon(Icons.book)
              itemBuilder: (context){

                return [

                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Business"),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Entertainment"),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Health"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Science"),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text("Sports"),
                  ),
                  PopupMenuItem<int>(
                    value: 5,
                    child: Text("Technology"),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  setState(() {
                    val = "Business";
                    news(val);
                  });
                }else if(value == 1){
                  setState(() {
                    val = ("Entertainment");
                     news(val);
                  });

                }else if(value == 2){
                  setState(() {
                    val = ("Health");
                    news(val);
                  });

                }
                else if(value == 3){
                  setState(() {
                    val = ("Science");
                    news(val);
                  });

                }
                else if(value == 4){
                  setState(() {
                    val = ("Sports");
                    news(val);
                  });

                }
                else if(value == 5){
                  setState(() {
                    val = ("Technology");
                    news(val);
                  });

                }
              }
          ),

        ],
      ),
      body:
      Container(

        child:

        StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            if(5<6)
            return news(val);
            else
            return Center(child: CircularProgressIndicator());
          }
        ),
      ),
    );
  }
}

Widget news(val)
{
  return FutureBuilder(
    future: client.getArticle(val),
    builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
      if (snapshot.hasData) {
        List<Article>? articles = snapshot.data;
        return ListView.builder(
            itemCount: articles!.length,
            itemBuilder: (context, index) => customListTile(articles[index], context)
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget choice()
{
  return  Padding(
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
    child: Wrap(
      // space between chips
        spacing: 10,
        // list of chips
        children: const [
          Chip(
            label: Text('Working'),
            avatar: Icon(
              Icons.work,
              color: Colors.red,
            ),
            backgroundColor: Colors.amberAccent,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          Chip(
            label: Text('Music'),
            avatar: Icon(Icons.headphones),
            backgroundColor: Colors.lightBlueAccent,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          Chip(
            label: Text('Gaming'),
            avatar: Icon(
              Icons.gamepad,
              color: Colors.white,
            ),
            backgroundColor: Colors.pinkAccent,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          Chip(
            label: Text('Cooking & Eating'),
            avatar: Icon(
              Icons.restaurant,
              color: Colors.pink,
            ),
            backgroundColor: Colors.greenAccent,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          )
        ]),
  );
}