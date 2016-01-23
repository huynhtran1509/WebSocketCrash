//
//  main.swift
//  WebSocketCrash
//
//  Created by Erik Little on 1/20/16.
//  Copyright © 2016 Erik Little. All rights reserved.
//

import Foundation

class TestClass : WebSocketDelegate {
    let ws = WebSocket(url: NSURL(string: "ws://localhost:8080/")!)
    
    func connect() {
        ws.delegate = self
        ws.connect()
    }
    
    deinit {
        print("test class being deinit")
    }
    
    func websocketDidConnect(socket: WebSocket) {
        print("did connect")
        for i in 0..<100 {
            ws.writeString("\(i)")
        }
        ws.writeString("end burst")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("Did disconnect")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        print("Got data")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        if text == "kill" {
            test = nil
        }
        
        print("Got message: \(text)")
    }
}

var test: TestClass? = TestClass()

test?.connect()

CFRunLoopRun()