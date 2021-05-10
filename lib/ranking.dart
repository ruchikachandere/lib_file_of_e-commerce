import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';
import 'model/detail_responce.dart';

class Fourthpage extends StatefulWidget {
  List<CategoryProduct> proDetail;

  Fourthpage({this.proDetail});

  @override
  _FourthpageState createState() => _FourthpageState();
}

class _FourthpageState extends State<Fourthpage> {
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
          widget.proDetail.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.proDetail.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${widget.proDetail[index].name}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Thirdpage()));
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
