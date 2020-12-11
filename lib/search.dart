import 'package:flutter/material.dart';
//import'main.dart';
class SearchIcon extends SearchDelegate<String> {
  final courses = [
    'building a website',
    'repairing computers and networks',
    'machine learning/AI',
    'operating systems',
    'cell phone repair',
    'cyber Security',
    'robotics',
    'software programming',
    'affiliate marketing',
    'selling handmade goods on Etsy',
    'amazon FBA',
    'dropshipping',
    'blogging',
    'freelancing',
    'e-commerce',
    'business & entrepreneurship fundamentals',
    'digital marketing',
    'search engine marketing',
    'branding',
    'social media marketing',
    'content marketing',
    'advertising',
    'flutter'
  ];
  final recentCourses = [
    'branding',
    'social media marketing',
    'content marketing',
    'advertising',
    'flutter'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon in the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someome searches for somethigs
    final suggestionList = query.isEmpty
        ? recentCourses
        : courses.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.book),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
 
  //   Navigator.of(context).pop();
                          //   Navigator.of(context)
                          //     .pushReplacement(MaterialPageRoute(builder: (context) {
                          //   return MyHomePage();
                          // }));
    //  show some results based on the selection
 
    throw UnimplementedError();
  }
}