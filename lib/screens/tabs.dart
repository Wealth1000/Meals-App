import 'package:flutter/material.dart';
import 'package:learnflutter/models/meal.dart';
import 'package:learnflutter/screens/categories.dart';
import 'package:learnflutter/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    isExisting ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
  }

  void selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: [],
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
