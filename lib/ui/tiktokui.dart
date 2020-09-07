import 'package:flutter/material.dart';

class TikTokUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 35,
            ),
            Icon(
              Icons.search,
              color: Colors.grey[600],
              size: 35,
            ),
            Icon(
              Icons.add_circle,
              color: Colors.white,
              size: 50,
            ),
            Image(
              width: 37,
              color: Colors.grey[600],
              image: AssetImage("images/message.png"),
            ),
            Icon(
              Icons.person,
              color: Colors.grey[600],
              size: 40,
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Follow",
              style: TextStyle(fontSize: 18, color: Colors.grey[300]),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "For You",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/faisu.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 530,
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      maxRadius: 35,
                      backgroundImage: AssetImage("images/faisuprofile.jpeg"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 55,
                      color: Colors.red[500],
                    ),
                    Text(
                      "17 M",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Image(
                      width: 45,
                      color: Colors.white,
                      image: AssetImage("images/message.png"),
                    ),
                    Text(
                      "1288 k",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Image(
                      width: 45,
                      color: Colors.white,
                      image: AssetImage("images/share.png"),
                    ),
                    Text(
                      "Share",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 10, top: 50),
              width: 500,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "@mr_faisu_007",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      Text(
                        "With jannat_zubiar29",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "OriginalMusic-playdate",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: AssetImage("images/music.png"),
                    ),
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
