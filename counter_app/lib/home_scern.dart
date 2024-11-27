import 'package:flutter/material.dart';

class HomeScern extends StatefulWidget {
  const HomeScern({super.key});

  @override
  State<HomeScern> createState() => _HomeScernState();
}

class _HomeScernState extends State<HomeScern> {
  int _counter = 0; // Counter value

  // Function to show a SnackBar with a message
  void _showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2), // Message display duration
        behavior: SnackBarBehavior.floating, // Makes it appear floating
      ),
    );
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 260,
                  width: 260,
                  child: CircularProgressIndicator(
                    value: _counter / 100, // Adjust this as per requirement
                    strokeWidth: 8,
                    color: Colors.green,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_counter > 0){
                        _counter--;
                      }
                      else{
                        _showMessage("Cannot decrease below 0");
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(Icons.remove,size: 100,),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_counter < 100) {
                        _counter++;
                      }
                      else{
                        _showMessage("Max increase Count 100");
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(Icons.add,size: 100,),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              if(_counter>0){
                _resetCounter();
                _showMessage("Reset successfully");
              }
              else{
                _showMessage("Reset already successfully");
              }

            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                child: const Text("Reset",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50
                ),)
            ),
            const SizedBox(height: 20),
            Image.asset("assets/images/Screenshot.jpg",height: 150,width: double.infinity,),
          ],
        ),
      ),
    );
  }
}
