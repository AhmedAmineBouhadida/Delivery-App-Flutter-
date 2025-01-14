import 'package:flutter/material.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_cart_tile.dart';
import 'package:helloworld/models/card_item.dart';
import 'package:helloworld/models/restaurant.dart';
import 'package:helloworld/pages/payment_page.dart';
import 'package:provider/provider.dart'; 

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context,restaurant,child){
      //cart
      final userCart = restaurant.cart; 
      //scaffold UI :  
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // clear all cart : 
            IconButton(onPressed: (){
              showDialog(
                context: context , 
                builder: (context) => AlertDialog(
                  title: const Text("Are you sure you want to clear the cart ? "),
                  actions: [
                    //cancel button 
                  TextButton(
                    onPressed: ()=> Navigator.pop(context), child: Text("Cancel"),
                  ),

                    //yes button
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      restaurant.clearCart();
                    }, child: Text("Yes"),
                  ),

                  ],
                ),
                );
            }, 
            icon: const Icon(Icons.delete), 
            ),
          ],
        ),
        body: Column(
          children: [

            // List of cart 
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ? const Expanded(child: Center(child: Text("Cart is empty"))) :
                Expanded(
                  child: ListView.builder(
                    itemCount: userCart.length,
                    // return cart rile UI 
                    itemBuilder: (context , index ) {
              
                      // get individual cart item : 
                      final cartItem = userCart[index]; 
                      
                      // return cart tile UI 
                     return MyCartTile(cartItem: cartItem);
                    },
                  ),
                ),
              ],),
            ),

            // Button to pay 
            MyButton(text: "Pay now !", 
            onTap: () => Navigator.push(context , MaterialPageRoute(builder: (context) => const PaymentPage()))) , 
            const SizedBox(height: 35),
          ],
        ),
      );
    },);
  }
}