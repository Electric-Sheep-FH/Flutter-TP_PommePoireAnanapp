import 'package:flutter/material.dart';

class Banartwork extends StatefulWidget {
  const Banartwork({super.key});
  
  @override
  State<Banartwork> createState() => _BanartwordState();
}

class _BanartwordState extends State<Banartwork> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: isPrimeTitle(_count),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _count,
        prototypeItem: ListTile(
          title: Text('$_count'),
        ),
        itemBuilder: (context, index) {
          return isPrimeTile(index);
        },
      ),
      floatingActionButton: 
        buttonColorChanger(_count),
    );
  }
  void _pressedButton() {
    setState(() {
      _count++;
    });
  }

  FloatingActionButton buttonColorChanger (int counter) {
    if (counter == 0) {
      return FloatingActionButton(
        onPressed: _pressedButton,
        backgroundColor: Colors.deepOrange,
        child: const Text('+',
        style: TextStyle(color: Colors.white),
        ),
      );
    } else if ((counter+1) % 2 == 0) {
      return FloatingActionButton(
        onPressed: _pressedButton,
        backgroundColor: Colors.indigoAccent,
        child: const Text('+',
        style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return FloatingActionButton(
        onPressed: _pressedButton,
        backgroundColor: Colors.cyanAccent,
        child: const Text('+',
        style: TextStyle(color: Colors.black),
        ),
      );
    }
  }

  bool isPrimeNumber(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  ListTile isPrimeTile(int index) {
    bool primeNumber = isPrimeNumber(index+1);
    if (primeNumber) {
      return ListTile(
              leading: const Image(image: AssetImage('images/ananas.png'),),
              title: Text('${index + 1}',
              style: const TextStyle(color: Colors.white),
              ),
              tileColor: (index+1) % 2 == 0 ? Colors.indigoAccent : Colors.cyanAccent,
            );
    } else {
      if ((index+1) % 2 == 0) {
        return ListTile(
              leading: const Image(image: AssetImage('images/poire.png'),),
              title: Text('${index + 1}',
              style: const TextStyle(color: Colors.white),
              ),
              tileColor: Colors.indigoAccent,
            );
      } else {
        return ListTile(
              leading: const Image(image: AssetImage('images/pomme.png'),),
              title: Text('${index + 1}',
              style: const TextStyle(color: Colors.white),
              ),
              tileColor: Colors.cyanAccent,
            );
      }
    }
  }

  Text isPrimeTitle(int counter) {
    bool primeNumber = isPrimeNumber(counter);
    if(counter == 0) {
      return const Text('Cliquez en bas à droite !');
    } else {
      if (primeNumber) {
        return Text('$counter : Nombre premier');
      } else {
        if (counter % 2 == 0) {
          return Text('$counter : Nombre pair');
        } else {
          return Text('$counter : Nombre impair');
        }
      }
    }
  }
}