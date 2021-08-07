import 'package:flutter/material.dart';


class Todo extends StatefulWidget {
  final task;
  final date;
  final time;
  final Function delete;
  final Function update;

  const Todo({Key? key, this.task, this.date, this.time, required this.delete, required this.update}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${widget.task}",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("${widget.date}   ${widget.time}"),
                  ],
                ),
              ),
              IconButton(
                  onPressed: (){
                    widget.delete();
                    widget.update();
                    },
                    icon: Icon(
                    Icons.delete,
                    color: Colors.grey
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
