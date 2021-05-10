import 'package:e_commers/product.dart';
import 'package:flutter/material.dart';
import 'custom/progress_dialouge.dart';
import 'model/detail_responce.dart';
import 'service/auth_service.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: FirstApp(),
    ));

class FirstApp extends StatefulWidget {
  @override
  _FirstAppState createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  ApiAuthProvider apiAuthProvider = ApiAuthProvider();
  var catList = List<Category>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _callAPi();
    });
  }

  _callAPi() async {
    CustomDialog customDialog = CustomDialog();
    customDialog.initDiaog(context);
    customDialog.showDialog();
    DetailResponse detailResponse = await apiAuthProvider.getProducts();
    customDialog.hide();
    setState(() {
      catList.addAll(detailResponse.categories);
    });

    // print("object---${detailResponse.toJson()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _buildListview());
  }

  Widget _buildListview() {
    return SingleChildScrollView(
      child: Column(
        children: [
          catList.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: catList.length,
                  itemBuilder: (context, index) {
                    String item;
                    return Card(
                      child: ListTile(
                        title: Text('${catList[index].name}'),
                        // onTap: () => {getItemAndNavigate(item, context)}
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Seconpage(subCat: catList[index].products,)));
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
