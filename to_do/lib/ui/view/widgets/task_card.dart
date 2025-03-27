import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_model.dart';
import 'package:to_do/task_viewmodel.dart';


class WListTaskCard extends StatefulWidget {
  const WListTaskCard({super.key,required this.task});
  final Task task;

  @override
  State<WListTaskCard> createState() => _WListTaskCardState();
}

class _WListTaskCardState extends State<WListTaskCard> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskViewModel>(context);
    return Card(
      
      child: ListTile(
        onTap: () {},
          
          leading: Checkbox(
          value: widget.task.isCompleted, 
          
          onChanged: (bool? newValue){
            provider.completeTask(widget.task);
            
          }
          
        ),
        title: Text(
          widget.task.name, 
          style: TextStyle(
            decoration: widget.task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            color: widget.task.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            _dialogBuilder(context);
            
          }, 
          icon: Icon(Icons.delete, color: Colors.red[900],),
          
        ),
      )
    );
  }

Future<void> _dialogBuilder(BuildContext context){
    var provider = Provider.of<TaskViewModel>(context, listen: false);
  return showDialog(
    context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure you want to deleate the task?'),
        content: const Text('Seguro perro'),
        actions: [
          TextButton(
            onPressed: (){

              Navigator.pop(context);

            }, 
            child: Text('Cancel')
            ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red[900]),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            
            onPressed: () {
              
              provider.removeTask(widget.task);
              Navigator.pop(context);
              
            },
            child: Text('Confirm'),
          )
        ],
      );
    });
  }

 
}


