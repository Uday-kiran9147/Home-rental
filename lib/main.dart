import 'package:flutter/material.dart';
import 'package:houserental/dash_board.dart';
import 'package:houserental/placed.dart';

// void main() {
//   runApp(MyHomePagee());
// }

// class MyHomePagee extends StatefulWidget {
//   @override
//   _MyHomePageeState createState() => _MyHomePageeState();
// }

// class _MyHomePageeState extends State<MyHomePagee> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List<String> _tabTitles = ["Tab 1", "Tab 2", "Tab 3"];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabTitles.length, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("My App"),
//           bottom: TabBar(
//             controller: _tabController,
//             tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
//           ),
//         ),
//         body: IndexedStack(
//           index: _tabController.index,
//           children: [
//             _buildGridView(0),
//             _buildGridView(1),
//             _buildGridView(2),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGridView(int tabIndex) {
//     return GridView.builder(
//       itemCount: 20,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           color: Colors.blueGrey,
//           child: Center(
//             child: Text("Tab $tabIndex - Item $index"),
//           ),
//         );
//       },
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Rental\'s',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              // DashBoard(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.95,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 10),
                      child: TextFormField(
                        
                        decoration: InputDecoration(hintText: "where..?"),
                      ),
                    ),
                  ),
                  Icon(
                    weight: 40,
                    Icons.more_vert_outlined,
                    size: 25,
                    color: Color(0xFF5F6368),
                  ),
                ],
              ),
              Divider(),
              Places(),
            ],
          ),
        ),
      ),
    );
  }
}
