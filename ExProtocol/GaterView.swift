//
//  GaterViewView.swift
//  ExProtocol
//
//  Created by 소하 on 2023/02/09.
//

import SwiftUI

struct GaterViewView: View {
    @State private var month = 0
    @State private var money = ""
    @State private var isShow = false
    @State private var msg = ""
    private var gather:GatherMoney = GatherMoney()
    @FocusState private var isFocused: Bool
    
    // tapGesture 조건부사용
    private var tapGesture: some Gesture {
        isFocused ?
        (TapGesture().onEnded {
            isFocused = false
        }) : nil
    }
    
    var body: some View {
        ZStack {
            VStack {
                // 나누어야할 금액입력
                TextField("모을 금액을 입력하세요", text: $money)
                    .focused($isFocused)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding(18)
                // 기간 설정
                Stepper(value: $month, in: 0...10) {
                    Text(month < 1 ? "기간 설정" : "\(month)개월")
                }
                .frame(width: 300)
                // 계산버튼
                Button {
                    showResult()
                } label: {
                    Text("계산하기")
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(10)
                .padding(60)
                // 결과 메세지 창
                Text(msg)
                    .foregroundColor(.red)
            }
            .padding(EdgeInsets(top: 30, leading: 18, bottom: 30, trailing: 18))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .gesture(tapGesture)
    }
    // 결과보여주기
    func showResult() {
        msg = ""
        // 입력 예외처리
        if money.isEmpty { return }
        guard let inputMoney = Int(money) else { return }
        if month < 1 || inputMoney < 1 { return }
        // 계산 후 메세지 출력
        gather.enterData(moeny: inputMoney, count: month)
        msg = gather.printResult()
    }
}

struct GaterViewView_Previews: PreviewProvider {
    static var previews: some View {
        GaterViewView()
    }
}
