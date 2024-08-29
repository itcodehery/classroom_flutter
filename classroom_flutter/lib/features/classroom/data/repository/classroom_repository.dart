class ClassroomRepository {
  // static Map<String, String> teachersTemporary = {
  //   'Artificial Intelligence': 'Dr. Roshini',
  //   'Data Analytics': 'Dr. Pradeep Kumar Kenny',
  //   'Data Mining': 'Dr. Nayana',
  //   'Web Programming': 'Dr. Nayana',
  //   'Intellectual Property Rights': 'Dr. Ramakrishna',
  //   'IS: Cloud Computing': 'Mr. Avinash',
  // };

  //change it into a Map<String, dynamic> to include the class id in the string part
  static Map<String, dynamic> teachersTemporary = {
    // 'Artificial Intelligence': {'teacher': 'Dr. Roshini', 'id': '1'},
    // 'Data Analytics': {'teacher': 'Dr. Pradeep Kumar Kenny', 'id': '2'},
    // 'Data Mining': {'teacher': 'Dr. Nayana', 'id': '3'},
    // 'Web Programming': {'teacher': 'Dr. Nayana', 'id': '4'},
    // 'Intellectual Property Rights': {'teacher': 'Dr. Ramakrishna', 'id': '5'},
    // 'IS: Cloud Computing': {'teacher': 'Mr. Avinash', 'id': '6'},
    'ai1': {
      'teacher': 'Dr. Roshini',
      'id': '1',
      'name': 'Artificial Intelligence'
    },
    'da2': {
      'teacher': 'Dr. Pradeep Kumar Kenny',
      'id': '2',
      'name': 'Data Analytics'
    },
    'dm3': {'teacher': 'Dr. Nayana', 'id': '3', 'name': 'Data Mining'},
    'wp4': {'teacher': 'Dr. Nayana', 'id': '4', 'name': 'Web Programming'},
    'ipr5': {
      'teacher': 'Dr. Ramakrishna',
      'id': '5',
      'name': 'Intellectual Property Rights'
    },
    'iscc6': {
      'teacher': 'Mr. Avinash',
      'id': '6',
      'name': 'IS: Cloud Computing'
    },
  };
}
