//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Samantha Cannillo on 8/25/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    // A binding to scannedCode
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // Coordinator listens for changes from ScannerVC, to then communicate to SwiftUI view
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        // To communicate changes from Coordinator --> Swift UI view.
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScanType
            }
            print("ERROR")
        }
    }
}

// Step 1: ViewController --> communicates updates to Coordinator

// Step 2: 
