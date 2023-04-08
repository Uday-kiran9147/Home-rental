void main() {
  List<Map<String, dynamic>> map = [
    {
      "_id": "64318621a9b74c3b29a42413",
      "bookingdate": "2023-04-08 20:50:00.770945",
      "bookingid": "1680967200770",
      "checkin": "2023-04-25T18:30:00.000Z",
      "checkout": "2023-04-27T18:30:00.000Z",
      "bookingprice": 3015000,
      "guests": 2,
      "numberofdays": 2,
      "userid": "temperoryuserID",
      "houseid": "abcdefg12345hijkl",
      "__v": 0
    },
    {
      "_id": "643186b2a9b74c3b29a42416",
      "bookingdate": "2023-04-08 20:52:26.530658",
      "bookingid": "1680967346530",
      "checkin": "2023-04-11T18:30:00.000Z",
      "checkout": "2023-04-14T18:30:00.000Z",
      "bookingprice": 2260000,
      "guests": 1,
      "numberofdays": 3,
      "userid": "temperoryuserID",
      "houseid": "asdfghjkl12345qwerty",
      "__v": 0
    },
    {
      "_id": "64318717a9b74c3b29a42419",
      "bookingdate": "2023-04-08 00:37:01.471171",
      "bookingid": "1680894421471",
      "checkin": "2023-04-25T18:30:00.000Z",
      "checkout": "2023-04-28T18:30:00.000Z",
      "bookingprice": 3015000,
      "guests": 2,
      "numberofdays": 3,
      "userid": "temperoryuserID",
      "houseid": "abcdefg12345hijkl",
      "__v": 0
    }
  ];

  print(map[2]["userid"]);
}
