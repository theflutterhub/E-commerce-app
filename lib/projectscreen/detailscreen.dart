import 'package:e_commerce/projectscreen/homescreen.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Color color;
  final String firstName, listName;
  final String image;
  Detail({this.color, this.firstName, this.listName, this.image});
  Widget _buildTopButton({String name, Color color}) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSingleContainer({IconData icon, String title, subTitle}) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[350],
        ),
      ),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Color(0xffe5f2fc),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTopPart() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 35, left: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      listName,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/$image"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPart() {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildTopButton(
                            color: color,
                            name: "PHILLIP",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          _buildTopButton(
                            color: Colors.grey[350],
                            name: "KIMBERLY",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date & Time",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildSingleContainer(
                              icon: Icons.calendar_today,
                              title: "Date",
                              subTitle: "August 29th 2019"),
                          SizedBox(
                            height: 10,
                          ),
                          _buildSingleContainer(
                              icon: Icons.access_time,
                              title: "Time",
                              subTitle: "9:00AM"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Coverage",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildSingleContainer(
                              icon: Icons.content_paste,
                              title: "Include",
                              subTitle: "X-ray"),
                          SizedBox(
                            height: 10,
                          ),
                          _buildSingleContainer(
                              icon: Icons.brush,
                              title: "Include",
                              subTitle: "Polishing"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      height: 60,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        onPressed: () {},
        child: Text(
          "Confirm",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      color: Colors.white,
    );
  }

  Widget _buildBackButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => HomeScreen(),
          ),
        );
      },
      child: Scaffold(
        bottomNavigationBar: _buildBottomButton(),
        backgroundColor: color,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(context),
              _buildTopPart(),
              _buildBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
