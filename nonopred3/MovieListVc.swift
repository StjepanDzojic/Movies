//
//  MovieListVc.swift
//  nonopred3
//
//  Created by Elena Džojić on 26/03/2020.
//  Copyright © 2020 Stjepan Dzojic. All rights reserved.
//

import UIKit

class MovieListVc: UIViewController {
    
    var tableView = UITableView()
    var movies: [Movie] = []

    override func viewDidLoad() {
        movies = fetchData()
        tableView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        super.viewDidLoad()
        configureTableView()
        setupTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.estimatedRowHeight = 155
        tableView.rowHeight = UITableView.automaticDimension
    
        
    
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
        
    

}

extension MovieListVc: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = movies[indexPath.row]
        cell.set(movie: movie)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = movies[indexPath.row]
        let vc = MovieDescriptionVC()
        vc.titleText = item.title
        vc.image = item.image
        vc.genreText = item.genre
        vc.directorText = item.director
        vc.descriptionText = item.description
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MovieListVc{
    
    func fetchData() -> [Movie]{
     
        let movie1 = Movie(image: UIImage(named: "littleWomen")!, title: "Little Women", genre: "Drama, romance", year: "2019", director: "Greta Gerwig", description: "Jo March reflects back and forth on her life, telling the beloved story of the March sisters - four young women each determined to live life on her own terms.")
        let movie2 = Movie(image: UIImage(named: "fantasticBeasts")!, title: "Fantastic Beasts: The Crimes of Grindelwald", genre: "Adventure, fantasy, family", year: "2018", director: "David Yates", description: "The adventures of writer Newt Scamander in New York's secret community of witches and wizards seventy years before Harry Potter reads his book in school.")
        let movie3 = Movie(image: UIImage(named: "insideOut")!, title: "Inside Out", genre: "Animation, comedy, adventure", year: "2015", director: " Pete Docter", description: "After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.")
        let movie4 = Movie(image: UIImage(named: "jumanji")!, title: "Jumanji", genre: "Adventure, action", year: "2017", director: "Jake Kasdan", description: "In Jumanji: The Next Level, the gang is back but the game has changed. As they return to rescue one of their own, the players will have to brave parts unknown from arid deserts to snowy mountains, to escape the world's most dangerous game.")
        
        return [movie1, movie2, movie3, movie4]
    }
}
