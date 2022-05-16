import 'package:check_value_show/constant/strings.dart';
import 'package:check_value_show/model/model.dart';
import 'package:check_value_show/provider/get_api_provider.dart';
import 'package:check_value_show/screens/selection_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetProvider getProvider = GetProvider();

  @override
  void initState() {
    getProvider = Provider.of<GetProvider>(context, listen: false);

    getProvider.getApiProvider();

    super.initState();
  }

  List selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<GetProvider>(builder: (context, textValu, child) {
          CustomApiModel<ApiModel> nData = textValu.customModel;
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: listViewBuilder(nData),
              ),
              submitButton(nData, context)
            ],
          );
        }),
      ),
    );
  }

  // submit button
  Widget submitButton(CustomApiModel<ApiModel> nData, BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(22),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShowSelectionData(),
            ),
          );
        },
        child: const Text("Submit your selectios"),
      ),
    );
  }

  // list view builder
  Widget listViewBuilder(CustomApiModel<ApiModel>? nData) {
    List<Results>? data = nData?.data?.result;
    if (data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text("${data[index].id}"),
            ),
            leading: Checkbox(
              onChanged: (a) async {
                setState(() {
                  data[index].boolList = a!;
                });
                if (data[index].boolList == true) {
                  selectedList.add(data[index].id);
                } else {
                  selectedList.remove(data[index].id);
                }
                //^ set data on Shared pref.
                preferences.setStringList('selectList', ["$selectedList"]);
              },
              value: data[index].boolList,
            ),
          );
        },
      );
    }
  }
}
