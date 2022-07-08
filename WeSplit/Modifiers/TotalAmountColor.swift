//
//  Watermark.swift
//  WeSplit
//
//  Created by Yusuf on 08/07/2022.
//

import Foundation
import SwiftUI

struct TotalAmountColor: ViewModifier {
    var totalAmount: Double

    func body(content: Content) -> some View {
        content
            .foregroundColor(totalAmount == 0 ? .red : .black)
    }
}
