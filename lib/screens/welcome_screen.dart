
import 'package:flutter/material.dart';

import 'onboard_screen.dart';



class WelcomeScreen extends StatelessWidget {

 @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              right: 0.0,
              // ignore: deprecated_member_use
              child:FlatButton(
                child: Text('SKIP',style: TextStyle(color: Colors.green),),
                onPressed: (){},
              ),
               ),
            Column(
          children:[
           Expanded(child: OnBoardScreen(),),
          Text('Ready to order from your nearest shop?',style: TextStyle(color: Colors.grey),),
          SizedBox(height:20),
          // ignore: deprecated_member_use
          FlatButton(
            color:Colors.green,
             child: Text('SET DELIVERY LOCATION',style: TextStyle(color: Colors.white),),
             onPressed: (){},

          ),
         // ignore: deprecated_member_use
         FlatButton(

          child:  RichText(text: TextSpan(

         
          text: 'Already a Customer ?  ',style:TextStyle(color: Colors.grey),
          
          children: [
            TextSpan(
              text:'Login',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green)
            ),
          ] ,

          ),
          ),
          onPressed: (){
           
           Navigator.pushNamed(context,'/second' );

          },
         ),
          ],
        ),
     
          ],
        )
        
         ),
      
    );
  }
}