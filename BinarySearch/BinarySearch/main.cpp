//
//  main.cpp
//  BinarySearch
//
//  Created by Prateek Khandelwal on 4/8/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <cstdio>

using namespace std;

int binarySearchIterative(int target, int *a, int n) {
  int lo = 0, hi = n - 1, mid;
  while (lo <= hi) {
    mid = (lo + hi) / 2;
    if (a[mid] == target) {
      return mid;
    } else if (a[mid] < target) {
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
  return -1;
}

int binarySearchRecursive(int target, int *a, int n) {
  int mid = n / 2, rightMid;
  if (n == 1 && *a != target) {
    return -1;
  }
  if (*(a + mid) == target) {
    return mid;
  } else if (*(a + mid) < target && (rightMid = binarySearchRecursive(target, a + mid, n - n/2)) != -1) {
    return mid + rightMid;
  } else {
    return binarySearchRecursive(target, a, n/2);
  }
}

int binarySearchRecursive1(int target, int *a, int n, int low) {
  int mid = n / 2;
  if (n == 1 && *a != target) {
    return -1;
  }
  if (*(a + mid) == target) {
    return low + mid;
  } else if (*(a + mid) < target) {
    return binarySearchRecursive1(target, a + mid, n - mid, low + mid);
  } else {
    return binarySearchRecursive1(target, a, mid, low);
  }
}

int main () {
  int n, target;
  cin >> n;
  int a[n];
  for (int i = 0; i < n; i++) {
    cin >> a[i];
  }
  cin >> target;
  cout << binarySearchIterative(target, a, n) << endl;
  cout << binarySearchRecursive(target, a, n) << endl;
  cout << binarySearchRecursive1(target, a, n, 0) << endl;
  return 0;
}