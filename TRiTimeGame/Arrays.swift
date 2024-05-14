//
//  Arrays.swift
//  TRiTimeGame
//
//  Created by Milo Ullman on 11/4/24.
//

import Foundation

func removeDuplicateElements(arr: [String]) -> [String] {
   var uniqueElements: [String] = []
   for x in arr {
      if !uniqueElements.contains(x) {
         uniqueElements.append(x)
      }
   }
   return uniqueElements
}
