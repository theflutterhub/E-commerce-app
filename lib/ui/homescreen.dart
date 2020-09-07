import 'package:e_commerce/ui/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildSingleProduct({String firstName, image, lastName, Color color}) {
    return Container(
      height: 220,
      width: 160,
      decoration: BoxDecoration(
        color: color,
        //  color: Color(0xff79bff2),
        image: DecorationImage(
          alignment: Alignment.bottomRight,
          scale: 4,
          image: AssetImage("images/$image"),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  firstName,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  lastName,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscriptionPart(String name) {
    return Container(
      height: 35,
      width: 100,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.3), offset: Offset(0, 5)),
      ], color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff7fb6fa),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTopName(context) {
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My network",
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  showMaterialScrollPicker(
                    context: context,
                    headerColor: Colors.white,
                    backgroundColor: Colors.white,
                    showDivider: false,
                    items: [
                      "Humana",
                      "Dentemax",
                      "Aetna Dental",
                      "Anthem Blue Cross",
                      "Cigna",
                      "Delta Dental",
                      "Uni Care",
                      "Dental Adventages"
                    ],
                    selectedItem: "Anthem Blue Cross",
                    onCancelled: () => print("Scroll Picker cancelled"),
                    onConfirmed: () => print("Scroll Picker confirmed"),
                  );
                },
                child: Text(
                  "CHANGE",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Anthem",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Blue Cross",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowScrollProduct(context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => Detail(
                        color: Color(0xff79bff2),
                        firstName: "Schedule a",
                        listName: "Cleaning",
                        image: "tooth.png",
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: _buildSingleProduct(
                    color: Color(0xff79bff2),
                    image: "tooth.png",
                    firstName: "Schedule a",
                    lastName: "Cleaning",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => Detail(
                        color: Color(0xff93a4f9),
                        firstName: "Learn About",
                        listName: "Proceedures",
                        image: "doctor.png",
                      ),
                    ),
                  );
                },
                child: _buildSingleProduct(
                  color: Color(0xff93a4f9),
                  image: "doctor.png",
                  firstName: "Learn About",
                  lastName: "Proceedures",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => Detail(
                        color: Color(0xfff780a2),
                        firstName: "Proper",
                        listName: "Clean",
                        image: "rednurse.png",
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: _buildSingleProduct(
                    color: Color(0xfff780a2),
                    image: "rednurse.png",
                    firstName: "Proper",
                    lastName: "Clean",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyDentistAndMapPart() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Dentist",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://miro.medium.com/max/4064/1*qYUvh-EtES8dtgKiBRiLsA.png"),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("images/profile..jpg"),
                          ),
                          title: Text(
                            "Dr. Burnham DDS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "165 Ottlay Dr Atlanta GA",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomRowPart() {
    return Container(
      padding: EdgeInsets.only(bottom: 7),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDiscriptionPart("CALL"),
          _buildDiscriptionPart("MESSENGE"),
          _buildDiscriptionPart("DISCRIPTION"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        leading: Builder(
          builder: (ctx) => IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              }),
        ),
        backgroundColor: Color(0xfff8f8f8),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopName(context),
                _buildRowScrollProduct(context),
                _buildMyDentistAndMapPart(),
                _buildBottomRowPart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
