
import 'package:flutter/material.dart';
import 'package:houserental/provider/appstate.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'widgets/card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}



class HomeImplement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 10),
           BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
          // Spacer(flex: 2),
        ],
      ),
    );
  }
}



// class HistoryListView extends StatefulWidget {
//   const HistoryListView({Key? key}) : super(key: key);

//   @override
//   State<HistoryListView> createState() => _HistoryListViewState();
// }

// class _HistoryListViewState extends State<HistoryListView> {
//   /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
//   /// new items.
//   final _key = GlobalKey();

//   /// Used to "fade out" the history items at the top, to suggest continuation.
//   static const Gradient _maskingGradient = LinearGradient(
//     // This gradient goes from fully transparent to fully opaque black...
//     colors: [Colors.transparent, Colors.black],
//     // ... from the top (transparent) to half (0.5) of the way to the bottom.
//     stops: [0.0, 0.5],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   );

//   @override
//   Widget build(BuildContext context) {
//     final appState = context.watch<MyAppState>();
//     appState.historyListKey = _key;

//     return ShaderMask(
//       shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
//       // This blend mode takes the opacity of the shader (i.e. our gradient)
//       // and applies it to the destination (i.e. our animated list).
//       blendMode: BlendMode.dstIn,
//       child: AnimatedList(
//         key: _key,
//         reverse: true,
//         padding: EdgeInsets.only(top: 100),
//         initialItemCount: appState.history.length,
//         itemBuilder: (context, index, animation) {
//           final text = appState.history[index];
//           return SizeTransition(
//             sizeFactor: animation,
//             child: Center(
//               child: TextButton.icon(
//                 onPressed: () {
//                   appState.toggleFavorite(text);
//                 },
//                 icon: appState.favorites.contains(text)
//                     ? Icon(Icons.favorite, size: 12)
//                     : Icon(Icons.heart_broken_outlined),
//                 label: Text(
//                   text.asLowerCase,
//                   semanticsLabel: text.asPascalCase,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
