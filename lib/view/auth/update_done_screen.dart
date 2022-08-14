import 'package:flutter/material.dart';
import 'package:maakview_app/view/home/home_screen.dart';

class UpdateDone extends StatelessWidget {
  const UpdateDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Everything Is Up-To-Date',style: TextStyle(),),

            ElevatedButton(

                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home() ),
                  );

                },
                child: Text('Back to Home'))
          ],
        ),
      ),


    );
  }
}
