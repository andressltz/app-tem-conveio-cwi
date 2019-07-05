//
//  FeedbackPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

class FeedbackPresenter: NSObject {
    
    weak var view: FeedbackViewType?
    
    var establishmentUID: String?
    private lazy var requestsHandler = RequestsHandler()


    func sendFeedback(feedbackParams: [String: Any?]) {
        self.requestsHandler.make(withEndpoint: .sendFeedback(establishmentUID: establishmentUID!), completion: {(result) in
            guard case .success(_) = result else {
                if case let .failure(error) = result {
                    self.view?.onFailure(error: error)
                }
                return
            }
            self.view?.onFeedbackSended()
        })
    }
    
    private func handleError(error: BaseError) {
        DispatchQueue.main.async {
            self.view?.onFailure(error: error)
        }
    }
    
}

extension FeedbackPresenter: FeedbackPresenterType {
    
    func sendFeedback(withTitle title: String?,
                      withRate rate: Int?,
                      withComment comment: String?,
                      withDate date: Date) {
        
        guard let title = title, !title.isEmpty else {
            self.handleError(error: ValidationError.title)
            return
        }
        
        guard let rate = rate, rate != 0 else {
            self.handleError(error: ValidationError.rate)
            return
        }
        
        guard let comment = comment, !comment.isEmpty else {
            self.handleError(error: ValidationError.commentary)
            return
        }
        
        var feedbackParams: [String: Any?] = [:]
        feedbackParams["uid"] = establishmentUID
        feedbackParams["title"] = title
        feedbackParams["comment"] = comment
        feedbackParams["rate"] = rate
        feedbackParams["date"] = date
        feedbackParams["user"] = Session.instance.loggedUser!
        
    }
}

extension FeedbackPresenter {
    
    enum ValidationError: BaseError {
        
        case title
        case rate
        case commentary
        
        var title: String {
            switch self {
            case .title:
                return "Titulo Inválido!"
            case .rate:
                return "Nenhuma Estrela?"
            case .commentary:
                return "Comentário Inválido!"
            }
        }
        
        var message: String {
            switch self {
            case .title:
                return "Por favor, preencha o campo título."
            case .rate:
                return "É necessário marcar pelo menos uma estela para o estabelecimento."
            case .commentary:
                return "É necessário fazer um comentário sobre o estabelecimento."
            }
        }
    }
}

