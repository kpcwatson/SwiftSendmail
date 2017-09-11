//
//  Message.swift
//  SwiftSendmail
//
//  Created by Kyle Watson on 9/11/17.
//
//

import Foundation

public enum MIMEType: String, CustomStringConvertible {
    case plain = "text/plain"
    case html = "text/html"
    
    public var description: String {
        return rawValue
    }
}

public enum TransferEncoding: String, CustomStringConvertible {
    case sevenBit = "7bit"
    case quotedPrintable = "quoted-printable"
    
    public var description: String {
        return rawValue
    }
}

public protocol MIMEMessage {
    var sender: String { get }
    var recipients: [String] { get }
    var subject: String { get }
    var type: MIMEType { get }
    var transferEncoding: TransferEncoding { get }
    var body: String { get }
    var messageString: String { get }
}

extension MIMEMessage {
    public var messageString: String {
        var m = [String]()
        m.append("From: \(sender)")
        m.append("To: \(recipients.joined(separator: ", "))")
        m.append("Subject: \(subject)")
        m.append("Content-Type: \(type); charset=\"UTF-8\"")
        m.append("Content-transfer-encoding: \(transferEncoding)")
        return m.joined(separator: "\n") + "\n\n\(body)"
    }
}
