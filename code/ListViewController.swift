//
//  ListViewController.swift
//  ASTODO
//
//  Created by Berke Yakın on 19.01.2025.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true

        // Kayan Ekran Özelliği
        setupScrollableView()

        // Alt Menü Barı Oluşturma
        setupTabBar()

        // Bugün Sayfası İçin "Ekle" Butonu
        setupAddButton()
    }

    func setupTabBar() {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.delegate = self

        // Tab Bar Item'lar
        let todayItem = UITabBarItem(title: "Bugün", image: UIImage(systemName: "calendar"), tag: 0)
        let upcomingItem = UITabBarItem(title: "Yaklaşan", image: UIImage(systemName: "clock"), tag: 1)
        let searchItem = UITabBarItem(title: "Ara", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        let browseItem = UITabBarItem(title: "Göz At", image: UIImage(systemName: "list.bullet"), tag: 3)

        tabBar.items = [todayItem, upcomingItem, searchItem, browseItem]
        tabBar.selectedItem = todayItem

        view.addSubview(tabBar)

        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setupAddButton() {
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .bold) // Daha küçük boyut
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .red
        addButton.layer.cornerRadius = 32.5 // Button yarıçapı
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), // Sağ alt köşeye yakınlaştırma
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            addButton.widthAnchor.constraint(equalToConstant: 65),
            addButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }

    func setupScrollableView() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Örnek içerik ekleme
        for i in 0..<20 {
            let label = UILabel()
            label.text = "Görev \(i + 1)"
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(label)

            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(i) * 40 + 20),
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
        }
    }

    @objc func addButtonTapped() {
        print("Ekle butonuna tıklandı")
        // Daha sonra ne yapılacağını burada belirteceğiz
    }
}

extension ListViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print("Bugün seçildi")
            // Bugün ekranına geçiş yap
        case 1:
            print("Yaklaşan seçildi")
            // Yaklaşan ekranına geçiş yap
        case 2:
            print("Ara seçildi")
            // Ara ekranına geçiş yap
        case 3:
            print("Göz At seçildi")
            // Göz At ekranına geçiş yap
        default:
            break
        }
    }
}
