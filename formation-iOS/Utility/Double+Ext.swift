//
//  Double+Ext.swift
//  formation-iOS
//
//  Created by svetlana.lesik on 12/03/2022.
//

import Foundation

extension Double {
    func toMassString() -> String {
        return String(format: "%.0f",self)
    }
    
    func toHeightString() -> String {
        return String(format: "%.1f",self)
    }
}
