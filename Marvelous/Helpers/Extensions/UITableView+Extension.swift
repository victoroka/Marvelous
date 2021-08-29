//
//  UITableView+Extension.swift
//  Marvelous
//
//  Created by Victor Oka on 29/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: cellType))
    }
    
    func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath) as! T
    }
    
}
