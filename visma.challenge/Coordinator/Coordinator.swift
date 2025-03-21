//
//  Coordinator.swift
//  visma.challenge
//
//  Created by Muhammad Yasir on 21/03/2025.
//

import Foundation
//import UIKit

protocol Coordinator: ObservableObject {
    var navigationPath: [String] { get set }
    func start()
}
