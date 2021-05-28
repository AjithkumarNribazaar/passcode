import 'package:flutter/material.dart';
import 'package:passcode/pages/home_page.dart';
import 'package:passcode/total/total_page.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  List<Widget>_widgetOptions =<Widget>[
    MyHomePage(),
    TotalPage(),
    Text("Search Date")
  //  SearchPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.view_day),
            title:Text("Today"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_view_month),
            title:Text("Total"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
            title:Text("Search"),
            backgroundColor: Colors.blue,
          ),

        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
    );

  }
}
