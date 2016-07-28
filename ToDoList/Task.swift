//
//  Task.swift
//  ToDoList
//
//  Created by Lukasz Matuszczak on 28/07/16.
//
//

import Foundation
import RealmSwift

class Task: Object {
    
   dynamic var priority:Int = 0
  dynamic  var name:String = ""
   dynamic var date:String = ""

    
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
