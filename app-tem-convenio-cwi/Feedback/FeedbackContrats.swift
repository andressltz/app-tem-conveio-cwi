//
//  FeedbackContrats.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

protocol FeedbackViewType: AnyObject {
    func onFeedbackSended()
    func onFailure(error: BaseError)
}

protocol FeedbackPresenterType {
    func sendFeedback(
        withTitle title: String?,
        withRate rate: Int?,
        withComment comment: String?,
        withDate date: Date
    )
}
