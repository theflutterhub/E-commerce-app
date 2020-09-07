import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildTopPart() {
    return Card(
      child: Container(
        height: 330,
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/profile..jpg"),
                  ),
                  trailing: Container(
                    height: 50,
                    width: 130,
                    child: Row(
                      children: [
                        Text(
                          "AED",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "2,450",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 50,
                          height: 45,
                          child: RaisedButton(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            color: Color(0xff612de5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 170,
              width: 380,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/car.png"))),
            ),
            Expanded(
              child: Container(
                width: 400,
                child: ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Civic Type R 2019",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Honda")
                    ],
                  ),
                  trailing: Container(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Garage",
                          style: TextStyle(
                              color: Color(0xff612de5),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: GestureDetector(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color(0xff612de5),
                              ),
                              onTap: () {}),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavyBar(
      showElevation: true,
      backgroundColor: Colors.white,
      containerHeight: 60,
      onItemSelected: (index) => setState(() {}),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          activeColor: Color(0xff612de5),
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Users'),
          activeColor: Colors.grey[500],
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Messages'),
            activeColor: Colors.grey[500]),
        BottomNavyBarItem(
          icon: Icon(Icons.supervisor_account),
          title: Text('Settings'),
          activeColor: Colors.grey[500],
        ),
      ],
    );
  }

  Widget _buildMiddlePart() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color(0xff7033ff),
      child: Container(
        height: 120,
        width: 380,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Available Cars",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Long term Short term",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: Container(
              width: 50,
              height: 45,
              child: RaisedButton(
                child: Icon(Icons.arrow_forward),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomContainer(
      {String image, String date, String name, String subtitle}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 210,
        // padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 35,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            date,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 165,
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    child: Image(
                      image: AssetImage("images/$image"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: SafeArea(
          child: Column(
            children: [
              _buildTopPart(),
              Container(
                height: 186,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMiddlePart(),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOP DEALS",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[500],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "More",
                                style: TextStyle(
                                    color: Color(0xff612de5),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: GestureDetector(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Color(0xff612de5),
                                    ),
                                    onTap: () {}),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildBottomContainer(
                        date: "Daily",
                        image: "car1.png",
                        name: "Alfa Romeo 4C",
                        subtitle: "AED 420",
                      ),
                      _buildBottomContainer(
                          date: "Month",
                        image: "car2.png",
                        name: "Range Rover Sport",
                        subtitle: "AED 4,350",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
