//
//  ActionTestSummary.swift
//  
//
//  Created by David House on 7/5/19.
//
//- ActionTestSummary
//    * Supertype: ActionTestSummaryIdentifiableObject
//* Kind: object
//* Properties:
//+ testStatus: String
//+ duration: Double
//+ performanceMetrics: [ActionTestPerformanceMetricSummary]
//+ failureSummaries: [ActionTestFailureSummary]
//+ activitySummaries: [ActionTestActivitySummary]

import Foundation

struct ActionTestSummary: XCResultObject {

    let name: String
    let identifier: String
    let testStatus: String
    let duration: Double
    let performanceMetrics: [ActionTestPerformanceMetricSummary]
    let failureSummaries: [ActionTestFailureSummary]
    let activitySummaries: [ActionTestActivitySummary]

    init?(_ json: [String : AnyObject]) {
        do {
            name = try xcRequired(element: "name", from: json)
            identifier = try xcRequired(element: "identifier", from: json)
            testStatus = try xcRequired(element: "testStatus", from: json)
            duration = try xcRequired(element: "duration", from: json)
            performanceMetrics = xcArray(element: "performanceMetrics", from: json).compactMap { ActionTestPerformanceMetricSummary($0) }
            failureSummaries = xcArray(element: "failureSummaries", from: json).compactMap { ActionTestFailureSummary($0) }
            activitySummaries = xcArray(element: "activitySummaries", from: json).compactMap { ActionTestActivitySummary($0) }
        } catch {
            print("Error parsing ActionTestSummary: \(error.localizedDescription)")
            return nil
        }
    }
}
