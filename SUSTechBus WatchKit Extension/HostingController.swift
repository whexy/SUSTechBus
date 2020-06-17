//
//  HostingController.swift
//  SUSTechBus WatchKit Extension
//
//  Created by 石文轩 on 2020/6/17.
//  Copyright © 2020 石文轩. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<BusView> {
    override var body: BusView {
        return BusView()
    }
}
