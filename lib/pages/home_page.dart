import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passcode/network.dart';
import '../post.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Post> _posts =List<Post>();
  List<Post> _postDisplay = List<Post>();


  void initState(){
    fetchPost().then((value){
      setState((){
        _posts.addAll(value);
        _postDisplay = _posts;
      });
    }
    );
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Day sales"),
       ),
       body:Column(children: [Container( child: Padding(padding: EdgeInsets.only(top:10, bottom:1, left:30, right:30),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("All Shops Current day Sales ",

               textAlign: TextAlign.center,
               style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
           SizedBox(height: 20),
         ],
       ),)),
        Expanded( child: ListView.builder(
            itemBuilder: (context, index) {
            if (_postDisplay.length > 0) {
             return _listItem(index);
            } else {
             return Center(child: CircularProgressIndicator());
           }
         },
         itemCount: _postDisplay.length,
       ),
     )
     ]
     )
     );
   }
  _listItem(index){
    return Card(
      child: Padding(padding: EdgeInsets.only(top:25, bottom:32, left:30, right:30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(
             "Sales Value               :    "   + _postDisplay[index].nETT,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
             Text("Bill Count                   :   "+_postDisplay[index].bILLCOUNT,
              style: TextStyle(fontSize:22, fontWeight: FontWeight.bold),
            ),
          Text("Branch Code             :    "+
              _postDisplay[index].sHBRANCHCODE,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
           Text ("Last Update               :   "+
              _postDisplay[index].mAX,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
