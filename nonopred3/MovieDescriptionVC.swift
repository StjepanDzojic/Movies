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
    var movieTitleLabel = UILabel()
    var movieGenreLabel = UILabel()
    var movieDirectorLabel = UILabel()
    var movieDescriptionLabel = UILabel()
    var watchedButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "watchedButton"), for: .normal)
            button.setImage(UIImage(named: "watchedButtonTaped"), for: .selected)
            return button
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
        
       
        
        
        view.addSubview(movieImageView)
        view.addSubview(movieTitleLabel)
        view.addSubview(movieGenreLabel)
        view.addSubview(movieDirectorLabel)
        view.addSubview(movieDescriptionLabel)
        movieImageView.addSubview(watchedButton)
        movieImageView.addSubview(favoriteButton)
        
        
        
        configureTitleLabel()
        configureGenreLabel()
        configureDirectorLabel()
        configureDescriptionLabel()
        
        
        setupImage()
        setupTitle()
        setupGenre()
        setupDirector()
        setupDescription()
        setupWatched()
        setupFavorite()
    }
    
    /*func set(movie: Movie){
        movieImageView.image = movie.image
        movieTitleLabel.text = movie.title
        movieGenreLabel.text = movie.genre
        movieDirectorLabel.text = movie.director
        movieDescriptionLabel.text = movie.description
    }*/
    
    func configureTitleLabel(){
        movieTitleLabel.text = titleText
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.font = UIFont.init(name: "Quicksand-Bold", size: 21)
        movieTitleLabel.textColor = .white
       
       }
    
    func configureGenreLabel(){
        movieGenreLabel.text = genreText
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.adjustsFontSizeToFitWidth = true
        movieGenreLabel.font = UIFont.init(name: "Quicksand-Bold", size: 15)
        movieGenreLabel.textColor = .white
        
    }
    
    func configureDirectorLabel(){
            movieDirectorLabel.text = "Director: \(directorText)"
            movieDirectorLabel.numberOfLines = 0
            movieDirectorLabel.adjustsFontSizeToFitWidth = true
            movieDirectorLabel.font = UIFont.init(name: "Quicksand-Bold", size: 21)
            movieDirectorLabel.textColor = .white
          
      }
    
    func configureDescriptionLabel(){
        movieDescriptionLabel.text = descriptionText
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.adjustsFontSizeToFitWidth = true
        movieDescriptionLabel.font = UIFont.init(name: "Quicksand-Bold", size: 21)
        movieDescriptionLabel.textColor = .white
        
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
        //movieDescriptionLabel.snp.makeConstraints { (maker) in
            //((maker.top.equalTo(movieDirectorLabel.safeAreaLayoutGuide.snp.bottom).inset(7)
        //}
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieDirectorLabel.bottomAnchor, constant: 7).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: view
            .leadingAnchor, constant: 25).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true

        
    }
    
    func setupWatched(){
        watchedButton.translatesAutoresizingMaskIntoConstraints = false
        watchedButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 46).isActive = true
        watchedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75).isActive = true
        watchedButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 284).isActive = true
    }
    
    func setupFavorite(){
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 46).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        favoriteButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 325).isActive = true
    }
    
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
