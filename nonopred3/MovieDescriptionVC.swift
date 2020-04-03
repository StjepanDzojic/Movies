//
//  MovieDescriptionVC.swift
//  nonopred3
//
//  Created by Elena Džojić on 31/03/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import UIKit
import SnapKit

class MovieDescriptionVC: UIViewController {
    
    
    var movieImageView = UIImageView()
    var movieTitleLabel : UILabel = {
        let movieTitleLabel = UILabel()
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.font = UIFont.init(name: "Quicksand-Medium", size: 29)
        movieTitleLabel.textColor = .white
        
        //isto mi ne radi font i velicina
        
        return movieTitleLabel
    }()
    var movieGenreLabel: UILabel = {
        let movieGenreLabel = UILabel()
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.adjustsFontSizeToFitWidth = true
        movieGenreLabel.font = UIFont.init(name: "Quicksand-Regular", size: 21)
        movieGenreLabel.textColor = .white
        
        return movieGenreLabel
    }()
    var movieDirectorLabel : UILabel = {
        let movieDirectorLabel = UILabel()
        movieDirectorLabel.numberOfLines = 0
        movieDirectorLabel.adjustsFontSizeToFitWidth = true
        movieDirectorLabel.font = UIFont.init(name: "Quicksand-Regular", size: 21)
        movieDirectorLabel.textColor = .white
        
        return movieDirectorLabel
    }()
    var movieDescriptionLabel: UILabel = {
        let movieDescriptionLabel = UILabel()
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.adjustsFontSizeToFitWidth = true
        movieDescriptionLabel.font = UIFont.init(name: "Quicksand-Regular", size: 21)
        movieDescriptionLabel.textColor = .white
        
        return movieDescriptionLabel
    }()
    
    var watchedButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "watchedButton"), for: .normal)
            button.setImage(UIImage(named: "watchedButtonTaped"), for: .selected)
            return button
        
        //nisam napravio da ako stisnem button na 1. controlleru, da mi bude i na drugom, i ne radi mi dobro buttoni na 2.
        
        }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "favoriteButton"), for: .normal)
        button.setImage(UIImage(named: "favoriteButtonTaped"), for: .selected)
        return button
    }()
    
    var titleText = ""
    var image = UIImage()
    var genreText = ""
    var directorText = ""
    var descriptionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        

        movieImageView.image = image
        movieTitleLabel.text = titleText
        movieGenreLabel.text = genreText
        movieDirectorLabel.text = "Director: \(directorText)"
        movieDescriptionLabel.text = descriptionText


        
       
        
        
        view.addSubview(movieImageView)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieGenreLabel)
        view.addSubview(movieDirectorLabel)
        view.addSubview(movieDescriptionLabel)
        movieImageView.addSubview(watchedButton)
        movieImageView.addSubview(favoriteButton)
        
        setupImage()
        setupTitle()
        setupGenre()
        setupDirector()
        setupDescription()
        setupWatched()
        setupFavorite()
        
        watchedButton.addTarget(self, action: #selector(watchedButtonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    func setupImage(){
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0 ).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 255).isActive = true
    }
    
    func setupTitle(){

        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 15).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: view
            .leadingAnchor, constant:25).isActive = true
         movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
       
        
    }
    
    func setupGenre(){
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        movieGenreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 7).isActive = true
        movieGenreLabel.leadingAnchor.constraint(equalTo: view
            .leadingAnchor, constant:25).isActive = true
         movieGenreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        
    }
    func setupDirector(){
        movieDirectorLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDirectorLabel.topAnchor.constraint(equalTo: movieGenreLabel.bottomAnchor, constant: 7).isActive = true
        movieDirectorLabel.leadingAnchor.constraint(equalTo: view
            .leadingAnchor, constant:25).isActive = true
         movieDirectorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
    }
    
    func setupDescription(){
        /*movieDescriptionLabel.snp.makeConstraints { (maker) in
            ((maker.top.equalTo(movieDirectorLabel.safeAreaLayoutGuide.snp.bottom).inset(7)
        }*/
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieDirectorLabel.bottomAnchor, constant: 7).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: view
            .leadingAnchor, constant: 25).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true

        
    }
    
    func setupWatched(){
        watchedButton.translatesAutoresizingMaskIntoConstraints = false
        watchedButton.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 46).isActive = true
        watchedButton.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -75).isActive = true
        watchedButton.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 284).isActive = true
    }
    
    func setupFavorite(){
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 46).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -15).isActive = true
        favoriteButton.leadingAnchor.constraint(equalTo: watchedButton.trailingAnchor, constant: 24).isActive = true    }
    
    @objc func watchedButtonTapped(){
        if watchedButton.isSelected == true {
            watchedButton.isSelected = false
        }else {
            watchedButton.isSelected = true
        }
    }
    
    @objc func favoriteButtonTapped(){
        if favoriteButton.isSelected == true {
            favoriteButton.isSelected = false
        }else {
            favoriteButton.isSelected = true
        }
    }
    
    
    
    
    
    
    
    
}
