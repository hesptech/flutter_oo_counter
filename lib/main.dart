import 'package:flutter/material.dart';
//import 'package:flutter_oo_counter/presentation/screens/counter/counter_functions_screen.dart';
// import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomeCounterScreen()
    );
  }
}


class HomeCounterScreen extends StatefulWidget {
  const HomeCounterScreen({super.key});

  @override
  State<HomeCounterScreen> createState() => _HomeCounterScreenState();
}

class _HomeCounterScreenState extends State<HomeCounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Color(0xFF444152), Color(0xFF6f6c7d)], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  /* height: 128.0,
                    width: 128.0, */
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                      width: 1.0,
                    ),
                    shape: BoxShape.circle,
                    //image: DecorationImage(image: this.logo)
                  ),
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    child: Text(
                      '$clickCounter',
                      style: const TextStyle(
                        fontSize: 100, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0,),
                Text(
                  'Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //const SizedBox(width: 10),
                CustomCounterButton(
                  icon: Icons.exposure_minus_1_outlined,
                  onPressed: () {
                    if (clickCounter == 0) return;
                    clickCounter--;
                    setState(() {});
                  },
                ),
                CustomCounterButton(
                  icon: Icons.refresh_rounded,
                  onPressed: () {
                    clickCounter = 0;
                    setState(() {});
                  },
                ),
                //const SizedBox(width: 10),
                CustomCounterButton(
                  icon: Icons.plus_one,
                  onPressed: () {
                    clickCounter++;
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class CustomCounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomCounterButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // shape: const StadiumBorder(),
      padding: const EdgeInsetsDirectional.all(25.0),
      color: Colors.amber,
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}