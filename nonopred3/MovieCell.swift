//
//  MovieCell.swift
//  nonopred3
//
//  Created by Elena Džojić on 26/03/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var container : UIView = {
        let container = UIView()
        container.backgroundColor = .init(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        container.layer.cornerRadius = 20
        container.clipsToBounds = true
        
        return container
    }()
    
    var movieImageView = UIImageView()
    
    var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.init(name: "Quicksand-Bold", size: 17)
        label.textColor = .white
        //ne radi mi font i velicina, ne radi mi ni u jednom labelu
        return label
    }()
    var movieGenreLabel: UILabel = {
        let movieGenreLabel = UILabel()
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.adjustsFontSizeToFitWidth = true
        movieGenreLabel.font = UIFont.init(name: "Quicksand-Bold", size: 15)
        movieGenreLabel.textColor = .white
        
        return movieGenreLabel
    }()
    var movieYearLabel : UILabel = {
        let movieYearLabel = UILabel()
        movieYearLabel.numberOfLines = 0
        movieYearLabel.adjustsFontSizeToFitWidth = true
        movieYearLabel.font = UIFont.init(name: "Quicksand-Bold", size: 21)
        movieYearLabel.textColor = .white
        
        return movieYearLabel
    }()
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
    
    

    
    
    

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        
        
        contentView.addSubview(container)
        container.addSubview(movieImageView)
        container.addSubview(movieTitleLabel)
        container.addSubview(movieGenreLabel)
        container.addSubview(movieYearLabel)
        container.addSubview(watchedButton)
        container.addSubview(favoriteButton)
        

        
        setupContainer()
        setupTitle()
        setupImage()
        setupGenre()
        setupYear()
        setupWatched()
        setupFavorite()
        
        watchedButton.addTarget(self, action: #selector(watchedButtonTapped), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(movie: Movie){
        movieImageView.image = movie.image
        movieTitleLabel.text = movie.title
        movieGenreLabel.text = movie.genre
        movieYearLabel.text = movie.year
    }
    
    
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
         
        gradientLayer.frame = bounds
    }

    func configureImageView(){
           movieImageView.layer.cornerRadius = 10
           movieImageView.clipsToBounds = true
        
        func setupGradientLayer() {
            
               gradientLayer.colors = [UIColor.init(red: 0.106, green: 0.106, blue: 0.118, alpha: 0).cgColor, UIColor.init(red: 0.106, green: 0.106, blue: 0.118, alpha: 0.9).cgColor]
            gradientLayer.locations = [0, 0.82]
               
            movieImageView.layer.addSublayer(gradientLayer)
           }
        setupGradientLayer()
          
       }


        func setupContainer(){
            container.translatesAutoresizingMaskIntoConstraints = false
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        }
    
    func setupImage(){
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0 ).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 155).isActive = true
    }
    
    func setupTitle(){
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 15).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView
            .trailingAnchor, constant:20).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
        
    }
    
    func setupGenre(){
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        movieGenreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 0).isActive = true
        movieGenreLabel.leadingAnchor.constraint(equalTo: movieImageView
            .trailingAnchor, constant:20).isActive = true
        movieGenreLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
        
    }
    
    func setupYear(){
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -4).isActive = true
        movieYearLabel.leadingAnchor.constraint(equalTo: movieImageView
            .leadingAnchor, constant:55).isActive = true
        movieYearLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -56).isActive = true
        
    }
    
    func setupWatched(){
        watchedButton.translatesAutoresizingMaskIntoConstraints = false
        watchedButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 111).isActive = true
        watchedButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -65).isActive = true
        watchedButton.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 90).isActive = true
    }
    
    func setupFavorite(){
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 111).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
        favoriteButton.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 140).isActive = true
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
