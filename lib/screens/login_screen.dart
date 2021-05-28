
import 'package:ag/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';





enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  MobileVerificationState currentstate =MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController =TextEditingController();
  final otpController =TextEditingController();

  FirebaseAuth _auth =FirebaseAuth.instance;
  
  String verificationId;

  bool showLoading =false;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    
    setState(() {
      showLoading=true;
    });

    try{
    final authCredential =await _auth.signInWithCredential(phoneAuthCredential);
         
     setState(() {
       showLoading=false;
     });

     if(authCredential?.user!=null){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
     }
   
    } 
    
    on FirebaseAuthException catch(e){

      setState(() {
        showLoading = false;
      });

      // ignore: deprecated_member_use
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message),
      )
      );

    }

}


  getMobileFormWidget(context){
    return Container(
      constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/back2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          

          child: Column(
        children:[     
          Spacer(),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
            hintText:"Phone Number",
            hintStyle:TextStyle(color:Colors.black)
            ),
            keyboardType: TextInputType.phone,
            maxLength: 13,
          ),
          SizedBox(height:16),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: ()async{
            setState(() {
              showLoading=true;
            });
           await  _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text, 
              verificationCompleted: (phoneAuthCredential)async{
                setState(() {
                  showLoading=false;
                });
              //signInWithPhoneAuthCredential(phoneAuthCredential);
              }, 
              verificationFailed: (verificationFailed)async{
               setState(() {
                  showLoading=false;
                });
                // ignore: deprecated_member_use
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(verificationFailed.message),
                ),
                );


              },
              codeSent: (verificationId,resendingToken)async{
                setState(() {
                  showLoading=false;
                  currentstate=MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId=verificationId;
                });


              },
              codeAutoRetrievalTimeout: (verificationId)async{
              


              },
              );

            }, 
            child: Text("SEND"),
            color: Colors.green,
            textColor: Colors.white,
            ),
          
          Spacer(),
        ],
      ),
    );


  }

  getOtpFormWidget(context){
       return Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/back2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          
                child: Column(
      children:[
          Spacer(),
          TextField(
            controller: otpController,
            decoration: InputDecoration(
            hintText:"Enter OTP"
            ),
            keyboardType: TextInputType.phone,
            maxLength: 6,
          ),
          SizedBox(height:16),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: ()async{
            PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
            
            signInWithPhoneAuthCredential(phoneAuthCredential);
                      }, 
                      child: Text("VERIFY"),
                      color: Colors.green,
                      textColor: Colors.white,
                      ),
                    
                    Spacer(),
                  ],
                ),
       );
          
          
            }
          
            final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey();
            @override
            Widget build(BuildContext context) {
                return Scaffold(
                  key:_scaffoldKey,
                 body:Container(
                   child:showLoading?Center(child:CircularProgressIndicator(),):currentstate==MobileVerificationState.SHOW_MOBILE_FORM_STATE ?
                 getMobileFormWidget(context):
                 getOtpFormWidget(context),
                 padding: const EdgeInsets.all(16), 
                 )
              );
            }
          }
          
