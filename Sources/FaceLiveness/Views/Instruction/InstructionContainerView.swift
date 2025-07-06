//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI
import Combine

struct InstructionContainerView: View {
    @ObservedObject var viewModel: FaceLivenessDetectionViewModel

    private let messageFont = Font.custom("OceanicGothic-Bold", size: 17)
    var body: some View {
        if #available(iOS 17.0, *) {
            Group {
                switch viewModel.livenessState.state {
                case .displayingFreshness:
                    InstructionView(
                        text: LocalizedStrings.challenge_instruction_hold_still,
                        backgroundColor: .livenessPrimaryBackground,
                        textColor: .white,
                        font: messageFont
                    )
                    .onAppear {
                        UIAccessibility.post(
                            notification: .announcement,
                            argument: LocalizedStrings.challenge_instruction_hold_still
                        )
                    }
                    
                case .awaitingFaceInOvalMatch(.faceTooClose, _):
                    InstructionView(
                        text: LocalizedStrings.challenge_instruction_move_face_back,
                        backgroundColor: .livenessSecondaryBackground,
                        textColor: .black,
                        font: messageFont
                    )
                    .onAppear {
                        UIAccessibility.post(
                            notification: .announcement,
                            argument: LocalizedStrings.challenge_instruction_move_face_back
                        )
                    }
                    
                case .awaitingFaceInOvalMatch(let reason, let percentage):
                    InstructionView(
                        text: .init(reason.localizedValue),
                        backgroundColor: .livenessSecondaryBackground,
                        textColor: .black,
                        font: messageFont
                    )
                    
                    ProgressBarView(
                        emptyColor: .progressEmptyBackground,
                        borderColor: .progressEmptyBackground,
                        fillColor: .livenessPrimaryBackground,
                        indicatorColor: .livenessPrimaryBackground,
                        percentage: percentage
                    )
                    .frame(width: 200, height: 20)
                case .recording(ovalDisplayed: true):
                    InstructionView(
                        text: LocalizedStrings.challenge_instruction_move_face_closer,
                        backgroundColor: .livenessSecondaryBackground,
                        textColor: .black,
                        font: messageFont
                    )
                    .onAppear {
                        UIAccessibility.post(
                            notification: .announcement,
                            argument: LocalizedStrings.challenge_instruction_move_face_closer
                        )
                    }
                    
                    ProgressBarView(
                        emptyColor: .progressEmptyBackground,
                        borderColor: .progressEmptyBackground,
                        fillColor: .livenessPrimaryBackground,
                        indicatorColor: .livenessPrimaryBackground,
                        percentage: 0.2
                    )
                    .frame(width: 200, height: 20)
                case .pendingFacePreparedConfirmation(let reason):
                    InstructionView(
                        text: .init(reason.localizedValue),
                        backgroundColor: .livenessSecondaryBackground,
                        textColor: .black,
                        font: messageFont
                    )
                case .completedDisplayingFreshness, .completed:
                    InstructionView(
                        text: LocalizedStrings.challenge_verifying,
                        backgroundColor: .livenessSecondaryBackground,
                        textColor: .black,
                        font: messageFont,
                        showLoading: true
                    )
                    .onAppear {
                        UIAccessibility.post(
                            notification: .announcement,
                            argument: LocalizedStrings.challenge_verifying
                        )
                    }
                case .waitForRecording:
                    InstructionView(
                        text: LocalizedStrings.amplify_ui_liveness_face_not_prepared_reason_pendingCheck,
                        backgroundColor: .livenessSecondaryBackground,
                        textColor: .black,
                        font: messageFont,
                        showLoading: true
                    )
                case .faceMatched:
                    InstructionView(
                        text: LocalizedStrings.challenge_instruction_hold_still,
                        backgroundColor: .livenessPrimaryBackground,
                        textColor: .white,
                        font: messageFont
                    )
                default:
                    EmptyView()
                }
            }
            .onChange(of: viewModel.livenessState.state) { oldValue, newValue in
                print("Liveness State changed from \(oldValue) to \(newValue)")
            }
        } else {
            EmptyView()
            // Fallback on earlier versions
        }
    }
}
