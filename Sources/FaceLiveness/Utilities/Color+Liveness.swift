//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

extension Color {
    static let livenessPrimaryBackground = Color.dynamicColors(
        light: .hex("#FF5016"),
        dark: .hex("#FF5016")
    )

    static let livenessPrimaryLabel = Color.dynamicColors(
        light: .white,
        dark: .hex("#0D1926")
    )

    static let livenessBackground = Color.dynamicColors(
        light: .white,
        dark: .hex("#0D1926")
    )

    static let livenessLabel = Color.dynamicColors(
        light: .black,
        dark: .white
    )

    static let livenessErrorBackground = Color.dynamicColors(
        light: .hex("#950404"),
        dark: .hex("#EF8F8F")
    )

    static let livenessErrorLabel = Color.dynamicColors(
        light: .white,
        dark: .black
    )

    static let livenessWarningBackground = Color.dynamicColors(
        light: .hex("#B8CEF9"),
        dark: .hex("#663300")
    )

    static let livenessWarningLabel = Color.dynamicColors(
        light: .hex("#002266"),
        dark: .hex("#EFBF8F")
    )
    
    static let livenessPreviewBorder = Color.dynamicColors(
        light: .hex("#AEB3B7"), 
        dark: .white
    )
    
    static let progressEmptyBackground = Color.dynamicColors(
        light: .hex("#CDD1D7"),
        dark: .white
    )
    
    static let livenessSecondaryBackground = Color.dynamicColors(
        light: .hex("#F2F2F7"),
        dark: .white
    )
}

