import 'package:flutter/material.dart';

class WhatsappUi extends StatelessWidget {
  Widget _buildSingleMessenge(
      {String image, String name, String messenge, String date, bool green}) {
    return Container(
      height: 80,
      width: 430,
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Color(0xfff8f8f8),
          backgroundImage: AssetImage("images/$image"),
        ),
        title: Text(name),
        subtitle: Text(messenge),
        trailing: Text(
          date,
          style: TextStyle(
              fontSize: green == true ? 16 : 14,
              fontWeight:
                  green == true ? FontWeight.bold : FontWeight.normal,
              color: green == true ? Color(0xff22c55c) : Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Container(
            height: 20,
            child: Image(
              fit: BoxFit.cover,
              color: Colors.white,
              image: AssetImage("images/whatsapp.png"),
            ),
          ),
          backgroundColor: Color(
            0xff22c55c,
          ),
        ),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TabBar(
                labelPadding: EdgeInsets.only(bottom: 10),
                indicatorColor: Colors.white,
                tabs: [
                  Text(
                    "CHATS",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("STATUS"),
                  Text("CALLS"),
                ]),
          ),
          backgroundColor: Color(0xff075e55),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Whatsapp",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 28,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: TabBarView(children: [
          Column(
            children: [
              _buildSingleMessenge(
                  date: "Yesterday",
                  image: "welcome.jpg",
                  messenge: "Hii Friend How Are YOu!!",
                  name: "Sabir Baloch"),
              _buildSingleMessenge(
                  date: "1 week ago",
                  image: "man.jpg",
                  green: true,
                  messenge: "Subscribe Flutter app Developer",
                  name: "ARbi Baloch"),
              _buildSingleMessenge(
                  date: "4 hour",
                  image: "laptop.png",
                  green: true,
                  messenge: "Click The Bell Icon",
                  name: "Shakeel Baloch"),
              _buildSingleMessenge(
                  date: "3 week ago",
                  image: "nurse.png",
                  green: true,
                  messenge: "To Get New Video Updates",
                  name: "Khalil Baloch"),
              _buildSingleMessenge(
                  date: "just Now",
                  image: "manpant.jfif",
                  messenge: "Like Comment And Share",
                  name: "Assar Baloch"),
              _buildSingleMessenge(
                  date: "2 min go",
                  green: true,
                  image: "manwatch.jpg",
                  messenge: "Hii Sabir Baloch",
                  name: "Faseel Baloch"),
            ],
          ),
          Text("asa"),
          Text("asd"),
        ]),
      ),
    );
  }
}
