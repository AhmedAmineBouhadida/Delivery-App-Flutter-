import 'package:flutter/material.dart';
import 'package:helloworld/components/my_receipt.dart'; 

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress ..."),
        backgroundColor: Colors.transparent,
      ),

      bottomNavigationBar: _buildBottomNavBar(context),

      body: Column(
        children: [
          MyReceipt(),
        ],
      ),

    );
  }

  // Custom bottom NAV BAR - message ,  call , delivery driver :  
  Widget _buildBottomNavBar(BuildContext context)
  {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),

    padding: const EdgeInsets.all(25),

      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: (){}, icon: Icon(Icons.person),
            ),
          ), 

          const SizedBox(width: 10),

          // Driver details 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Amine Bouhadida" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 , color: Theme.of(context).colorScheme.inversePrimary),), 
              Text("Driving" ,  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14 , color: Theme.of(context).colorScheme.inversePrimary),)
            ],
          ),

        const SizedBox(width: 50),
          // message button 
          Row(

            children: [

              // Message button 
               Container(
               decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                   shape: BoxShape.circle,
               ),
                child: IconButton(
              onPressed: (){}, icon: Icon(Icons.message),
            ),
          ), 

          const SizedBox(width: 10),

           Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: (){}, icon: Icon(Icons.call ,color: Colors.green,) ,
            ),
          ), 
            ],
          )


        ],
      ),
    );
  }

}