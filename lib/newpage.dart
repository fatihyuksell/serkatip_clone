import 'package:etv/provider/newpage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:etv/pages/main_page/buttonlist.dart';
import 'model/etv_model/products_model.dart';

class NewPage extends StatefulWidget {
  const NewPage({
    Key key,
    this.itemss,
    this.item,
  }) : super(key: key);

  final ProductsModel itemss;
  final ProductsModel item;

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewpageProvider>().getDataa(slug: widget.item.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Container(
          child: Consumer<NewpageProvider>(builder: (context, provider, _) {
            if (provider.isLoading) return CircularProgressIndicator();
            return Text(provider.myContent.toJson().toString());
          }),
        ),
      ),
    );
  }
}
