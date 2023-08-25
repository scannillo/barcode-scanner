//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Samantha Cannillo on 8/25/23.
//

import Foundation
import SwiftUI

// VMs should all be ObservableObject
final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var textColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
