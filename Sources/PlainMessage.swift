//
//  PlainMessage.swift
//  SwiftSendmail
//
//  Created by Kyle Watson on 9/11/17.
//
//

import Foundation

public struct PlainMessage: MIMEMessage {
    public let type = MIMEType.plain
    public let sender: String
    public let recipients: [String]
    public let subject: String
    public let body: String
    
    public init(sender: String, recipients: [String], subject: String, body: String) {
        self.sender = "<" + sender + ">"
        self.recipients = recipients.map { "<" + $0 + ">" }
        self.subject = subject
        self.body = body
    }
}
