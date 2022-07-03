//
//  HomeViewController.swift
//  FilmBox
//
//  Created by Ahmed Ali on 02/07/2022.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    // MARK: - Properties
    private var viewModel: HomeViewModel!
    // MARK: - init
    required init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureView()
        bind()
        viewModel.loadEpisodes()
    }
}
// MARK: - Configure Bindings
private extension HomeViewController {
    private func bind() {
        viewModel.reloadItems.observe(on: self) { [weak self] _ in self?.reloadSectionsAndData() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
    }
}
// MARK: - Configure View
//
private extension HomeViewController {
    
    /// Configure view 
    func configureView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = viewModel.screenTitle
    }
    /// Configure table view
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells(in: tableView)
    }
    /// Register Cells
    func registerCells(in tableView: UITableView) {
        tableView.register(EpisodeCell.loadNib(), forCellReuseIdentifier: EpisodeCell.classNameWithoutNamespaces)
    }
    /// Reload sections
    func reloadSectionsAndData() {
        tableView.reloadData()
    }
    /// Handle loading indicator
    func updateLoading(_ loading: Bool) {
        loading ? indicator.startAnimating() :  indicator.stopAnimating()
    }
}
// MARK: - HomeViewController + UITableViewDelegate
extension HomeViewController: UITableViewDelegate {}
// MARK: - HomeViewController + UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems(in: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.classNameWithoutNamespaces,
                                                       for: indexPath) as? EpisodeCell
        else { return UITableViewCell() }
        viewModel.configureCell(cell: cell, for: indexPath.row)
        return cell
    }
}
