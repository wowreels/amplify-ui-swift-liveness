//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

struct LoadingPageView: View {
    
    var body: some View {
        VStack {
            InstructionView(
                text: LocalizedStrings.challenge_connecting,
                backgroundColor: .livenessSecondaryBackground,
                textColor: .black,
                font:  Font.custom("OceanicGothic-Bold", size: 17),
                showLoading: false
            )
            .padding(.top, 52)
            Spacer()
        }
    }
}

struct LoadingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPageView()
    }
}
