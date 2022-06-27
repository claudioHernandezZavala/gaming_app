import "package:flutter/material.dart";
import 'package:juegos_app/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> covers = [
    "assets/covers/3.1.jpeg",
    "assets/covers/ac2.jpg",
    "assets/covers/acrevelation1.jpg",
    "assets/covers/battlefield31.jpg",
    "assets/covers/blackflag1.jpg",
    "assets/covers/deadIsland1.jpg",
    "assets/covers/deadspace1.jpg",
    "assets/covers/uncharted31.jpg"
  ];
  List<String> fondos = [
    "assets/fondos/ac3.2.jpg",
    "assets/fondos/ac2.2.jpg",
    "assets/fondos/creveletation1.2.jpg",
    "assets/fondos/battlefield32.jpg",
    "assets/fondos/blackflag2.jpg",
    "assets/fondos/deadIsland2.jpg",
    "assets/fondos/deadspace1.2.jpg",
    "assets/fondos/unchartedfondo.jpg"
  ];
  List<int> precios = [250, 250, 250, 250, 300, 300, 300, 300, 300];
  List<String> nombres = [
    "Assassin's creed 3",
    "Assassin's creed 2",
    "Assassin's creed Revelation",
    "Battlefield 3",
    "Assassin's creed black flag",
    "Dead Island",
    "Dead space",
    "Uncharted 3"
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juegos disponibles"),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
                key: ValueKey<String>(fondos[index]),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          fondos[index],
                        ),
                        fit: BoxFit.fill))),
          ),
          Positioned(
            top: 85,
            child: SizedBox(
              height: 350,
              width: 350,
              child: PageView.builder(
                itemCount: covers.length,
                onPageChanged: (int page) {
                  setState(() {
                    index = page;
                  });
                },
                itemBuilder: (BuildContext context, int index2) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage(
                              covers[index2],
                            ),
                            fit: BoxFit.fill)),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Container(
              margin: EdgeInsets.all(0),
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        offset: Offset(5, 1),
                        blurRadius: 10),
                    BoxShadow(
                        color: Colors.purple,
                        offset: Offset(5, 15),
                        blurRadius: 10)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    nombres[index],
                    style: estilo1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Precio: Lps. ${precios[index]} ",
                    style: estilo2,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.green,
                      ),
                      label: Text("Comprar"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
