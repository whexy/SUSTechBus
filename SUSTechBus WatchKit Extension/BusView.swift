//
//  ContentView.swift
//  SUSTechBus WatchKit Extension
//
//  Created by 石文轩 on 2020/6/17.
//  Copyright © 2020 石文轩. All rights reserved.
//

import SwiftUI

struct BusView: View {
    @State var busViewModel: BusViewModel = BusViewModel()

    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "chevron.up")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Group {
                                Text("欣园方向")
                                        .font(.headline)
                                Text("上一班 \(busViewModel.XinYuanPrevious)")
                                Text("下一班 \(busViewModel.XinYuanNext)")
                                        .foregroundColor(Color.red)
                            }
                        }
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "chevron.down")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Group {
                                Text("科研楼方向")
                                        .font(.headline)
                                Text("上一班 \(busViewModel.KeYanLouPrevious)")
                                Text("下一班 \(busViewModel.KeYanLouNext)")
                                        .foregroundColor(Color.red)
                            }
                        }
                    }
                }
                VStack {
                    Group {
                        if busViewModel.isOnWeekDay {
                            Text("今天校巴按工作日运行")
                                    .fontWeight(.light)
                        } else {
                            Text("今天校巴按节假日运行")
                                    .fontWeight(.light)
                        }
                    }
                    Text("当前时间 \(busViewModel.currentTime)")
                            .fontWeight(.light)
                            .onTapGesture {
                                self.busViewModel = BusViewModel()
                            }
                }
                        .font(.footnote)
                        .foregroundColor(Color.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BusView()
    }
}
