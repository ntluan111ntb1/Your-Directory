//
//  ToastView.swift
//  Your Directory
//
//  Created by LuanNT29 on 10/07/2024.
//

import SwiftUI

struct ToastView: View {
    let message: String
    let state: Status
    var config: (background: Color, status: String) {
        switch state {
        case .success:
            return (Color.greenLight, "Success")
        case .fail:
            return (Color.red, "Fail")
        }
    }

    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 44, height: 44)
            VStack(alignment: .leading) {
                Text(config.status)
                    .fontStyle(.mediumBold)
                Text(message)
                    .fontStyle(.small)
            }
            Spacer()
        }
        .padding(8)
        .background(RoundedCornersShape(corners: .allCorners, radius: 12)
            .fill(config.background)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    ToastView(message: "Bạn đã thêm vocabulary thành công", state: .success)
}
