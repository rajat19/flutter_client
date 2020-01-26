import 'package:flutter/material.dart';
import 'service.dart';

void main() => runApp(MyApp());
Service service = new Service();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Client App')),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('Make GET (all) request'),
                onPressed: () {
                  service.makeGetAllRequest();
                },
              ),
              RaisedButton(
                child: Text('Make GET (one) request'),
                onPressed: () {
                  service.makeGetOneRequest();
                },
              ),
              RaisedButton(
                child: Text('Make POST request'),
                onPressed: () {
                  service.makePostRequest();
                },
              ),
              RaisedButton(
                child: Text('Make PUT request'),
                onPressed: () {
                  service.makePutRequest();
                },
              ),
              RaisedButton(
                child: Text('Make PATCH request'),
                onPressed: () {
                  service.makePatchRequest();
                },
              ),
              RaisedButton(
                child: Text('Make DELETE request'),
                onPressed: () {
                  service.makeDeleteRequest();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
