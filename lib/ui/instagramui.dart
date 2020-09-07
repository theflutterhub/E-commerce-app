import 'package:flutter/material.dart';

class InstagramUi extends StatelessWidget {
  Widget _buildSingleStory({String name, String image, bool your}) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/$image"),
                maxRadius: 35,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                name,
              ),
            ],
          ),
          your == true
              ? Positioned(
                  top: 40,
                  left: 40,
                  child: CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.add),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey,
                size: 35,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.supervisor_account,
                color: Colors.grey,
                size: 35,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        title: Image(
          height: 50,
          image: AssetImage("images/instagramtext.png"),
          fit: BoxFit.cover,
        ),
        // title:Image.asset("images/instagramtext.png"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xfff2f2f2),
        leading: IconButton(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.grey[700],
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Image(
              color: Colors.grey[900],
              image: AssetImage("images/icon.png"),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          width: 130,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: () {},
                              ),
                              Text(
                                "Watch All",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                _buildSingleStory(
                    name: "Your Story", image: "welcome.jpg", your: true),
                _buildSingleStory(name: "Assar Baloch", image: "care.png"),
                _buildSingleStory(name: "Sabir Baloch", image: "man.jpg"),
                _buildSingleStory(name: "Faseel Baloch", image: "laptop.png"),
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundImage: AssetImage("images/flutter.png"),
                        ),
                        Text(
                          "Flutter App Developer",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
                ],
              ),
            ),
            Container(
              height: 320,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/pic2.jpg"),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 390,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.play_circle_outline,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Image(
                            color: Colors.black,
                            image: AssetImage("images/icon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.question_answer,
                      color: Colors.grey[800],
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Like 2,900",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Flutter Hi!!",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  Text(
                    "#flutterappdeveloper",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
