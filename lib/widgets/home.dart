import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activite> listOfActivities = [
    Activite("Velo", Icons.directions_bike),
    Activite("Golf", Icons.golf_course),
    Activite("Peinture", Icons.palette),
    Activite("Basketball", Icons.sports_basketball),
    Activite("Video games", Icons.gamepad),
    Activite("Velo", Icons.directions_bike),
    Activite("Golf", Icons.golf_course),
    Activite("Peinture", Icons.palette),
    Activite("Basketball", Icons.sports_basketball),
    Activite("Video games", Icons.gamepad),
  ];


  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: orientation == Orientation.portrait ? liste() : grid()
      ),
      /* SINGLESCROLLVIEW
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 100.0, color: Colors.red,),
            Container(height: 100.0, color: Colors.blue,),
            Container(height: 100.0, color: Colors.grey,),
            Container(height: 100.0, color: Colors.green,),
            Container(height: 100.0, color: Colors.red,),
            Container(height: 100.0, color: Colors.blue,),
            Container(height: 100.0, color: Colors.grey,),
            Container(height: 100.0, color: Colors.green,),
          ],
        ),
      ),

       */
    );
  }

  Widget grid() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemCount: listOfActivities.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.all(7.5),
            child: Card(
              elevation: 7.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(listOfActivities[i].nom, style: TextStyle(color: Colors.teal, fontSize: 15.0)
                  ),
                  Icon(listOfActivities[i].icon, color: Colors.teal, size: 30.0,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget liste() {
    return ListView.builder(
        itemCount: listOfActivities.length,
        itemBuilder: (context, i) {
          Activite activite = listOfActivities[i];
          String key = activite.nom;
          return InkWell(
            onTap: () => print("tap"),
            onDoubleTap: () => print("tap tap"),
            child: Card(
              elevation: 5.0,
              child: Dismissible(
                key: Key(key),
                child: ListTile(
                  title: Text("Activite : ${activite.nom}"),
                  trailing: Icon(activite.icon),
                ),
                background: Container(
                  padding: EdgeInsets.only(right: 15.0),
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Supprimer", style: TextStyle(color: Colors.white)
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    listOfActivities.removeAt(i);
                  });
                },
              ),
            ),
          );
        });
  }
}

class Activite {
  String nom;
  IconData icon;

  Activite(String nom, IconData icon) {
    this.nom = nom;
    this.icon = icon;
  }
}