import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:regapp/firebase_options.dart';
import 'package:regapp/success.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      title: 'Registration App',
      home:RegistrationScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        "success":(context)=>Success(),
      },
      
    );
  }
  }
  class RegistrationScreen extends
  StatefulWidget{
    @override
    _RegistrationScreenState
    createState()=>_RegistrationScreenState();
  }
  class _RegistrationScreenState extends State<RegistrationScreen>{
    
    final firestoreInstance=FirebaseFirestore.instance;
  final FirebaseStorageInstance=FirebaseStorage.instance;
    String?name;
    String?password;
    String? email;
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
       backgroundColor: Colors.white,
       appBar:AppBar(
         title: Text('Registration'),
        ),

        body:Padding(padding: EdgeInsets.all(5.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
          const SingleChildScrollView(),
          //Image.asset("assets/images/register.jpg",height: 100,width: 100,),
          Text("REGISTER NOW",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
         TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            labelText: "name",
          ),
          onChanged: (value){
            name=value;
          }
              
            ), SizedBox(height: 20,),

            TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),

            labelText: "password",
          ),
          onChanged: (value){
            password=value;
          }
              
            ), SizedBox(height: 20,),

            TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),

            labelText: "email",
          ),
          onChanged: (value){
            email=value;
          }
          ), SizedBox(height: 20,),
          
          RawMaterialButton(
            fillColor: Colors.blue,
            onPressed: ()async{
              Navigator.pushNamed(context,"success");
                await firestoreInstance.collection("details").doc().set({
                  "Name":name,
                  "password":password,
                  "email":email,

                });  
            },
            child: Text("register"),)
        ],
        ),
      ),);
    }
  }