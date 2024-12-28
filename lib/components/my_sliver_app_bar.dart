import 'package:flutter/material.dart';
import 'package:helloworld/pages/cart_page.dart'; 

class MySliverAppBar extends StatelessWidget {

  final Widget child ; 
  final Widget title ; 

  const MySliverAppBar({
    super.key , 
    required this.child , 
    required this.title ,
     });

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            // navigate to cart page : 
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CartPage(),
              ),
              );
          }, 
        icon: const Icon(Icons.shopping_cart)), 
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Sunset dinner") ,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only( bottom: 50.0),
          child: child,
        ) ,
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left : 0 , right: 0 , top : 0 ) ,
        expandedTitleScale: 1 ,
      ),
    );
  }
}