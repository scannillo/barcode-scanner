//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Samantha Cannillo on 8/25/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    
    let title: String
    let message: String
    let dismissButton: Alert.Button
    
    let id = UUID()
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device",
                                              message:  "Something is wrong with the camera. We are unable to capture the input.",
                                              dismissButton: .default(Text("Ok")))
    
    static let invalidScanType = AlertItem(title: "Invalid Barcode",
                                           message:  "The value scanned is not valid. This app scans EAN-8 and EAN-13.",
                                           dismissButton: .default(Text("Ok")))
}
