import 'package:e_commers/ranking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/detail_responce.dart';

class Seconpage extends StatefulWidget {
  List<CategoryProduct> subCat;

  Seconpage({this.subCat});

  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Seconpage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _buildListview());
  }

  Widget _buildListview() {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.subCat.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.subCat.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${widget.subCat[index].name}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Fourthpage(
                                        proDetail: [widget.subCat[index]],
                                      ))
                              );
                        },
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("No data found!"),
                )
        ],
      ),
    );
  }
}
