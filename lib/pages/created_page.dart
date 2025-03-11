import 'package:flutter/material.dart';
import 'home_page.dart';

class CreateNotePage extends StatefulWidget{
  const CreateNotePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreateNotePageState();
  }
}

TextEditingController textEditingControllerTitle=TextEditingController();
TextEditingController textEditingControllerText=TextEditingController();


class CreateNotePageState extends State<CreateNotePage>{

  static List<Widget> noteList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Text("Create Note",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 30,
          color: Colors.black
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade800,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            TextField(
              controller: textEditingControllerTitle,
              cursorColor: Colors.green,
              onChanged: (value){
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
                hintText: "title",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              controller: textEditingControllerText,
              cursorColor: Colors.green,
              onChanged: (value){
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.subtitles_sharp),
                hintText: "body",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            MaterialButton(
              height: 70,
              minWidth: 300,
              color: Colors.green.shade500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.green.shade200,
                    width: 3,
                  )
              ),
              onPressed: (){
                if(textEditingControllerTitle.text.isNotEmpty&&textEditingControllerText.text.isNotEmpty) {
                  Widget note = createNote(
                      title: textEditingControllerTitle.text,
                      text: textEditingControllerText.text);
                  setState(() {
                    addNote(note);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                          (Route<dynamic> route) => false,
                    );
                  });
                  textEditingControllerTitle.clear();
                  textEditingControllerText.clear();
                }
              },
              child: Text("create",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white
              ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


void addNote(Widget widget) {
  CreateNotePageState.noteList.add(widget);
}

Widget createNote({required String title,required String text}) {
  bool test=false;
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Card(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textEditingControllerTitle.text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[900],
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    textEditingControllerText.text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.blueGrey[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    ],
  );
}

