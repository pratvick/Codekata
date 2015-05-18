//
//  main.cpp
//  BloomFilter
//
//  Created by Prateek Khandelwal on 5/6/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <map>
#include "md5.h"

using namespace std;

#define BLOOM_FILTER_SIZE 10000000
#define SMALL_MODULUS 99991
#define LARGE_MODULUS 999983
#define LARGEST_MODULUS 9999991

static const char alphanum[] = "abcdefghijklmnopqrstuvwxyz";
bitset <BLOOM_FILTER_SIZE> bitmap;

int calculateHashValueFromFirstFunction(string smallerHashString) {
  int hashValue = 1;
  for (int i = 0; i < smallerHashString.size(); i++) {
    hashValue *= int(smallerHashString[i]);
    hashValue %= LARGEST_MODULUS;
  }
  return hashValue;
}

int calculateHashValueFromSecondFunction(string smallerHashString){
  int hashValue = 0;
  for (int i = 0; i < smallerHashString.size(); i++) {
    int value = 1;
    for (int j = 0; j <= i; j++) {
      value *= smallerHashString[i];
      value %= LARGEST_MODULUS;
    }
    hashValue += value;
  }
  return hashValue % LARGEST_MODULUS;
}

int calculateHashValue(string md5sum, int i, int k, int (*f)(string)) {
  string smallerHashString = md5sum.substr(i * k, k);
  return f(smallerHashString);
}

void setBitmapForWord(string word, int n) {
  int hashValue;
  string md5sum = md5(word);
  for (int i = 0; i < n; i++) {
    int (*hashFunction)(string);
    hashFunction = &calculateHashValueFromSecondFunction;
    hashValue = calculateHashValue(md5sum, i, (32/n), hashFunction);
    bitmap.set(hashValue, 1);
  }
}

int checkBitmapForWord(string word, int n){
  string md5sum;
  int hashValue;
  md5sum = md5(word);
  for (int i = 0; i < n; i++) {
    int (*hashFunction)(string);
    hashFunction = &calculateHashValueFromSecondFunction;
    hashValue = calculateHashValue(md5sum, i, 32/n, hashFunction);
    if (!bitmap.test(hashValue)) {
      return 0;
    }
  }
  return 1;
}

int countNumberOfCollisions(map <string, int> m, int numberOfWords) {
  string str;
  int collision = 0;
  for (int j = 0; j < numberOfWords; j++) {
    str = "";
    for(int i = 0; i < 5; i++) {
      str += alphanum[rand() % (sizeof(alphanum) - 1)];
    }
    if (checkBitmapForWord(str, 4) == 1 && !m[str]) {
      collision++;
    }
  }
  return collision;
}

int main() {
  ifstream file;
  string word;
  map <string, int> m;
  file.open("/usr/share/dict/words");
  while (getline(file, word)){
    m[word] = 1;
    setBitmapForWord(word, 4);   //8
  }
  cout << countNumberOfCollisions(m, 10000)/100.0 << "%" << endl;
  return 0;
}
