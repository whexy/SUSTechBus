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
                    BusTableView(direction: "欣园", previous: busViewModel.XinYuanPrevious, next: busViewModel.XinYuanNext, iconName: "chevron.up")
                    
                    BusTableView(direction: "科研楼", previous: busViewModel.KeYanLouPrevious, next: busViewModel.KeYanLouNext, iconName: "chevron.down")
                }
                
                VStack {
                    BusWorkView(isOnWeekDay: busViewModel.isOnWeekDay)
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
                    Image(systemName: "arrow.clockwise")
                        .font(.title)
                    Text("更新时间")
                }
            }
            
            Button(action: switchMode){
                VStack {
                    Image(systemName: "clock")
                        .font(.title)
                    Text("变更运行模式")
                }
            }
        }
        
    }
    
    private func refreshBus() {
        self.busViewModel = BusViewModel()
    }
    
    private func switchMode() {
        self.busViewModel.isOnWeekDay.toggle()
    }
    
}

struct BusTableView: View {
    var direction: String
    var previous: String
    var next: String
    var iconName: String
    
    var body : some View {
        HStack {
            Image(systemName: iconName)
                .font(.title)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Group {
                    Text("\(direction)方向")
                        .font(.headline)
                    Text("上一班 \(previous)")
                    Text("下一班 \(next)")
                        .foregroundColor(.red)
                }
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BusView()
            BusTableView(direction: "欣园", previous: "08:00", next: "09:00", iconName: "chevron.down")
        }
    }
}

struct BusWorkView: View {
    var isOnWeekDay: Bool
    
    var body: some View {
        Group {
            if isOnWeekDay {
                Text("今天校巴按工作日运行")
                    .fontWeight(.light)
            } else {
                Text("今天校巴按节假日运行")
                    .fontWeight(.light)
            }
        }
    }
}
