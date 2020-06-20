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
                            .font(.title)
                            .padding(.trailing)
                        VStack(alignment: .leading) {
                            Group {
                                Text("欣园方向")
                                    .font(.headline)
                                Text("上一班 \(busViewModel.XinYuanPrevious)")
                                Text("下一班 \(busViewModel.XinYuanNext)")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    
                    HStack {
                        Image(systemName: "chevron.down")
                            .font(.title)
                            .padding(.trailing)
                        VStack(alignment: .leading) {
                            Group {
                                Text("科研楼方向")
                                    .font(.headline)
                                Text("上一班 \(busViewModel.KeYanLouPrevious)")
                                Text("下一班 \(busViewModel.KeYanLouNext)")
                                    .foregroundColor(.red)
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
                }
                .font(.footnote)
                .foregroundColor(.secondary)
            }
        }
        .contextMenu {
            Button(action:refreshBus) {
                VStack {
                    Image(systemName: "arrow.clockwise.circle")
                    Text("Refresh")
                }
            }
        }
        
    }
    
    private func refreshBus() {
        self.busViewModel = BusViewModel()
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BusView()
    }
}
