// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/models/list_product.dart';
import 'package:intl/intl.dart';

class DetailProduct extends StatelessWidget {

  final url;
  final title;
  final qty;
  final price;
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');

  DetailProduct(
    {this.url, 
    this.title,
    this.qty,
    this.price}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          url != null ? Image.network(url) : Container(
            height: 250,
            color: Colors.grey[200],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: <Widget>[
                Text(
                  '${title}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Quantity : ${qty != null ? qty : '-'}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic
                  )
                ),
                SizedBox(height: 5,),

                Divider(),
                Text('Harga : ${formatCurrency.format(price)}'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        tooltip: 'Back',
        splashColor: Colors.green[500],
        onPressed: ()=> Navigator.pop(context)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}