import 'package:flutter/material.dart';
import '../Pages/HomePage.dart';
import 'pagetwo.dart';
import 'pagethree.dart';
import 'pagefour.dart';



class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TvTab(),
    NotiTab(),
    PersonTab(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(backgroundColor: Colors.deepPurple,
        title: Container(
          height: 35,
          width: 250,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(20)
          ),
          child: Align(alignment: Alignment.centerRight,
            child: Icon(Icons.search,
                color: Colors.deepPurple),
          ),
        ),
        actions: [Icon(Icons.camera)],
      ),
      drawer: Drawer(),
      body: _widgetOptions.elementAt(selectedIndex),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,

            items:  <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,color: Colors.deepPurple,),
                    label: 'Home',
                    ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.live_tv),
                    label: 'Chat',
                    ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Favorite',
                    ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Person',
                    ),
                      ],


              type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        unselectedItemColor: Colors.deepPurple,
      ),

    );
  }
}




      




