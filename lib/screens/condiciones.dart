import 'package:flutter/material.dart';


class CondicionesUso extends StatelessWidget {
  const CondicionesUso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "BCA Travel",
                  
                )),
                SizedBox(
                  width: 10,
                  height: 20,
                ),
                Center(
                    child: Text("Condiciones de uso!",
                         textAlign: TextAlign.center)),
                SizedBox(height: 20),
                Text(
                  "Aquí podrás encontrar toda la información referente sobre los diferentes perfiles que tiene nuestra app para iniciar sesión. ",
                  
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}