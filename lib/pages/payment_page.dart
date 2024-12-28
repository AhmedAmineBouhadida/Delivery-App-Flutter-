import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:helloworld/components/my_button.dart';
import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>(); 

  String cardNumber = '' ;
  String expiryDate = '' ;
  String cardHolderName = '' ;
  String cvvCode= '' ;
  bool isCvvFocused = false ; 


// user wants to pay :  
void userTappedPay(){
  if (formkey.currentState!.validate()){
    //only show dialiog that form is valid :  
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text("Confirm Payement ? "),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("CardNumber : $cardNumber"),
              Text("ExpiryDate : $expiryDate"),
              Text("Card Holder Name : $cardHolderName"),
              Text("CVV : $cvvCode"),              
            ],
          ),
        ),
        actions: [

          // cancel button 

          TextButton(
          onPressed: () => Navigator.pop(context), 
          child: const Text("Cancel"),
          ),  

          // yes button : 
        TextButton(
          onPressed: () => Navigator.push
          (context, 
          MaterialPageRoute(
            builder: (context) => DeliveryProgressPage() , 
            ),
            ),
             child: Text("Yes")),


        ],
      ),);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),

      body: Column(
        children: [

          // credit cart widget :  

          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName,
             cvvCode: cvvCode, 
             showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {} , 
              ),

          // credit cart form 
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate,
             cardHolderName: cardHolderName, 
             cvvCode: cvvCode,
              onCreditCardModelChange: (data){
                setState(() {
                  cardNumber = data.cardNumber ; 
                  expiryDate = data.expiryDate ; 
                  cardHolderName = data.cardHolderName ; 
                  cvvCode = data.cvvCode ; 
                });
              }, 
              formKey: formkey, 
              ),
            const Spacer(),

            MyButton(
            text: "Pay Now", 
            onTap: userTappedPay,
            ),
        ],
      ),
    );
  }
}