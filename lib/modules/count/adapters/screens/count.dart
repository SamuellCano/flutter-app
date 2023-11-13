/*import 'package:flutter/material.dart';

class Count extends StatefulWidget{
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int number = 1;
  int pos = 0;
  List<Color> colores = [Colors.black,Colors.teal,Colors.amber, Colors.blue, Colors.red, Colors.pink, Colors.purple, Colors.brown, Colors.green, Colors.cyan ]; 
  Color colorActual = Colors.black;
  @override
  Widget build(BuildContext context) {
    TextStyle fontSize32 = TextStyle(fontSize: 32, color: colorActual);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contenedor'),
        elevation : 2.0,
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, //Vertical
          crossAxisAlignment: CrossAxisAlignment.center, //Horizontal
          children : <Widget>[
            Text('Numero touch', style: fontSize32),
            Text('$number', style: fontSize32),
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed:(){
        print(pos);
        if(pos == 9){
          pos = 0;
          
        }else{
           pos++;
        }
        
       
        colorActual = colores[pos];
        number++;
        setState(() {});
      }
      ), 
    );
  }
}*/