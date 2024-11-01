import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Order _order = Order();

  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : null;
  }

  String _validateItemCount(String value) {
    int _int_value = value.isEmpty ? 0 : int.tryParse(value);
    return _int_value == 0 ? 'Atleast one item required' : null;
  }

  Void _submitOrder() {
    if (_formStateKey.currentState.validate()) {
      _formStateKey.currentState.save();
      print('Order Item ${_order.item}');
      print('Order Quantity ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidate: true,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Espression',
                        labelText: 'Item',
                      ),
                      validator: (value) => _validateItemRequired(value),
                      onSaved: (value) => _order.item = value,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: '3', labelText: 'Quantity'),
                      validator: (value) => _validateItemCount(value),
                      onSaved: (value) => _order.quantity = int.tryParse(value),
                    ),
                    Divider(height: 32.0),
                    RaisedButton(
                      child: Text('Save'),
                      color: Colors.lightGreen,
                      onPressed: () => _submitOrder())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Order {
  String item;
  int quantity;
}
