import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final void Function(String inputValue) onSubmitted;
  final void Function(String inputValue) onChanged;
  final String search;

  const Search({Key key, @required this.onSubmitted, @required this.onChanged, this.search}) : super(key: key);

  @override
  _StateSearch createState() => _StateSearch();
}

class _StateSearch extends State<Search> {
  bool isFinding;
  final ctrl = TextEditingController();
  final node = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isFinding = widget.search != null;
    ctrl.text = widget.search;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final icon = IconButton(
        icon: Icon(isFinding ? Icons.cancel : Icons.search),
        onPressed: () {
          if (isFinding) {
            widget.onSubmitted?.call("");
            ctrl.clear();
          }
          setState(() {
            isFinding = !isFinding;
          });
        });

    if (!isFinding) return icon;
    return Row(
      children: <Widget>[
        SizedBox(
          height: 35,
          width: 300,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.brown.shade200, borderRadius: BorderRadius.circular(5)),
            child: EditableText(
                forceLine: false,
                controller: ctrl,
                focusNode: node,
                autofocus: true,
                style: TextStyle(fontSize: 20),
                cursorColor: Colors.brown,
                onSubmitted: (str) {
                  setState(() {
                    isFinding = !isFinding;
                  });
                  widget.onSubmitted?.call(str);
                },
                onChanged: (str) {
                  try {
                    fn.log("ok");
                  } catch (e) {
                    fn.log(error: e);
                  }
                  widget.onChanged(str);
                },
                textInputAction: TextInputAction.search,
                backgroundCursorColor: Colors.brown),
          ),
        ),
        icon
      ],
    );
  }
}
