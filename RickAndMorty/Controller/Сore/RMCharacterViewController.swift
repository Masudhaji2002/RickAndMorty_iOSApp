//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Масуд Гаджиев on 24.09.2023.
//

import UIKit

// контроллер вкладки панели Сharacter
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character, queryParameters: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: String.self){ result in}
    }
    
}

