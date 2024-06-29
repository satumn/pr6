import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'platform_detector.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'cat',
          builder: (BuildContext context, GoRouterState state) {
            return const CatPage(title: 'Cat',);
          },
        ),
        GoRoute(
          path: 'dog',
          builder: (BuildContext context, GoRouterState state) {
            return const DogPage(title: 'Dog',);
          },
        ),
        GoRoute(
          path: 'mouse',
          builder: (BuildContext context, GoRouterState state) {
            return const MousePage(title: 'Mouse',);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet house')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Do you want to feed a pet?", style: TextStyle(color: Colors.deepPurple, fontSize: 26)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/cat'),
                  child: const Text('Cat'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/dog'),
                  child: const Text('Dog'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/mouse'),
                  child: const Text('Mouse'),
                ),
              ],
            ),
            const Text('Look at how beautiful these pets are!', style: TextStyle(color: Colors.deepPurple, fontSize: 26)),
            ElevatedButton(
              onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GalleryScreen()));},
              child: const Text('Photo Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  /// Constructs a [GalleryScreen]
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet house')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Cat:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaELWQzhrsHi9CcieUe4gQKAHCdXTQDzMSrw&s", height: 100, width: 100),
                Image.network("https://thumbs.dreamstime.com/b/striped-small-cat-not-purebred-kitten-kitten-white-background-predator-31398453.jpg", height: 100, width: 100),
              ],
            ),
            const Text('Dog:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https://hips.hearstapps.com/hmg-prod/images/alaskan-klee-kai-puppy-sitting-on-grass-looking-up-royalty-free-image-1678473164.jpg?crop=0.535xw:1.00xh;0.325xw,0&resize=980:*", height: 100, width: 100),
                Image.network("https://i.insider.com/5c20f20ddde86759147f9f52?width=750&format=jpeg&auto=webp", height: 100, width: 100),
              ],
            ),
            const Text('Mouse:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnaT2S3Zn7lBmVuOTdE9_G1fD4bq2LtqxT_Q&s", height: 100, width: 100),
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSha8NFmTG5GyqKiHZ7vRz1ksD9bNQwIr3mmZbI-7nQ0wMnpt18SSBG2_rzNKM3S35e5YM&usqp=CAU", height: 100, width: 100),
              ],
            ),
            ElevatedButton(
              onPressed: () {Navigator.pop(context);},
              child: const Text('Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatPage extends StatefulWidget {
  const CatPage({super.key, required this.title});

  final String title;

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  double counter = 0;
  void feedFish() {
    setState(() {
      if (counter < 10) {
        counter++;
      }
    });
  }
  void feedMilk() {
    setState(() {
      if (counter < 10) {
        counter += 0.5;
      }
    });
  }
  void Cleen() {
    setState(() {
      counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Satiety scale $counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(),
                  counter > 5
                      ? Image.network(
                    "https://cdn0.iconfinder.com/data/icons/cat-pattern/94/cat4-512.png", height: 300, width: 300,
                  )
                      : Image.network(
                    "https://static.thenounproject.com/png/1248334-200.png", height: 340, width: 340,
                  ),
                ],
              ),
              PlatformTypeApp(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(onPressed: feedFish,
                      tooltip: '+1', icon: Image.network("https://cdn-icons-png.freepik.com/256/3829/3829599.png?semt=ais_hybrid", width: 50, height: 50,)),
                  IconButton(onPressed: feedMilk,
                      tooltip: '+0.5', icon: Image.network("https://cdn-icons-png.flaticon.com/512/869/869655.png", width: 60, height: 60,)),
                ],
              ),
            ]
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              FloatingActionButton(
                onPressed: () => context.go('/'),
                tooltip: 'menu page',
                child: Image.network("https://cdn-icons-png.flaticon.com/512/561/561184.png"),
              ),
              FloatingActionButton(
                onPressed: () => context.go('/dog'),
                child: const Text('dog'),
              ),
              FloatingActionButton(
                onPressed: () => context.go('/mouse'),
                child: const Text('mouse'),
              ),
            ],
          ),
          FloatingActionButton.extended(
            onPressed: Cleen,
            label: const Text('10 hours later'),
          ),
        ],
      ),
    );
  }
}

class DogPage extends StatefulWidget {
  const DogPage({super.key, required this.title});

  final String title;

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  double counter = 0;
  void feedMeat() {
    setState(() {
      if (counter < 10) {
        counter++;
      }
    });
  }
  void feedWater() {
    setState(() {
      if (counter < 10) {
        counter += 0.5;
      }
    });
  }
  void Cleen() {
    setState(() {
      counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Satiety scale $counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(),
                  counter > 5
                      ? Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaPj__zquGTzMUcblqUgPmY5yidoKRLg0iCg&s", height: 300, width: 300,
                  )
                      : Image.network(
                    "https://cdn0.iconfinder.com/data/icons/pets-6/154/dog-pet-toy-puppy-animal1-512.png", height: 340, width: 340,
                  ),
                ],
              ),
              PlatformTypeApp(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(onPressed: feedMeat,
                      tooltip: '+1', icon: Image.network("https://cdn-icons-png.freepik.com/512/5222/5222254.png", width: 50, height: 50,)),
                  IconButton(onPressed: feedWater,
                      tooltip: '+0.5', icon: Image.network("https://cdn-icons-png.flaticon.com/256/2447/2447774.png", width: 60, height: 60,)),
                ],
              ),
            ]
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              FloatingActionButton(
                onPressed: () => context.go('/'),
                tooltip: 'menu page',
                child: Image.network("https://cdn-icons-png.flaticon.com/512/561/561184.png"),
              ),
              FloatingActionButton(
                onPressed: () => context.go('/cat'),
                child: const Text('cat'),
              ),
              FloatingActionButton(
                onPressed: () => context.go('/mouse'),
                child: const Text('mouse'),
              ),
            ],
          ),
          FloatingActionButton.extended(
            onPressed: Cleen,
            label: const Text('10 hours later'),
          ),
        ],
      ),
    );
  }
}

class MousePage extends StatefulWidget {
  const MousePage({super.key, required this.title});

  final String title;

  @override
  State<MousePage> createState() => _MousePageState();
}

class _MousePageState extends State<MousePage> {
  double counter = 0;
  void feedSeed() {
    setState(() {
      if (counter < 10) {
        counter++;
      }
    });
  }
  void feedWater() {
    setState(() {
      if (counter < 10) {
        counter += 0.5;
      }
    });
  }
  void Cleen() {
    setState(() {
      counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Satiety scale $counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(),
                  counter > 5
                      ? Image.network(
                    "https://www.shutterstock.com/image-vector/rat-white-cute-fat-mouse-260nw-1563014074.jpg", height: 300, width: 300,
                  )
                      : Image.network(
                    "https://cdn-icons-png.flaticon.com/512/2219/2219778.png", height: 340, width: 340,
                  ),
                ],
              ),
              PlatformTypeApp(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(onPressed: feedSeed,
                      tooltip: '+1', icon: Image.network("https://cdn-icons-png.flaticon.com/512/4063/4063297.png", width: 50, height: 50,)),
                  IconButton(onPressed: feedWater,
                      tooltip: '+0.5', icon: Image.network("https://cdn-icons-png.flaticon.com/256/2447/2447774.png", width: 60, height: 60,)),
                ],
              ),
            ]
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              FloatingActionButton(
                onPressed: () => context.go('/'),
                tooltip: 'menu page',
                child: Image.network("https://cdn-icons-png.flaticon.com/512/561/561184.png"),
              ),
              FloatingActionButton(
                onPressed: () => context.go('/dog'),
                child: const Text('dog'),
              ),
              FloatingActionButton(
                onPressed: () => context.go('/cat'),
                child: const Text('cat'),
              ),
            ],
          ),
          FloatingActionButton.extended(
            onPressed: Cleen,
            label: const Text('10 hours later'),
          ),
        ],
      ),
    );
  }
}