import 'package:flutter/material.dart';

class YoutubeUi extends StatelessWidget {
  Widget _buildSingleProduct(
      {String image, String time, String title, String view, String date}) {
    return Column(
      children: [
        Container(
          height: 260,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/$image"),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 25,
                    width: 45,
                    color: Colors.black45,
                    child: Center(
                      child: Text(
                        time,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            children: [
              CircleAvatar(
                maxRadius: 25,
                backgroundImage: AssetImage("images/flutter.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 310,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.more_vert)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Flutter App Developer - ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "$view K Views - ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$date week ago",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 3,
        ),
      ],
    );
  }

  Widget _buildSingleBottomProduct(
      {IconData icon, Color iconColor, String name, Color nameColor}) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
        Text(
          name,
          style: TextStyle(color: nameColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSingleBottomProduct(
              icon: Icons.home,
              name: "Home",
              nameColor: Colors.red,
              iconColor: Colors.red,
            ),
            Container(
              height: 46,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: Image.asset(
                      "images/trending.png",
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "Trending",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            _buildSingleBottomProduct(
              icon: Icons.subscriptions,
              name: "Subscriptions",
              nameColor: Colors.grey[700],
              iconColor: Colors.grey[700],
            ),
            _buildSingleBottomProduct(
              icon: Icons.notifications,
              name: "Activity",
              nameColor: Colors.grey[700],
              iconColor: Colors.grey[700],
            ),
            _buildSingleBottomProduct(
              icon: Icons.folder,
              name: "Library",
              nameColor: Colors.grey[700],
              iconColor: Colors.grey[700],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffff8f8f8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/youtube.png"),
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.videocam,
                color: Colors.black45,
                size: 30,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black45,
                size: 30,
              ),
              onPressed: () {}),
          Container(
            height: 10,
            padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage("images/flutter.png"),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Column(
              children: [
                _buildSingleProduct(
                  date: "1",
                  image: "pin1.jpg",
                  time: "43:13",
                  title: "BeautiFul HomePage Ui In Flutter",
                  view: "200",
                ),
                _buildSingleProduct(
                  date: "2",
                  image: "pic2.jpg",
                  time: "29:13",
                  title: "Improve HomePage Ui In Flutter",
                  view: "180",
                ),
                _buildSingleProduct(
                  date: "1",
                  image: "pin1.jpg",
                  time: "43:13",
                  title: "BeautiFul HomePage Ui In Flutter",
                  view: "200",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
