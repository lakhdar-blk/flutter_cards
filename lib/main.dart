import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}


class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: 'This is Addidas, the price is 1400 dollars', author: 'addidas'),
    Quote(text: 'This is Nike, the price is 1200 dollars', author: 'Nike'),
    Quote(text: 'This Armani, the price is 780 dollars', author: 'Armani'),
    Quote(text: 'Hello, this a new card added by the developer', author: 'Lakhdar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome clothes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        
        children: quotes.map((quote)
        {
          //return Text('${quote.text} created by ${quote.author}');
          return QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
          );
        } ).toList(),

      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
   QuoteCard({
    super.key,
    required this.quote,
    required this.delete
  });

  final quote;
  final delete;

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Text(quote.text, style: TextStyle(fontSize: 18, color: Colors.blue),), 
          SizedBox(height: 10,),
          Text(quote.author, style: TextStyle(fontSize: 15, color: Colors.black),),

          SizedBox(height: 10,),
          ElevatedButton.icon(
            onPressed: delete, icon: Icon(Icons.delete), label: Text('Remove'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),)
          ]),
      ),
    );
  }
}

