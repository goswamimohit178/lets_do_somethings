import 'package:flutter/material.dart';

class ChooseMessage extends StatefulWidget {
  const ChooseMessage({Key? key}) : super(key: key);

  @override
  State<ChooseMessage> createState() => _ChooseMessageState();
}

class _ChooseMessageState extends State<ChooseMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Choose Message", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(5)),

            ),
            child: Card(
              color: Color(0xff058DD1),
              elevation:0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("I've made a simple example for you. When we click a tile, we just set the selected index to the index we clicked, and each tile looks at that to see if its the currently selected tile.", style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white
                ),),
              ),
            ),

          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(5)),

            ),
            child: Card(
              color: Colors.white,
              elevation:0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("I've made a simple example for you. When we click a tile, we just set the selected index to the index we clicked, and each tile looks at that to see if its the currently selected tile.", style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500)
                ),
            ),
            )
          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(5)),

            ),
              child: Card(
                color: Colors.white,
                elevation:0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("I've made a simple example for you. When we click a tile, we just set the selected index to the index we clicked, and each tile looks at that to see if its the currently selected tile.", style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)
                  ),
                ),
              )

          ),Divider(),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(5)),

            ),
              child: Card(
                color: Colors.white,
                elevation:0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("I've made a simple example for you. When we click a tile, we just set the selected index to the index we clicked, and each tile looks at that to see if its the currently selected tile.", style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)
                  ),
                ),
              )

          ),Divider(),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(5)),

            ),
              child: Card(
                color: Colors.white,
                elevation:0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("I've made a simple example for you. When we click a tile, we just set the selected index to the index we clicked, and each tile looks at that to see if its the currently selected tile.", style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)
                  ),
                ),
              )

          ),
          Divider(),
          SizedBox(height: 50,)

        ],
      ),
    );
  }
}
