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
                borderColor: .white,
                fillColor: .livenessPrimaryBackground,
                indicatorColor: .livenessPrimaryBackground,
                percentage: percentage
            )
            .frame(width: 200, height: 30)
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
                borderColor: .white,
                fillColor: .livenessPrimaryBackground,
                indicatorColor: .livenessPrimaryBackground,
                percentage: 0.2
            )
            .frame(width: 200, height: 30)
        case .pendingFacePreparedConfirmation(let reason):
            InstructionView(
                text: .init(reason.localizedValue),
                backgroundColor: reason == .pendingCheck ? .clear : .livenessSecondaryBackground,
                textColor: .black,
                font: messageFont
            )
        case .completedDisplayingFreshness:
            InstructionView(
                text: LocalizedStrings.challenge_verifying,
                backgroundColor: .livenessSecondaryBackground,
                textColor: .black,
                font: messageFont
            )
            .onAppear {
                UIAccessibility.post(
                    notification: .announcement,
                    argument: LocalizedStrings.challenge_verifying
                )
            }
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
}
