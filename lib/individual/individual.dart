import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapino/individual/IndividualProvider.dart';

class Individual extends StatelessWidget {
  const Individual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var individualProvider = Provider.of<IndividualProvider>(context);
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: individualProvider.pointMapIndividual.cover.isNotEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 200,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      individualProvider.pointMapIndividual.cover,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    individualProvider.pointMapIndividual.brand.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    "(${individualProvider.pointMapIndividual.message})",
                    style: const TextStyle(fontSize: 15, color: Colors.black45),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "(${individualProvider.pointMapIndividual.brand.description})",
                    style: const TextStyle(fontSize: 17, color: Colors.black45),
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}
