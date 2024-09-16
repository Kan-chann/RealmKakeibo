//
//  ShoppingItem.swift
//  RealmKakeibo
//
//  Created by Kanno Taichi on 2024/09/16.
//

import Foundation
import RealmSwift

class ShoppingItem : Object{
    @Persisted var title : String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked :Bool = false
}
