import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme.dart';
import 'widgets.dart';
import 'data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 3',
      theme: placesTheme,
      home: const HomePage(),
    );
  }
}

int _selectedIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [PlacesPage(), VisitsPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Lugares',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop),
              label: 'Visitados',
            ),
          ]),
    );
  }
}

class PlacesPage extends ConsumerWidget {
  const PlacesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesRef = ref.watch(placesProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Text('Guatemala', style: Theme.of(context).textTheme.headline6),
              Text('Corazón del mundo maya',
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: GridView.builder(
                itemCount: placesRef.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: ((context, index) {
                  Place actualPlace = placesRef[index];
                  return GestureDetector(
                    onTap: () {
                      ref
                          .read(placesProvider.notifier)
                          .toggle(actualPlace.title);
                    },
                    child: PlacesCard(
                        image: actualPlace.image,
                        title: actualPlace.title,
                        description: actualPlace.description,
                        visited: actualPlace.visited),
                  );
                })),
          ),
        ),
      ],
    );
  }
}

class VisitsPage extends ConsumerWidget {
  const VisitsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitedRef = ref.watch(visitedPlacesProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text('Lugares visitados',
              style: Theme.of(context).textTheme.headline6),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView.separated(
              itemBuilder: ((context, index) {
                return VisitedCard(
                    image: visitedRef[index].image,
                    title: visitedRef[index].title);
              }),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: visitedRef.length),
        )),
      ],
    );
  }
}
