import 'package:dailymeals/models/meal.dart';
import 'package:dailymeals/screens/categories_screen.dart';
import 'package:dailymeals/screens/favourite_screen.dart';
import 'package:dailymeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class tabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const tabsScreen({Key key, this.favouriteMeals}) : super(key: key);

  @override
  _tabsScreenState createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {
        'page': FavouriteScreen(
          favouriteMeals: widget.favouriteMeals,
        ),
        'title': 'Your Favourite'
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: mainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favourites")
        ],
      ),
    );
  }
}
