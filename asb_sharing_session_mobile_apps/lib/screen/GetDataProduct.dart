import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/list_product.dart';
// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
// dio
import 'package:dio/dio.dart';
import 'DetailProduct.dart';

class GetDataProduct extends StatefulWidget {
  // const GetDataProduct({ Key? key }) : super(key: key);

  @override
  _GetDataProductState createState() => _GetDataProductState();
}

class _GetDataProductState extends State<GetDataProduct> {

  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  Future<ListProduct> listProduct;
  Future<ListProduct> getListProduct() async{
    // fetch data from api  
    var dio = Dio();
    // dio.options.headers['content-Type'] = 'application/json';
    // dio.options.headers["authorization"] = "token ${token}";
    final response = await dio.get('http://192.168.1.7:8069/api/v1/product/',
    options: Options(headers: {"Content-Type":"application/json"}),);
    // https://api-berita-indonesia.vercel.app/cnbc/market/
    // https://api-berita-indonesia.vercel.app/cnbc/news/
    // print(response.data);
    if (response.statusCode == 200) {
      return ListProduct.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState(){
    super.initState();
    listProduct = getListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: FutureBuilder(
        future: listProduct,
        builder: (context, snapshot){
          if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: 
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    )
                  ,),
                );
              }else {
          return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Container(
                          color:Colors.grey[200],
                          height: 80,
                          width: 90,
                          child: 
                              Image.network(snapshot.data.result[index].image)
                        ),
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(
                        //       '${snapshot.data.data.posts[index].thumbnail}'),
                        // ),
                        title: Text(
                          "${ snapshot.data.result[index].name}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c) => DetailProduct(
                            url: snapshot.data.result[index].image,
                            title: snapshot.data.result[index].name,
                            qty: snapshot.data.result[index].qtyAvailable,
                            price: snapshot.data.result[index].price,
                          ))
                          
                          );
                        },
                      );
                });
          }
        },
        ),
    );
  }
}