import 'package:flutter/material.dart';

class MessengerUi extends StatelessWidget {
  Widget _buildStory({
    String image,
    Color color,
  }) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(left: 20),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: color,
        child: CircleAvatar(
          maxRadius: 32,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            maxRadius: 26,
            backgroundImage: AssetImage("images/$image"),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleStory({String image, Color color, bool me, bool you}) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          CircleAvatar(
            maxRadius: 32,
            backgroundColor: color,
            child: CircleAvatar(
              maxRadius: 29,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                maxRadius: 26,
                backgroundImage: AssetImage("images/$image"),
              ),
            ),
          ),
          Positioned(
            left: 45,
            top: 35,
            child: me == true
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add_circle,
                      size: 27,
                      color: Colors.black,
                    ),
                    maxRadius: 13,
                  )
                : CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 27,
                      color: Colors.green,
                    ),
                    maxRadius: 13,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleMessage(
      {String image,
      String title,
      String subTitle,
      String date,
      bool online,
      FontWeight fontWeight,
      Color color,
      bool notIcon}) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundImage: AssetImage("images/$image"),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(
              subTitle,
              style: TextStyle(color: color, fontWeight: fontWeight),
            ),
            Text(
              date,
              style: TextStyle(color: color, fontWeight: fontWeight),
            ),
          ],
        ),
        trailing: notIcon == false
            ? Icon(
                online == true ? Icons.fiber_manual_record : Icons.check_circle,
                color: online == true ? Colors.green : Colors.grey,
              )
            : Container(
                width: 0,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      bottomNavigationBar: Container(
        height: 60,
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.chat_bubble,
                    size: 30,
                  ),
                  Icon(
                    Icons.supervisor_account,
                    color: Colors.grey,
                    size: 30,
                  ),
                  Icon(
                    Icons.play_circle_filled,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 103,
              bottom: 29,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.red[800],
                  maxRadius: 9,
                  child: Text(
                    "3",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 0, right: 15),
          child: AppBar(
            actions: [
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey[300],
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            elevation: 0.0,
            backgroundColor: Color(0xfff8f8f8),
            title: Container(
              height: 70,
              width: 150,
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 27,
                    backgroundImage: AssetImage("images/faisuprofile.jpeg"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Chats",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 18),
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
              height: 80,
              width: 420,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSingleStory(
                        me: true,
                        color: Colors.grey[300],
                        image: "faisuprofile.jpeg"),
                    _buildStory(color: Color(0xff0099ff), image: "faisu.jpg"),
                    _buildStory(color: Color(0xff0099ff), image: "laptop.png"),
                    _buildSingleStory(
                        color: Colors.grey[300], image: "camera.jpg"),
                    _buildSingleStory(
                        color: Colors.grey[300], image: "man.jpg"),
                    _buildSingleStory(
                        color: Colors.grey[300], image: "manpant.jfif"),
                  ],
                ),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSingleMessage(
                    date: "now",
                    notIcon: false,
                    fontWeight: FontWeight.bold,
                    image: "faisu.jpg",
                    color: Colors.black,
                    subTitle: "Subscribe My Channel-",
                    title: "Assar Baloch",
                  ),
                  _buildSingleMessage(
                    online: true,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    notIcon: false,
                    date: "5m ago",
                    image: "faisuprofile.jpeg",
                    subTitle: "Like Comment and Share-",
                    title: "Sabir Baloch",
                  ),
                  _buildSingleMessage(
                    online: true,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    notIcon: false,
                    date: "5 day",
                    image: "laptop.png",
                    subTitle: "Subscribe My Channel-",
                    title: "Shakeel Baloch",
                  ),
                  _buildSingleMessage(
                    date: "1 week",
                    image: "man.jpg",
                    subTitle: "Hii Sabir -",
                    title: "Sabeel Baloch",
                  ),
                  _buildSingleMessage(
                    date: "1 month",
                    image: "manwatch.jpg",
                    subTitle: "Any Work For Me-",
                    title: "Khalil Baloch",
                  ),
                  _buildSingleMessage(
                    date: "now",
                    image: "camera.jpg",
                    subTitle: "Subscribe My Channel-",
                    title: "Faseel Baloch",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
