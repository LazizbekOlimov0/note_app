import 'package:flutter/material.dart';
import 'created_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
     appBar: AppBar(
       title: Text("Note menu",
       style: TextStyle(
         fontSize: 30,
         fontWeight: FontWeight.w300,
       ),
       ),
       centerTitle: true,
       backgroundColor: Colors.yellow.shade800,
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNotePage()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: CreateNotePageState.noteList
      ),
    );
  }
}
