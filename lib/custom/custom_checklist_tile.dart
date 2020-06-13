
import 'package:flutter/material.dart';

class CustomCheckList extends StatefulWidget {
  bool value;
  final String text;
  final List<String> itemsList;

  CustomCheckList({
    @required this.value,
    @required this.text,
    this.itemsList
});
  @override
  _CustomCheckListState createState() => _CustomCheckListState();
}

class _CustomCheckListState extends State<CustomCheckList> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 1)
        ),
        child: Theme(
          data: ThemeData(unselectedWidgetColor: Theme.of(context).primaryColor),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(widget.text, style: Theme.of(context).textTheme.headline2,),
            value: widget.value,
            checkColor: Theme.of(context).primaryColor,
            activeColor: Colors.transparent,
            onChanged: (newValue){
              setState(() {
                widget.value = newValue;
                if(widget.value == true){
                  widget.itemsList.add(widget.text);
                }else{
                  widget.itemsList.remove(widget.text);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
