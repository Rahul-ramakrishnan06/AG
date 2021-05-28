
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

final _controller = PageController(
  
  initialPage:0, 
  
  );

  int _currentPage = 0;
 
  List<Widget> _pages=[
    
    Column(
      children: [
         
        Expanded(child: Image.asset('images/address.png')),
        Text('Set Your Delivery Location', style:TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign:TextAlign.center),
      ],
      ),
  
      Column(
    children: [

      Expanded(child: Image.asset('images/ordered.png')),
      Text('Order from Your Favourite Store', style:TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign:TextAlign.center),
    ],
    ),
      Column(
    children: [

      Expanded(child: Image.asset('images/delivery.png')),
       Text('Fast Delivery At Your Doorstep', style:TextStyle(fontSize: 25,fontWeight: FontWeight.w700),textAlign:TextAlign.center
      ),
    ],
    ), 
  ];


  

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      
          child: Column(
                
                children:[
                   Expanded(
                     child: PageView(
                     controller:_controller,
                     children:_pages,
                     onPageChanged:(index){
                       setState(() {
                         
                       _currentPage=index;

                       });

                       // ignore: deprecated_member_use
                       

                     }

          ),
                   ),
                   SizedBox(height:20),
                   DotsIndicator(
                        dotsCount: _pages.length,
                         position: _currentPage.toDouble(),
                         decorator: DotsDecorator(
                         size: const Size.square(9.0),
                         activeSize: const Size(18.0, 9.0),
                         activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                         activeColor: Colors.green
                     ),
),
            SizedBox(height:20),
          ],
        ),
    );
    
  }
}