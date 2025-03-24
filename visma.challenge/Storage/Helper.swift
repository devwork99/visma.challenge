//
//  Helper.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 23/03/2025.
//

import Foundation


struct ReceiptData {
    var total: String?
    var date: String?
    var currency: String?
}


class Helper {
    
    static func extractReceiptDetails(from text: String) -> ReceiptData {
        var extractedData = ReceiptData()
        
        // Regular expressions for date, total, and currency
        let datePattern = #"\b(\d{4}[-/.]\d{2}[-/.]\d{2}|\d{2}[-/.]\d{2}[-/.]\d{2,4})\b"#
        let totalPattern = #"(Total|Val total|COMPRA|Total:)\s*([\d,.]+)"#
        let currencyPattern = #"(EUR|€|USD|\$)"#

        // Extract date
        if let match = text.range(of: datePattern, options: .regularExpression) {
            extractedData.date = String(text[match])
        }

        // Extract total
        if let totalMatch = text.range(of: totalPattern, options: .regularExpression) {
            let matchString = String(text[totalMatch])
            if let amount = matchString.split(separator: " ").last {
                extractedData.total = String(amount)
            }
        }

        // Extract currency
        if let match = text.range(of: currencyPattern, options: .regularExpression) {
            extractedData.currency = String(text[match])
        }

        return extractedData
    }
    
    
}
