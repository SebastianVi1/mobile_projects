import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_model.dart';
import 'package:to_do/task_viewmodel.dart';

class WAddTaskButton extends StatefulWidget {
  const WAddTaskButton({super.key});

  @override
  State<WAddTaskButton> createState() => _WAddTaskButtonState();
}

class _WAddTaskButtonState extends State<WAddTaskButton> {
  TextEditingController _nameController = TextEditingController();
  
  @override 
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskViewModel>(context);
    

    return Container(
      alignment: Alignment.bottomRight,
      child: Padding(
        
        padding: const EdgeInsets.only(right: 8.0, top: 10),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          
          onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: (BuildContext context){
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              hintText: 'Write a task',
                            ),
                          ),
                          
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                            foregroundColor: WidgetStatePropertyAll(Colors.white),
                          ),
                          onPressed: (){
                            if (_nameController.text.isEmpty){
                              return;
                            }
                            provider.addTask(Task(_nameController.text, 'no-description'));
                            _nameController.clear();
                          }, 
                          child: Text('Save Task'))
                      ],
                    ),
                  ),
                );
              });
          },
          label: Text('NewTask   +')),
          
      ),
    );
  }
}

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
