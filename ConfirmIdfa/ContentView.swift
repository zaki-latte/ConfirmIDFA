//
//  ContentView.swift
//  ConfirmIdfa
//
//  Created by yuta on 2024/10/14.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport


struct ConfirmIdfaView: View {
    var body: some View {
        Button{
            requestIDFA()
        }label: {
            Text("広告IDを確認する")
        }
    }
    
    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                // トラッキングが許可された場合
                let idfa = ASIdentifierManager.shared().advertisingIdentifier
                print("IDFA: \(idfa)")
            case .denied, .restricted, .notDetermined:
                // トラッキングが拒否、制限、未決定の場合
                print("トラッキングが許可されていません")
            @unknown default:
                fatalError("未知のトラッキングステータスです")
            }
        }
    }
}






