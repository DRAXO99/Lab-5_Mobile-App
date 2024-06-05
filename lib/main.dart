import 'package:flutter/material.dart';
import 'next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) :super(key:key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Color activeColor = Colors.lightBlue; // Define active color for bottom navigation bar items

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
    home: MyAppExt()
  );
  }
}
class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonName= 'Click';
  int currentIndex=0;
  bool isClicked= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child:currentIndex == 0
              ? Container(
            width:double.infinity,
            height:double.infinity,
            color:Colors.pink,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: (){
                    setState( (){
                      buttonName='Clicked';
                    });
                  },
                  child:Text(buttonName),
                ),
                ElevatedButton(
                  onPressed:(){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:(BuildContext context)=>
                          const NextPage()
                      ),
                    );
                  },
                  child:const Text('Next Page'),
                )
              ],
            ),
          ) //Gesture detactor use for detect any taps on the picture etc
              :GestureDetector(
            onTap:(){
              setState((){
              isClicked=!isClicked;
              });
            },
                child:isClicked? Image.asset('images/ksm.jpeg') : Image.network(
                'https://i.pinimg.com/736x/b8/bc/a3/b8bca3d341f4620af3148f6e4f94b23c.jpg'),
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const[
          BottomNavigationBarItem(label:'Home',
            icon:Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label:'Settings',
            icon:Icon(Icons.settings),
          )
        ],
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}


// cara change the page kena letak if current index= smth then put the child mcm container/sizedbox or etc