//
//  Message.swift
//  SwiftSendmail
//
//  Created by Kyle Watson on 9/11/17.
//
//

import Foundation

public enum MIMEType: String {
    case plain = "text/plain"
    case html = "text/html"
}

extension MIMEType: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}

public protocol MIMEMessage: CustomStringConvertible {
    var sender: String { get }
    var recipients: [String] { get }
    var subject: String { get }
    var type: MIMEType { get }
    var body: String { get }
}

extension MIMEMessage {
    public var description: String {
        var m = [String]()
        m.append("From: \(sender)")
        m.append("To: \(recipients.joined(separator: ", "))")
        m.append("Subject: \(subject)")
        m.append("Content-Type: \(type); charset=\"UTF-8\"")
        return m.joined(separator: "\n") + "\n\n\(body)"
    }
}
