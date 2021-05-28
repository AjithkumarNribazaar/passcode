import 'package:flutter/material.dart';
import 'package:passcode/total/total_network.dart';
import 'package:passcode/total/total_post.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({Key key}) : super(key: key);

  @override
  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  List<Post>_posts=List<Post>();
  List<Post> _postDisplay=List<Post>();
  @override
  void initState() {
    // TODO: implement initState
    fetchPost().then((value){
     setState(() {
       _posts.addAll(value);
       _postDisplay=_posts;
     });

      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Bill"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index ) {
            if (_postDisplay.length > 0) {
              return _listItem(index);
            } else {
              return Center(child: CircularProgressIndicator(),);

            }
          },

          itemCount: _postDisplay.length +1,
          ),
    );
  }
  _listItem(index){
    return Card(
        child:Padding(
          padding:EdgeInsets.only(top:32, bottom: 32,left: 16, right: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total sales summary of all shops ",

              textAlign: TextAlign.center,
              style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.orangeAccent)),
              SizedBox(height: 30),
              Text("Card AMT                :     "+_postDisplay[index].cARDAMOUNT,
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5),
              Text("Cash AMT               :     "+_postDisplay[index].cASHAMOUNT,
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5),
              Text("Online App AMT     :     "+_postDisplay[index].oNLINEAMT,
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
              Text("Compp                     :     "+_postDisplay[index].cOMPLEMENTRY,
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5),
              Text("Total Sales Value   :     "+_postDisplay[index].nETT,
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 5),
              Text("Bill Count                 :     "+_postDisplay[index].bILLCOUNT,
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)
              ),
            ],

          ),
        )
    );
  }
}
