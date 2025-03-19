import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnflutter/models/meal.dart';
class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier():super([]);
  bool toggleMealFavoriteStatus(Meal meal){
    final isExisting = state.contains(meal);
    state = isExisting ? state.where((m)=> m.id != meal.id).toList() : [...state, meal];
    return isExisting ? false : true;
    /*if(isExisting){
      state = state.where((m)=>m.id != meal.id).toList() : [];
    }else{
      state = [...state, meal];
    }*/
  }
}
final favoritesProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});