//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Масуд Гаджиев on 24.09.2023.
//

import UIKit

// Контролер панели вкладок
final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    //функция настройки контроллеров просмотра (типо инициализации как в андроид студио)
    final func setUpTabs(){
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        //режим отоброжения большого заголовка будет автомотическим
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic

        
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        //создание иконок
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "play.tv.fill"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 4)

        
        for nav in [nav1, nav2, nav3, nav4]{
            //nav - навигатор .navigationBar - панель навигации .prefersLargeTitles - опция крупных заголовков
            nav.navigationBar.prefersLargeTitles = true
        }

        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }
}

