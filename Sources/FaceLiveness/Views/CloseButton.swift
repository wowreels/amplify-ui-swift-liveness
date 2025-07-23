//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void

    var body: some View {
        Button(
            action: {},
            label: {
//                Image(.xMark)
//                    .frame(width: 44, height: 44)
//                    .clipShape(Circle())
//                    .accessibilityLabel(Text(LocalizedStrings.close_button_a11y))
            }
        )
        .frame(width: 44, height: 44)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CloseButton(action: {})
        }
    }
}
