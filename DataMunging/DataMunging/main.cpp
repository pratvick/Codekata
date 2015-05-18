//
//  main.cpp
//  DataMunging
//
//  Created by Prateek Khandelwal on 5/18/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#include <iostream>
#include <vector>
#include <cstdlib>
#include <fstream>

using namespace std;

vector <string> particularColumn(string columnHeading, string filePath) {
  int i, col;
  vector <string> v;
  ifstream file;
  file.open(filePath);
  string line;
  string value;
  getline(file, line);
  col = int(line.find(columnHeading));
  while (getline(file, line)) {
    i = col;
    value = "";
    while ((i < line.length()) && !((line[i] >= '0' && line[i] <= '9') || (line[i] >= 'a' && line[i] <= 'z') || (line[i] >= 'A' && line[i] <= 'Z') || (line[i] == '_'))) {
      i++;
    }
    while((i < line.length()) && ((line[i] >= '0' && line[i] <= '9') || (line[i] >= 'a' && line[i] <= 'z') || (line[i] >= 'A' && line[i] <= 'Z') || (line[i] == '_'))) {
      value += line[i];
      i++;
    }
    if (value != "") {
      v.push_back(value);
    }
  }
  return v;
}

int convertStringIntoInteger(string s) {
  int number = 0;
  for (int i = 0; i < s.size(); i++) {
    if (s[i] >= '0' && s[i] <= '9') {
      number *= 10;
      number += s[i] - '0';
    }
  }
  return number;
}

int minDiffIndex(vector<string> v1, vector<string> v2, int low, int high) {
  int min = INT32_MAX, minIndex = 0;
  for (int i = low; i <= high; i++) {
    if (min > abs(convertStringIntoInteger(v1[i]) - convertStringIntoInteger(v2[i]))) {
      min = abs(convertStringIntoInteger(v1[i]) - convertStringIntoInteger(v2[i]));
      minIndex = i;
    }
  }
  return minIndex;
}

int main() {
  vector <string> v1, v2, names, day;

  v1 = particularColumn("MxT", "weather.txt");
  v2 = particularColumn("MnT", "weather.txt");
  day = particularColumn("Dy", "weather.txt");
  cout << day[minDiffIndex(v1, v2, 0, int(v1.size()) - 2)] << endl;
  
  names = particularColumn("Team", "football.txt");
  v1 = particularColumn("F", "football.txt");
  v2 = particularColumn("A", "football.txt");
  cout << names[minDiffIndex(v1, v2, 0, int(v1.size()) - 1)] << endl;
  
  return 0;
}
