import 'package:check_value_show/constant/strings.dart';
import 'package:flutter/material.dart';

class ShowSelectionData extends StatefulWidget {
  const ShowSelectionData({Key? key}) : super(key: key);

  @override
  State<ShowSelectionData> createState() => _ShowSelectionDataState();
}

class _ShowSelectionDataState extends State<ShowSelectionData> {
  bool? boolCheck;
  List<String>? selectedList;
  @override
  void initState() {
    selectedList = preferences.getStringList('selectList');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedList == null) {
      print(
          "$selectedList *****************************************************************************************************");
      return circulerProgress();
    } else {
      return listOfId();
    }
  }

  //no items
  Scaffold circulerProgress() {
    return const Scaffold(
      body: Center(
        child: Text("No one selected items."),
      ),
    );
  }

  //list of items
  Scaffold listOfId() {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: selectedList?.length,
          itemBuilder: (context, index) {
            String? data = selectedList?[index];
            data = data?.replaceAll("]", " ");
            data = data?.replaceAll("[", " ");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data?.replaceAll(' ', "\n\n")}",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       preferences.clear();
      //     });
      //   },
      //   tooltip: "Clear All",
      //   child: Icon(Icons.clear_all),
      // ),
    );
  }
}
