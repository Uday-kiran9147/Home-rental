void main() {

  List<String> belongs=[];

  Map<String, bool> category = {
    'pool': false,
    'beach': false,
    "Lakefront": false,
    "windmill": false,
    "historical_home": true,
    "private_home": false,
    "National_Park": false,
    "Trending": false,
    "Island": true,
    "Camping": false,
  };
  final res=getKeysWithTrueValues(category);
  belongs=res;
  print(belongs.toList());

}

List<String> getKeysWithTrueValues(Map<String, bool> myMap) {
  List<String> result = [];
  for (var entry in myMap.entries) {
    if (entry.value == true) {
      result.add(entry.key);
    }
  }
  return result;
}
