import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int firstnum;
  late int secondnum;
  String texttodisplay="";
  late String res;
  late String operatortoperform;
  
  void btnclicked(String btnval){
    if(btnval=="C"){
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    }else if(btnval == "+" || btnval == "-" || btnval == "X" || btnval == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    }else if(btnval == "="){
      secondnum = int.parse(texttodisplay);
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString();
      }
      if( operatortoperform == "-"){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == "X"){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == "/"){
        res = (firstnum ~/ secondnum).toString();
      }
    }else{
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(){
      texttodisplay = res;
    }
  }

  Widget customebutton(String btnval){
    return Expanded(
      child: OutlinedButton(
      onPressed: ()=>btnclicked(btnval),
      child: Text('$btnval'),
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          ),
      ),
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container(

              alignment:Alignment.bottomRight,
              child: Text('$texttodisplay',style: 
              TextStyle(fontSize: 30,
              fontWeight: FontWeight.w600)),
            )),
          Row(
            children: [
             customebutton('7'),
             customebutton('8'),
             customebutton('9'),
             customebutton('/'),
            ],
          ),
          Row(
            children: [
             customebutton('4'),
             customebutton('5'),
             customebutton('6'),
             customebutton('X'),
            ],
          ),
          Row(
            children: [
             customebutton('1'),
             customebutton('2'),
             customebutton('3'),
             customebutton('-'),
            ],
          ),
          Row(
            children: [
             customebutton('C'),
             customebutton('0'),
             customebutton('='),
             customebutton('+'),
            ],
          )
        ],)
      ),
    );
  }
}

