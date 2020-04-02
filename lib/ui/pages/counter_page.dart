import 'package:flutter/material.dart';
import 'package:reservationroomapp/logic/bloc/bloc_provider.dart';
import 'package:reservationroomapp/logic/bloc/increment_bloc.dart';

//ref:https://www.jianshu.com/p/4d5e712594b4

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream version of the Counter App"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext content, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // 我们正在监听流，每次有一个新值流出这个流时，我们用该值更新Text ;
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            );
          }, //
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          bloc.incrementCounter.add(null);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
