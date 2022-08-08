import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscanner/scancode.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String? qrVal;
final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 25,),
            Column(
              children: [
                IconButton(onPressed: (){},icon: Icon(Icons.home_outlined,size: 30,),),
                Text('Home')
              ],
            ),
            SizedBox(width: 120,),
            Column(
              children: [
                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>scanQr()));},icon: Icon(Icons.qr_code_scanner_outlined,size: 30,),),
                Text('Read')
              ],
            ),
            SizedBox(width: 120,),
            Column(
              children: [
                IconButton(onPressed: (){},icon: Icon(Icons.list_alt,size: 30,),),
                Text('History')
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff660000),
        title: Text('QR SCANNER',style:TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

         QrImage(data: controller.text,
         version: QrVersions.auto,
         size: 300,
         backgroundColor: Colors.white,
         padding: EdgeInsets.all(10.0),),
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: controller,
           style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
             fontSize: 20
           ),
            decoration: InputDecoration(
              hintText: 'Enter the data',
              hintStyle: TextStyle(
                  color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.black)
              ),
              suffixIcon: IconButton(
                icon:Icon(Icons.done,size: 20,),onPressed: ()=> setState((){}),
              )
            ),
          ),
        ),
      ],
    ),
    );
  }
}
