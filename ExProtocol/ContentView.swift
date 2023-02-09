//
//  ContentView.swift
//  ExProtocol
//
//  Created by 소하 on 2023/02/09.
//

import SwiftUI

struct ContentView: View {
    @State private var viewIndex = 0
    @State private var people = 0
    @State private var money = ""
    @State private var isShow = false
    @State private var msg = ""
    private var divider:DivideMoney = DivideMoney()
    @FocusState private var isFocused: Bool

    // tapGesture 조건부사용
    private var tapGesture: some Gesture {
        isFocused ?
        (TapGesture().onEnded {
            isFocused = false
        }) : nil
    }
    
    var body: some View {
        TabView(selection: $viewIndex) {
            ZStack {
                VStack {
                    // 나누어야할 금액입력
                    TextField("나눌 금액을 입력하세요", text: $money)
                        .focused($isFocused)
                        .frame(width: 300)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding(18)
                    // 나눌 인원설정
                    Stepper(value: $people, in: 1...10) {
                        Text(people < 2 ? "나누어야할 인원" : "\(people)")
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
            .tabItem {
                Image(systemName: "person.3.sequence.fill")
                Text("돈나누기")
            }
            .tag(0)
            GaterViewView()
                .tabItem {
                    Image(systemName: "arrow.up.bin.fill")
                    Text("돈모으기")
                }.tag(1)
        }
    }
    // 결과보여주기
    func showResult() {
        msg = ""
        // 입력 예외처리
        if money.isEmpty { return }
        guard let inputMoney = Int(money) else { return }
        if people < 2 || inputMoney < 1 { return }
        // 계산 후 메세지 출력
        divider.enterData(moeny: inputMoney, count: people)
        msg = divider.printResult()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
