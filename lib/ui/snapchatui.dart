import 'package:flutter/material.dart';

class SnapchatUi extends StatelessWidget {
  Widget _buildSingleStory({String image, String name}) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            maxRadius: 40,
            backgroundColor: Color(0xff9f5acd),
            child: CircleAvatar(
              maxRadius: 38,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                maxRadius: 35,
                backgroundImage: AssetImage("images/$image"),
              ),
            ),
          ),
          Text(name)
        ],
      ),
    );
  }

  Widget _buildSingleSubscription({String image, String title, String date}) {
    return Container(
      height: 190,
      width: 120,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/$image"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildSingleForYou({String image, String title, String date}) {
    return Container(
      height: 300,
      width: 190,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/$image"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildSingleBottomProduct({String image, bool color}) {
    return Container(
      height: 25,
      child: Image(
        image: AssetImage("images/$image.png"),
        color: color == true ? Colors.grey : Color(0xff9f5acd),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSingleBottomProduct(image: "location", color: true),
            _buildSingleBottomProduct(image: "message1", color: true),
            _buildSingleBottomProduct(image: "camera", color: true),
            _buildSingleBottomProduct(image: "account", color: false),
            _buildSingleBottomProduct(image: "play", color: true),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfff8f8f8),
        title: Container(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Color(0xfff2f2f2),
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Color(0xff31414f),
                ),
              ),
              Container(
                height: 50,
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Stories",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Color(0xfff2f2f2),
            child: Icon(
              Icons.person_add,
              size: 30,
              color: Color(0xff31414f),
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0xfff2f2f2),
            child: Icon(
              Icons.more_horiz,
              size: 30,
              color: Color(0xff31414f),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Friends",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 130,
                  width: 420,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSingleStory(
                            image: "tony.jpg", name: "Tony Stark"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleStory(
                            image: "jack.jpg", name: "Jack Sparrow"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleStory(
                            image: "carry.jpg", name: "Carryminati"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleStory(image: "faisu.png", name: "Faisu"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleStory(
                            image: "jumana.jpg", name: "Jumana Khan"),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Subscriptions",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 250,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSingleSubscription(
                            image: "tony.jpg",
                            date: "17 Hour Ago",
                            title: "Tony Stark Act On EndGame"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleSubscription(
                            image: "jack.jpg",
                            date: "20 Hour Ago",
                            title: "Jonny Depp Act On Their Movies"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleSubscription(
                            image: "carry.jpg",
                            date: "Today",
                            title: "Carryminati After Roast TikTok Vs Youtube"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleSubscription(
                            image: "faisu.png",
                            date: "2 Days Ago",
                            title: "Faisu Reaction On Tiktok Vs Youtube"),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSingleSubscription(
                            image: "jumana.jpg",
                            date: "1 Week Ago",
                            title: "Jumana Reaction On Tiktok Vs Youtube"),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "For You",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                "Swipe for Shows",
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Row(
                    children: [
                      _buildSingleForYou(
                        image: "chadwick.jpg",
                        date: "Today",
                        title: "Black Panther Actor Was Die",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      _buildSingleForYou(
                        image: "kabir.jpg",
                        date: "1 month ago",
                        title: "Shahid Kapoor Become Best Actor",
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
}
