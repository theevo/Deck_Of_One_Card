//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by theevo on 3/10/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            
            switch result {
                
            case .success(let card):
                self?.fetchImageAndUpdateViews(for: card)
            case .failure(let error):
                self?.presentErrorToUser(localizedError: error)
            }
        }
    }
    
    
    // MARK: - Helper methods
    
    func fetchImageAndUpdateViews(for card: Card) {
        CardController.fetchImage(for: card) { [weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let image):
                    self?.cardNameLabel.text = "\(card.value) of \(card.suit)"
                    self?.cardImageView.image = image
                    
                case .failure(let error):
                    self?.presentErrorToUser (localizedError: error)
                    
                }
                
            }
        }
    } // end fetchImageandUpdateViews()
    
} // end class
