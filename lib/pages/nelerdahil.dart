import 'package:etv/provider/nelerdahil_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_html/flutter_html.dart';

class NelerDahil extends StatefulWidget {
  const NelerDahil({
    Key key,
  }) : super(key: key);

  @override
  _NelerDahilState createState() => _NelerDahilState();
}

class _NelerDahilState extends State<NelerDahil> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NelerDahilProvider>().getDataaa();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NelerDahilProvider>();

    return Material(
      child: Container(
        child: Container(
          child: Consumer<NelerDahilProvider>(builder: (context, provider, _) {
            if (provider.isLoading) return CircularProgressIndicator();
            return Html(data: provider.myData.content, style: {
              'h1': Style(color: Colors.pink),
              'p': Style(color: Colors.red)
            });
          }),
        ),
      ),
    );
  }
}

class NelerdahilProvider {}
