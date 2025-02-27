
3. lib/main.dart

   Replace the contents of lib/main.dart with the code below:

   import 'package:flutter/material.dart';

   import 'dart:convert';
 
   import 'package:http/http.dart' as http;

   void main() {
  
      runApp(MyApp());
   }

   class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
    
               return MaterialApp(
      
      title: 'Random Quotes',
      
      theme: ThemeData(
        
      primarySwatch: Colors.blue,
      
      ),
      
      home: QuoteScreen(),
    );
  }
}

     class QuoteScreen extends StatefulWidget {
         @override
        _QuoteScreenState createState() => _QuoteScreenState();
     }  

     class _QuoteScreenState extends State<QuoteScreen> {
          String quote = 'Press the button to fetch a quote';

     // Function to fetch a random quote from the API
          Future<void> fetchQuote() async {
    
          final url = 'https://api.quotable.io/random';
          try {
      
             final response = await http.get(Uri.parse(url));
             if (response.statusCode == 200) {
        
                    final data = json.decode(response.body);
                    setState(() {
                    quote = data['content'];
                    });
             } 
             else {
                setState(() {
                quote = 'Failed to load quote. Please try again.';
             });
          }
    } catch (e) {
      setState(() {
        quote = 'Error: $e';
      });
    }
  }

       @override
       Widget build(BuildContext context) {
             
               return Scaffold(
      
        appBar: AppBar(
       
               title: Text('Random Quotes'),
      ),

        body: Center(

                child: Padding(
          
                padding: const EdgeInsets.all(16.0),
          
                child: Column(
            
                mainAxisAlignment: MainAxisAlignment.center,
            
                children: [
              
                Text(
                
                    quote,
                  
                    textAlign: TextAlign.center,
                
                    style: TextStyle(fontSize: 20.0),
              ),

                  SizedBox(height: 20.0),
          
                  ElevatedButton(
                
                      onPressed: fetchQuote,
                      child: Text('Fetch Quote'),
                 ),
              ],
            ),
          ),
        ),
      );
   }
}
