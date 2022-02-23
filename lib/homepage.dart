import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> hoverAnimation;

  List<Product> products = [
    Product(color: const Color(0xff000000), path: 'assets/black.png'),
    Product(color: const Color(0xfffcecd0), path: 'assets/cream.png'),
    Product(color: const Color(0xffb6d7e4), path: 'assets/blue.png'),
  ];
  int currentIndex = 0;

  Color black = const Color(0xff000000);
  Color cream = const Color(0xfffcecd0);
  Color blue = const Color(0xffb6d7e4);
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..repeat(reverse: true);
    hoverAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, 0.03))
            .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
              position: hoverAnimation,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: Image(
                  image: AssetImage(
                    products[currentIndex].path,
                  ),
                  key: ValueKey<int>(currentIndex),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text('BOAT ROCKERZ 450R',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22)),
            const Text('Bluetooth Headphones',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 15)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child:
                          CircleAvatar(backgroundColor: products[index].color),
                    ));
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Rs. 1,599',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  side: const BorderSide(width: 3, color: Colors.pinkAccent),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text('Notify Me'))
          ],
        ),
      ),
    );
  }
}

class Product {
  final Color color;
  final String path;

  Product({required this.color, required this.path});
}
