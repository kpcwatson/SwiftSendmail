//
//  Sendmail.swift
//  SwiftSendmail
//
//  Created by Kyle Watson on 9/11/17.
//
//

import Foundation
import SwiftLogger

public class Sendmail {
    
    let path: String
    
    public init(executablePath: String = "/usr/sbin/sendmail") {
        Logger.debug("sendmail path \(executablePath)")
        self.path = executablePath
    }
    
    public func send(message: MIMEMessage) {
        Logger.debug("sending mail \(message.subject)")
        
        let process = Process()
        process.launchPath = path
        process.arguments = ["-t", "-oi"]
        
        let pipe = Pipe()
        process.standardInput = pipe
        
        guard let data = message.messageString.data(using: .utf8) else {
            Logger.error("unable to construct message data")
            return
        }
        
        pipe.fileHandleForWriting.write(data)
        process.launch()
    }
}
