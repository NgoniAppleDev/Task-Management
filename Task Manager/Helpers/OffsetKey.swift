//
//  OffsetKey.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 11/4/2025.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
