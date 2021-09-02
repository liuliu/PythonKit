//===-- DateConversion.swift ---------------------------------*- swift -*-===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2018 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
//
// `PythonConvertible` conformance for Date type
//
//===----------------------------------------------------------------------===//

import Foundation

private let datetime = Python.import("datetime")

extension Date : PythonConvertible, ConvertibleFromPython {
    public init?(_ pythonObject: PythonObject) {
        guard Python.isinstance(pythonObject, datetime.datetime) == true else { return nil }
        guard let timeInterval = TimeInterval(pythonObject.timestamp()) else { return nil }
        self.init(timeIntervalSince1970: timeInterval)
    }

    public var pythonObject: PythonObject {
        _ = Python // Ensure Python is initialized.
        return datetime.datetime.fromtimestamp(timeIntervalSince1970)
    }
}
