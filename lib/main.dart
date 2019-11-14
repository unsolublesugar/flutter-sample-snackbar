import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation',
      home: HomeScreen(),
));

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('SnackBar Demo'),
    ),
    body: Center(child: SelectButton()),
  );
}

class SelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context)  => RaisedButton(
      child: Text('Tap'),
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
  );

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    if (result == null) result = 'Back';

    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(result)));
  }
}

class SelectionScreen extends StatelessWidget {
  final String text1 = 'Button 1';
  final String text2 = 'Button 2';
  final String select = 'Select ';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Select Button'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text(text1),
              onPressed: () {
                Navigator.pop(context, select + text1);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text(text2),
              onPressed: () {
                Navigator.pop(context, select + text2);
              },
            ),
          ),
        ],
      )
    ),
  );
}
