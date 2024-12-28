import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/models/food.dart'; 
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // Initialize Selected Addons to be false:
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // Fermer le dialogue ou la fenêtre actuelle
    Navigator.pop(context);

    // Initialiser la liste des addons sélectionnés
    List<Addon> currentlySelectedAddons = [];

    // Parcourir les addons disponibles et ajouter ceux qui sont sélectionnés
    for (Addon addon in food.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // Ajouter l'élément au panier via le modèle Restaurant
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Food image
            Image.asset(widget.food.imagePath),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food name
                  Text(
                    widget.food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  // Food price
                  Text(
                    "${widget.food.price} DT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Food description
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Divider(color: Theme.of(context).colorScheme.primary),

                  Text(
                    "ADD-ONS",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Add-ons
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // Get individual addon
                        Addon addon = widget.food.availableAddons[index];

                        // Return checkbox tile UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text("${addon.price} DT"),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Button -> Add to cart
            MyButton(
              text: "Add to cart",
              onTap: () => addToCart(widget.food, widget.selectedAddons),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
