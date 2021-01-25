import 'package:flutter_animation/Model/Dish.dart';
import 'package:flutter_animation/Model/Restaurant.dart';

class DataHelper {
  static List<Dish> getDishes() {
    return [
      Dish(icon: "🍔", name: "Burger"),
      Dish(icon: "🍕", name: "Pizza"),
      Dish(icon: "🍟", name: "Snack"),
      Dish(icon: "🍣 ", name: "Sushi"),
      Dish(icon: "🍛 ", name: "Biryani"),
    ];
  }

  static List<Restaurant> getRestaurants() {
    return [
      Restaurant(
          "Cream 'N' Crust Café",
          "https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_960_720.jpg",
          "https://image.freepik.com/free-vector/ice-cream-logo-emblem_9845-102.jpg",
          4.3,
          "Bakery • Desserts • ",
          "\$\$"),
      Restaurant(
          "Burger King",
          "https://b.zmtcdn.com/data/pictures/chains/9/3800929/5eccc92c862900b7655250cd8358bd13.jpg",
          "https://logospng.org/download/burger-king/logo-burger-king-512.png",
          4.1,
          "Burger • Beverages • ",
          "\$"),
      Restaurant(
          "The Good Bowl",
          "https://b.zmtcdn.com/data/pictures/chains/6/19131856/ae42ee0a49892af3433a2e4e1b21ef1d.jpg",
          "https://image.freepik.com/free-vector/ice-cream-logo-emblem_9845-102.jpg",
          4.6,
          "Biryani • Rice Bowls • ",
          "\$\$"),
    ];
  }
}
