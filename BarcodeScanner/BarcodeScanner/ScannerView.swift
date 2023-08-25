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
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            print(error.rawValue)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("1234"))
    }
}


// Step 1: ViewController --> communicates updates to Coordinator

// Step 2: 
