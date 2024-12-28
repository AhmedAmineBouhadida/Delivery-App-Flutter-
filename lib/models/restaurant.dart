import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'card_item.dart';
import 'food.dart'; 


class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [

    // burger 
    Food(
      name: "Classic CheeseBurger", 
      description: "A juicy beef patty with melted cheddar , lettuce , tomato , and a hint of onion and picle. ", 
      imagePath: "lib/images/burgers/b1.jpeg", 
      price: 5.99 ,
       category: FoodCategory.burgers, 
       availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
       ],
        ),

      // Salads :  
          Food(
      name: "Salad ", 
      description: "A good salad  ", 
      imagePath: "lib/images/salads/s1.jpeg", 
      price: 3.99 ,
       category: FoodCategory.salads, 
       availableAddons: [
       ],
        ),

      // Drinks 

          Food(
      name: "Drink", 
      description: "A juicy drink", 
      imagePath: "lib/images/drinks/drink.jpg", 
      price: 7.99 ,
       category: FoodCategory.drinks, 
       availableAddons: [
        Addon(name: "ice", price: 0.99),
       ],
        ),

      // Desserts 

      Food(
      name: "Chees Cacke", 
      description: "A strawberry cheese cacke ", 
      imagePath: "lib/images/desserts/dessert.jpg", 
      price: 6.99 ,
       category: FoodCategory.desserts, 
       availableAddons: [
        ],
        ),
  ];

  /* Getters */ 

  List<Food> get menu => _menu; 
  List<CartItem> get cart => _cart ; 


  /* Operations */ 

  // user cart 
  final List<CartItem> _cart = [];

  void addToCart(Food food , List<Addon> selectedAddons){
    // see if there is a cart item alerady with the same food and selected addons :  
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      //check if the food items are the same 
      bool isSameFood = item.food == food ; 

      // chek if the list of the selected items is the same 
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    }); 

    // if item aleready exists increase it's quantity 
    if(cartItem != null){
      cartItem.quantity ++ ; 
    }

    // otherwise add new cart item  
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  /*  remove from cart */ 

void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex != -1) {
    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

// Get total price of cart : 
double getTotalPrice(){
  double total = 0.0 ; 
  for(CartItem cartItem in _cart){
    double itemTotal = cartItem.food.price ; 

    for(Addon addon in cartItem.selectedAddons){
      itemTotal += addon.price; 
    }

    total += itemTotal * cartItem.quantity ; 
  }
  return total ; 
}

// get total number of items in cart
int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }

  return totalItemCount;
}

// clear cart
void clearCart() {
  _cart.clear();
  notifyListeners();
}

// Generate receipt : 

String displayCartReceipt()
{
  final receipt = StringBuffer();

  receipt.writeln("Here's your receipt .") ; 
  receipt.writeln(); 

  // format the date to include up to seconds only : 
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()); 

  receipt.writeln(formattedDate); 
  receipt.writeln(); 
    receipt.writeln("-----------"); 

  for (final cartItem in _cart){
    receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
    if(cartItem.selectedAddons.isNotEmpty){
      receipt.writeln("    Addons : ${_formatAddons(cartItem.selectedAddons)}");
    }
    receipt.writeln();
  }

    receipt.writeln("-----------");
    receipt.writeln(); 
    receipt.writeln("Total Items : ${getTotalItemCount()}"); 
    receipt.writeln("Total Price : ${_formatPrice(getTotalPrice())}"); 

  return receipt.toString();

}

// format double value into money : 
String _formatPrice(double price)
{
  return "\$${price.toStringAsFixed(2)}";
}

// format list of addons into string summuary : 

String _formatAddons(List <Addon> addons)
{
  return addons 
  .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
  .join(", ");
}


}