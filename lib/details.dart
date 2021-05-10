import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/detail_responce.dart';


class Thirdpage extends StatefulWidget {
  List<Ranking> ranks;

  Thirdpage({this.ranks});

  @override
  _ThirdpageState createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _buildListview());
  }

  Widget _buildListview() {
    return SingleChildScrollView(
      child: Column(
        children: [
          widget.ranks.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.ranks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text('${widget.ranks[index].ranking}')),
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
