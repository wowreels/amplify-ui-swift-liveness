//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

struct _FaceLivenessDetectionView<VideoView: View>: View {
    let videoView: VideoView
    @ObservedObject var viewModel: FaceLivenessDetectionViewModel
    @Binding var displayResultsView: Bool

    init(
        viewModel: FaceLivenessDetectionViewModel,
        @ViewBuilder videoView: @escaping () -> VideoView
    ) {
        self.viewModel = viewModel
        self.videoView = videoView()

        self._displayResultsView = .init(
            get: { viewModel.livenessState.state == .completed },
            set: { _ in }
        )
    }

    var body: some View {
        ZStack {
            Color.black
            ZStack {
                videoView
                
                GeometryReader { geometry in
                    VStack {
                        HStack(alignment: .top) {
                            Spacer()
                            CloseButton(
                                action: viewModel.closeButtonAction
                            )
                        }
                        .padding(.trailing, 6)
                        
                        InstructionContainerView(
                            viewModel: viewModel
                        )
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
