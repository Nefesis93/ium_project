import 'package:flutter/material.dart';

/*
app bar in alto con le sue funzioni
*/
class DefaultBar extends StatelessWidget implements PreferredSizeWidget{
  const DefaultBar({Key? key}) : super(key: key);
  
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Home"),
      leading: IconButton(
        onPressed: () => 0,
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        )
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => 0,
          icon: const Icon(
            Icons.account_circle
          )
        )
      ],  
    );
  }
}

/*
bottom app bar con le funzioni di tornare alla home, aggiungere degli appunti e vedere gli appunti del proprio account
*/
class DefaultBottomBar extends StatelessWidget implements PreferredSizeWidget{
  const DefaultBottomBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
              width: 196,
              decoration: const BoxDecoration(color: Colors.blue),
              child: IconButton(
                onPressed: () => 0,
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ) 
            ),
            Container(
              height: 40,
              width: 196,
              decoration: const BoxDecoration(color: Colors.blue),
              child: IconButton(
                onPressed: () => 0,
                icon: const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                )
              )
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => 0,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.blue,
            width: 2,
          )
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}